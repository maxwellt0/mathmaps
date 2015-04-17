package ifua.pu.mathmaps.controller;

import ifua.pu.mathmaps.model.Note;
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
    public String saveNote(@ModelAttribute("note") Note note,
                           BindingResult result) {
        List<Note> list = noteService.listNotes();
        Set<Note> set = new HashSet<Note>();

        for (Note n : list){
            System.out.println("-----" +n);
            set.add(n);
            for (Note lower : n.getLowerNotes()){
                System.out.print("--<");
                System.out.println(lower);
            }
        }
        note.setHigherNotes(set);
        note.setLowerNotes(set);
        noteService.saveNote(note);

        return "redirect:listNotes";
    }

    @RequestMapping("/delete/{noteId}")
    public String deleteNote(@PathVariable("noteId") int noteId) {
        noteService.deleteNote(noteId);

        return "redirect:/note/listNotes";
    }
}
