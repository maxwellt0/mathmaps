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
    public static final String L_TYPES = "lTypes";
    public static final String H_TYPES = "hTypes";
    public static final String NAMES = "names";
    public static final String LINKS = "links";

    @Autowired
    private NoteService noteService;

    @RequestMapping("/")
    public String getMapsPage(ModelMap map) {
        List<Note> notes = noteService.getNotesWithStatus(0);
        String names = toNamesArray(notes);
        log.debug("names = " + names);
        String links = toLinksArray(notes);
        log.debug("links = " + links);

        map.addAttribute(NAMES, names);
        map.addAttribute(LINKS, links);

        return "map/globalMap";
    }

    @RequestMapping("/{noteId}")
    public String getNoteMap(@PathVariable int noteId, ModelMap map) {
        Note note = noteService.getNote(noteId);

        List<Note> hNotes = new ArrayList<Note>(note.getHigherNotes());
        List<Note> lNotes = new ArrayList<Note>(note.getLowerNotes());

        String hNames = toNamesArray(hNotes);
        String lNames = toNamesArray(lNotes);
        int[] hTypes = toTypesArray(hNotes);
        int[] lTypes = toTypesArray(lNotes);

        map.addAttribute(NOTE_NAME, note.getName());
        map.addAttribute(H_NAMES, hNames);
        map.addAttribute(L_NAMES, lNames);
        map.addAttribute(H_TYPES, hTypes);
        map.addAttribute(L_TYPES, lTypes);

        return "note/noteMap";
    }

    public static String toNamesArray(List<Note> arr){
        StringBuffer sb = new StringBuffer();
        sb.append("[");
        for(int i=0; i<arr.size(); i++){
            sb.append("{\"key\":\"").append(arr.get(i).getName());
            switch (arr.get(i).getType().getNoteTypeId()) {
                case 1 : sb.append("\",\"color\":\"#337ab7");
                    break;
                case 2 : sb.append("\",\"color\":\"#5cb85c");
                    break;
                case 3 : sb.append("\",\"color\":\"#5bc0de");
                    break;
                case 4 : sb.append("\",\"color\":\"#f0ad4e");
                    break;
                case 5 : sb.append("\",\"color\":\"#d9534f");
                    break;
                case 6 : sb.append("\",\"color\":\"#9900CC");
                    break;
                case 7: sb.append("\",\"color\":\"#99FF66");
                    break;
                case 8: sb.append("\",\"color\":\"#FFFF00");
                    break;
                default: sb.append("\",\"color\":\"#abcdff");
            }
            sb.append("\"}");
            if(i+1 < arr.size()){
                sb.append(",");
            }
        }
        sb.append("]");
        return sb.toString();
    }

    public static String toLinksArray(List<Note> arr){
        StringBuffer sb = new StringBuffer();
        sb.append("[");
        String prefix="";
        for(int i=0; i<arr.size(); i++){
            for (Note n : arr.get(i).getHigherNotes()) {
                sb.append(prefix);
                prefix = ",";
                sb.append("{\"from\":\"").append(n.getName())
                        .append("\",\"to\":\"").append(arr.get(i).getName())
                        .append("\"}");
            }
        }
        sb.append("]");

        return sb.toString();
    }

    public int[] toTypesArray(List<Note> arr){
        int[] types = new int[arr.size()];
        for (int i=0; i<arr.size(); i++) {
            types[i] = arr.get(i).getType().getNoteTypeId();
        }

        return types;
    }
}
