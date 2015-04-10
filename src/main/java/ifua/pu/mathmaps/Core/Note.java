package ifua.pu.mathmaps.Core;

import java.util.List;

/**
 * Created by Maxwellt on 10.04.2015.
 */
public class Note {
    private int noteId;
    private String text;
    private int rank;
    private List<Note> usedIn;
    private List<Note> using;

    public int getNoteId() {
        return noteId;
    }

    public void setNoteId(int noteId) {
        this.noteId = noteId;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public int getRank() {
        return rank;
    }

    public void setRank(int rank) {
        this.rank = rank;
    }

    public List<Note> getUsedIn() {
        return usedIn;
    }

    public void setUsedIn(List<Note> usedIn) {
        this.usedIn = usedIn;
    }

    public List<Note> getUsing() {
        return using;
    }

    public void setUsing(List<Note> using) {
        this.using = using;
    }
}
