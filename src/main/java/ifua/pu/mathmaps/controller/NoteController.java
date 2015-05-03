package ifua.pu.mathmaps.controller;

import ifua.pu.mathmaps.model.Note;
import ifua.pu.mathmaps.model.NoteType;
import ifua.pu.mathmaps.model.UserNote;
import ifua.pu.mathmaps.service.NoteService;
import ifua.pu.mathmaps.service.UserNoteService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@Controller
@RequestMapping("/note")
public class NoteController {

    private static final Logger log = Logger.getLogger(NoteController.class);

    public static final String NOTE_TYPES = "noteTypes";
    public static final String NOTE_LIST = "noteList";
    public static final String NOTE = "note";
    public static final String IS_ADDED = "isAdded";
    public static final String ALL_NOTES = "allNotes";
    public static final String LOWER_IDS = "lowerIds";
    public static final String HIGHER_IDS = "higherIds";
    public static final String CURRENT_TYPE = "currentType";
    public static final String CURRENT_STATUS = "currentStatus";

    @Autowired
    private NoteService noteService;

    @Autowired
    private UserNoteService userNoteService;

    @RequestMapping(value = { "/", "/listNotes" })
    public String listNotes(Map<String, Object> map) {
        map.put(NOTE_LIST, noteService.getNotesWithStatus(2));

        return "note/noteList";
    }

    @RequestMapping("/page/{noteId}")
    public String getNotePage(@PathVariable int noteId, Map<String, Object> map) {
        boolean isAdded = false;
        if (SecurityContextHolder.getContext().getAuthentication() != null){
            String username = SecurityContextHolder.getContext().getAuthentication().getName();
            if (userNoteService.getUserNote(noteId, username) != null) {
                isAdded = true;
            }
        }

        Note note = noteService.getNote(noteId);
        map.put(NOTE, note);
        map.put(IS_ADDED, isAdded);

        return "note/notePage";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addNote(
            @ModelAttribute("note") Note note,
            BindingResult result,
            @RequestParam int typeId,
            @RequestParam int status,
            @RequestParam(value = "higher", required = false) Integer[] higher,
            @RequestParam(value = "lower", required = false) Integer[] lower ){

        linkNotes(note, higher, note.getHigherNotes());
        linkNotes(note, lower, note.getLowerNotes());
        note.setType(noteService.getNoteType(typeId));
        note.setPublishingStatus(0);

        int noteId = noteService.saveNote(note).getNoteId();
        log.debug("Got the note with id " + noteId);

        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        log.debug("Security context returns name " + username);

        log.debug("Adding the note for the user " + username);
        userNoteService.addWithParams(noteId, username, status);
        log.debug("Added successful");

        return "redirect:/user/page/" + username;
    }

//    @PreAuthorize("hasRole('ADMIN')")
    @RequestMapping("/delete/{noteId}")
    public String deleteNote(@PathVariable("noteId") int noteId) {
        noteService.deleteNote(noteId);

        return "redirect:/note/listNotes";
    }

    @RequestMapping("/edit/{noteId}")
    public String getEditNotePage(@PathVariable("noteId") int noteId, ModelMap map) {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        Note note = noteService.getNote(noteId);
        String lowerIdsStr = toIdArray(note.getLowerNotes());
        String higherIdsStr = toIdArray(note.getHigherNotes());

        List<UserNote> userNotes = userNoteService.listByUser(username);
        List<Note> allUserNotes = new ArrayList<Note>();
        int currentStatus = userNoteService.getUserNote(noteId, username).getStatus();

        for (UserNote un : userNotes) {
            allUserNotes.add(un.getNote());
        }

        map.addAttribute(NOTE, note);
        map.addAttribute(CURRENT_TYPE, note.getType().getNoteTypeId());
        map.addAttribute(CURRENT_STATUS, currentStatus);
        map.addAttribute(NOTE_TYPES, noteService.getNoteTypes());
        map.addAttribute(ALL_NOTES, allUserNotes);
        map.addAttribute(LOWER_IDS, lowerIdsStr);
        map.addAttribute(HIGHER_IDS, higherIdsStr);

        return "note/noteEdit";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updateNote(
            @ModelAttribute("note") Note note,
            BindingResult result,
            @RequestParam int typeId,
            @RequestParam int status,
            @RequestParam(value = "higher", required = false) Integer[] higher,
            @RequestParam(value = "lower", required = false) Integer[] lower ){

        linkNotes(note, higher, note.getHigherNotes());
        linkNotes(note, lower, note.getLowerNotes());
        note.setType(noteService.getNoteType(typeId));
        note.setPublishingStatus(0);

        int noteId = noteService.saveNote(note).getNoteId();
        log.debug("Got the note with id " + noteId);

        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        log.debug("Security context returns name " + username);

        UserNote userNote = userNoteService.getUserNote(noteId, username);
        userNote.setStatus(status);
        userNoteService.saveUserNote(userNote);

        return "redirect:/note/page/" + noteId;
    }

    @RequestMapping("/offer/{noteId}")
    public String offerNoteForPublishing(@PathVariable int noteId){
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        log.debug("Security context returns name " + username);

//        log.debug("Adding the note for the user " + username);
        Note note = noteService.getNote(noteId);
        note.setPublishingStatus(1);
        noteService.saveNote(note);
//        log.debug("Added successful");

        return "redirect:/user/page/" + username;
    }

    @RequestMapping("/publish/{noteId}")
    public String publishNote(@PathVariable int noteId){
        Note note = noteService.getNote(noteId);
        note.setPublishingStatus(2);
        noteService.saveNote(note);

        return "redirect:/user/admin";
    }

    @RequestMapping("/deny/{noteId}")
    public String denyNotePublishing(@PathVariable int noteId){
        Note note = noteService.getNote(noteId);
        note.setPublishingStatus(3);
        noteService.saveNote(note);

        return "redirect:/user/admin";
    }

    @RequestMapping("/user/add/{noteId}")
    public String addNoteToUserSet(@PathVariable int noteId){
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        log.debug("Security context returns name " + username);

        log.debug("Adding the note for the user " + username);
        userNoteService.addWithParams(noteId, username, 1);
        log.debug("Added successful");

        return "redirect:/note/page/" + noteId;
    }

    @RequestMapping("/user/delete/{noteId}")
    public String deleteNoteFromUserSet(@PathVariable int noteId){
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        log.debug("Security context returns name " + username);

        log.debug("Deleting the note from the user " + username + " list.");
        Note note = noteService.getNote(noteId);
        if (note.getPublishingStatus() == 2 ){
            userNoteService.deleteUserNote(noteId, username);
        } else {
            noteService.deleteNote(noteId);
        }
        log.debug("Deleted successful");

        return "redirect:/user/page/" + username;
    }

    private void linkNotes(Note note, Integer[] assocNotesIds, Set<Note> associatedNotes) {
        if (assocNotesIds != null){
            for (int id : assocNotesIds) {
                Note assocNote = noteService.getNote(id);
                log.debug("Creating an association between note " + note.getName() + " and note " + assocNote.getName());
                associatedNotes.add(assocNote);
            }
        }
    }

    public static String toIdArray(Set<Note> noteSet) {
        StringBuffer sb = new StringBuffer();
        sb.append("[");
        String prefix = "";
        for (Note n : noteSet) {
            sb.append(prefix);
            prefix = ",";
            sb.append(n.getNoteId());
        }
        sb.append("]");
        return sb.toString();
    }
}
