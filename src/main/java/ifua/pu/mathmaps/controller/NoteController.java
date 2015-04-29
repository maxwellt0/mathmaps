package ifua.pu.mathmaps.controller;

import ifua.pu.mathmaps.model.Note;
import ifua.pu.mathmaps.model.NoteType;
import ifua.pu.mathmaps.service.NoteService;
import org.springframework.beans.factory.annotation.Autowired;
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

    @Autowired
    private NoteService noteService;

    @RequestMapping(value = { "/", "/listNotes" })
    public String listNotes(Map<String, Object> map) {
        map.put("note", new Note());
        map.put("noteList", noteService.listNotes());

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

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String saveNote(
            @ModelAttribute("note") Note note,
            BindingResult result,
            @RequestParam String higherNotesStr,
            @RequestParam String lowerNotesStr ){

        String[] higherNotesNames = higherNotesStr.split(",");
        for (String name : higherNotesNames) {
            System.out.println("213123");
            if (!name.equals("")) {
                Note hNote = noteService.getNoteByName(name);
                if (hNote.getName()!=null) {
                    note.getHigherNotes().add(hNote);
                }
            }
        }
        String[] lowerNotesNames = lowerNotesStr.split(",");
        for (String name : lowerNotesNames) {
            if (!name.equals("")) {
                System.out.println("45345345345");
                Note lNote = noteService.getNoteByName(name);
                if (lNote.getName()!=null) {
                    note.getLowerNotes().add(lNote);
                }
            }
        }
        note.setPublishingStatus(0);
        note.setType(new NoteType(1, "Означення"));
        noteService.saveNote(note);

        return "redirect:listNotes";
    }

    @RequestMapping("/delete/{noteId}")
    public String deleteNote(@PathVariable("noteId") int noteId) {
        noteService.deleteNote(noteId);

        return "redirect:/note/listNotes";
    }
}
