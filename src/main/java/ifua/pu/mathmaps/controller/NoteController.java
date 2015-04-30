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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Controller
@RequestMapping("/note")
public class NoteController {

    private static final Logger log = Logger.getLogger(NoteController.class);

    @Autowired
    private NoteService noteService;

    @Autowired
    private UserNoteService userNoteService;

    @RequestMapping(value = { "/", "/listNotes" })
    public String listNotes(Map<String, Object> map) {
        map.put("noteList", noteService.getNotesWithStatus(2));

        return "note/noteList";
    }

    @RequestMapping("/page/{noteId}")
    public String getNotePage(@PathVariable int noteId, Map<String, Object> map) {
        Note note = noteService.getNote(noteId);
        map.put("note", note);

        return "note/notePage";
    }

    @RequestMapping("/get/{noteId}")
    public String getNote(@PathVariable int noteId, Map<String, Object> map) {
        Note note = noteService.getNote(noteId);
        map.put("note", note);

        return "/note/noteForm";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addNote(
            @ModelAttribute("note") Note note,
            BindingResult result,
            @RequestParam int typeId,
            @RequestParam int status,
            @RequestParam String higherNotesStr,
            @RequestParam String lowerNotesStr ){

        linkNotes(note, higherNotesStr, note.getHigherNotes());
        linkNotes(note, lowerNotesStr, note.getLowerNotes());
        note.setType(noteService.getNoteType(typeId));
        note.setPublishingStatus(0);

        noteService.saveNote(note);

        int noteId = noteService.getNoteByName(note.getName()).getNoteId();
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

    @RequestMapping("/user/add/{noteId}")
    public String addNoteToUserSet(@PathVariable int noteId){
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        log.debug("Security context returns name " + username);

        log.debug("Adding the note for the user " + username);
        userNoteService.addWithParams(noteId, username, 1);
        log.debug("Added successful");

        return "redirect:/user/page/" + username;
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

    private void linkNotes(Note note, String associatedNotesStr, Set<Note> associatedNotes) {
        String[] assocNotesNames = associatedNotesStr.split(",");
        for (String name : assocNotesNames) {
            log.debug("Creating an association between note " + note.getName() + " and note " + name);
            if (!name.equals("")) {
                Note assocNote = noteService.getNoteByName(name);
                if (assocNote.getName()!=null) {
                    associatedNotes.add(assocNote);
                }
            }
        }
    }
}
