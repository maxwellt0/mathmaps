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

    public static final String NAMES = "names";
    public static final String LINKS = "links";

    @Autowired
    private NoteService noteService;

    @RequestMapping("/")
    public String getGlobalMap(ModelMap map) {
        List<Note> notes = noteService.getNotesWithStatus(2);
        String names = toNodesArray(notes);
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
        List<Note> notes = new ArrayList<Note>();
        notes.addAll(note.getLowerNotes());
        notes.addAll(note.getHigherNotes());
        notes.add(note);
        String nodes = toNodesArray(notes);
        String links = noteLinksToArray(note);

        map.addAttribute(NAMES, nodes);
        map.addAttribute(LINKS, links);

        return "map/noteMap";
    }

    public static String toNodesArray(List<Note> arr) {
        StringBuffer sb = new StringBuffer();
        sb.append("[");
        for (int i = 0; i < arr.size(); i++) {
            sb.append("{\"key\":\"").append(arr.get(i).getNoteId())
                    .append("\",\"name\":\"").append(arr.get(i).getName());
            switch (arr.get(i).getType().getNoteTypeId()) {
                case 1:
                    sb.append("\",\"color\":\"#337ab7");
                    break;
                case 2:
                    sb.append("\",\"color\":\"#5cb85c");
                    break;
                case 3:
                    sb.append("\",\"color\":\"#5bc0de");
                    break;
                case 4:
                    sb.append("\",\"color\":\"#f0ad4e");
                    break;
                case 5:
                    sb.append("\",\"color\":\"#d9534f");
                    break;
                case 6:
                    sb.append("\",\"color\":\"#9900CC");
                    break;
                case 7:
                    sb.append("\",\"color\":\"#99FF66");
                    break;
                case 8:
                    sb.append("\",\"color\":\"#FFFF00");
                    break;
                default:
                    sb.append("\",\"color\":\"#abcdff");
            }
            sb.append("\"}");
            if (i + 1 < arr.size()) {
                sb.append(",");
            }
        }
        sb.append("]");
        return sb.toString();
    }

    public static String toLinksArray(List<Note> arr) {
        StringBuffer sb = new StringBuffer();
        sb.append("[");
        String prefix = "";
        for (int i = 0; i < arr.size(); i++) {
            for (Note n : arr.get(i).getHigherNotes()) {
                sb.append(prefix);
                prefix = ",";
                sb.append("{\"from\":\"").append(n.getNoteId())
                        .append("\",\"to\":\"").append(arr.get(i).getNoteId())
                        .append("\"}");
            }
        }
        sb.append("]");

        return sb.toString();
    }

    public static String noteLinksToArray(Note note) {
        StringBuffer sb = new StringBuffer();
        sb.append("[");
        String prefix = "";
        for (Note n : note.getHigherNotes()) {
            sb.append(prefix);
            prefix = ",";
            sb.append("{\"from\":\"").append(n.getNoteId())
                    .append("\",\"to\":\"").append(note.getNoteId())
                    .append("\"}");
        }
        prefix = ",";
        for (Note n : note.getLowerNotes()) {
            sb.append(prefix);
            sb.append("{\"from\":\"").append(note.getNoteId())
                    .append("\",\"to\":\"").append(n.getNoteId())
                    .append("\"}");
        }
        sb.append("]");

        return sb.toString();
    }
}
