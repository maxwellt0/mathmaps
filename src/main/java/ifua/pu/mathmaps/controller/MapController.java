package ifua.pu.mathmaps.controller;

import ifua.pu.mathmaps.model.Note;
import ifua.pu.mathmaps.service.NoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/maps")
public class MapController {

    @Autowired
    private NoteService noteService;

    @RequestMapping(value = "/")
    public String getMapsPage(Map<String, Object> map) {

        return "map/globalMap";
    }

    @RequestMapping("/{noteId}")
    public String getNoteMap(@PathVariable int noteId, Map<String, Object> map) {
        Note note = noteService.getNote(noteId);
        map.put("noteName", note.getName());

        int higherCount = note.getHigherNotes().size();
        List<Note> noteList = new ArrayList<Note>();
        for (Note n : note.getHigherNotes()) {
            noteList.add(n);
        }

        String higherNames = new String();
        for (int i=0; i<higherCount; i++){
            higherNames+= noteList.get(i).getName() + "~";
        }
        if (higherCount>0){
            higherNames = higherNames.substring(0, higherNames.length()-1);
        }
        map.put("higherNames", higherNames);
        System.out.println(higherNames);

        return "note/noteMap";
    }
}
