package ifua.pu.mathmaps.controller;

import ifua.pu.mathmaps.model.Note;
import ifua.pu.mathmaps.service.NoteService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/maps")
public class MapController {

    private static final Logger log = Logger.getLogger(MapController.class);
    public static final String H_NAMES = "hNames";
    public static final String NOTE_NAME = "noteName";
    public static final String L_NAMES = "lNames";

    @Autowired
    private NoteService noteService;

    @RequestMapping("/")
    public String getMapsPage(Map<String, Object> map) {


        return "map/globalMap";
    }

    @RequestMapping("/{noteId}")
    public String getNoteMap(@PathVariable int noteId, ModelMap map) {
        Note note = noteService.getNote(noteId);

        ArrayList<Note> hNotes = new ArrayList<Note>(note.getHigherNotes());
        ArrayList<Note> lNotes = new ArrayList<Note>(note.getLowerNotes());

        String hNames = toJavascriptArray(hNotes);
        String lNames = toJavascriptArray(lNotes);

        map.addAttribute(NOTE_NAME, note.getName());
        map.addAttribute(H_NAMES, hNames);
        map.addAttribute(L_NAMES, lNames);

        return "note/noteMap";
    }

    public static String toJavascriptArray(ArrayList<Note> arr){
        StringBuffer sb = new StringBuffer();
        sb.append("[");
        for(int i=0; i<arr.size(); i++){
            sb.append("\"").append(arr.get(i).getName()).append("\"");
            if(i+1 < arr.size()){
                sb.append(",");
            }
        }
        sb.append("]");
        return sb.toString();
    }
}
