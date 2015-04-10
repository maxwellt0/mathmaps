package ifua.core;

/**
 * Created by Maxwellt on 10.04.2015.
 */
public class Link implements java.io.Serializable{
    private int linkId;
    private int noteId;

    public Link() {
    }

    public Link(int linkId, int noteId) {
        this.linkId = linkId;
        this.noteId = noteId;
    }

    public int getLinkId() {
        return linkId;
    }

    public void setLinkId(int linkId) {
        this.linkId = linkId;
    }

    public int getNoteId() {
        return noteId;
    }

    public void setNoteId(int noteId) {
        this.noteId = noteId;
    }
}
