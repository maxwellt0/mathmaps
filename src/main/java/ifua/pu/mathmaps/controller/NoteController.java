package ifua.pu.mathmaps.controller;

import ifua.pu.mathmaps.model.Note;
import ifua.pu.mathmaps.service.NoteService;
import ifua.pu.mathmaps.util.LatexRender;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;

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

        for (Note n : list){
            System.out.println(n);
            for (Note lower : n.getLowerNotes()){
                System.out.print("--<");
                System.out.println(lower);
            }
        }
        return "/note/listNotes";
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
        note.setHigherNotes(list);
//        note.setLowerNotes(list);
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

    @RequestMapping(method=RequestMethod.GET, value="/image/{noteId}.png")
    @ResponseBody
    public byte[] getImage(@PathVariable("noteId") int noteId) {
        Note note = noteService.getNote(noteId);
        String text = note.getText();
        LatexRender latexRender = new LatexRender();
        BufferedImage image = latexRender.render(note.getText());
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        try {
            ImageIO.write(image, "png", baos);
            baos.flush();
            byte[] imageInByte = baos.toByteArray();
            baos.close();
            return imageInByte;
        } catch (IOException e) {
            System.out.println(e.getMessage());
            return new byte[1];
        }
    }
}
