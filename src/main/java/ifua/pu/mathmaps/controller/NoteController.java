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

/**
 * Created by Maxwellt on 11.04.2015.
 */
@Controller
@RequestMapping("/note")
public class NoteController {

    @Autowired
    private NoteService noteService;

    @RequestMapping(value = { "/", "/listNotes" })
    public String listNotes(Map<String, Object> map) {
        map.put("note", new Note());

        List<Note> list = noteService.listNotes();

        map.put("noteList", list);

//        for (Note n : list){
//            System.out.println(n);
//            for (Note lower : n.getLowerNotes()){
//                System.out.print("--<");
//                System.out.println(lower);
//            }
//        }
        return "note/noteList";
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

              /*
               * Note that there is no slash "/" right after "redirect:"
               * So, it redirects to the path relative to the current path
               */
        return "redirect:listNotes";
    }

    @RequestMapping("/delete/{noteId}")
    public String deleteNote(@PathVariable("noteId") int noteId) {

        noteService.deleteNote(noteId);

              /*
               * redirects to the path relative to the current path
               */
        // return "redirect:../listNotes";

              /*
               * Note that there is the slash "/" right after "redirect:"
               * So, it redirects to the path relative to the project root path
               */
        return "redirect:/note/listNotes";
    }
}
