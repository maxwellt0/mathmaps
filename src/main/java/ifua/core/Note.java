package ifua.core;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by Maxwellt on 10.04.2015.
 */
@Entity
@Table(name = "NOTE")
public class Note implements java.io.Serializable {
    @Id
    @Column(name = "NOTE_ID", unique = true, nullable = false, precision = 5, scale = 0)
    private int noteId;
    @Column(name = "NAME", nullable = false, length = 45)
    private String name;
    @Column(name = "TEXT", nullable = false, length = 10000)
    private String text;
    @Column(name = "RANK", nullable = true)
    private int rank;
    @Column(name = "LINK_ID", nullable = true)
    private int linkId;
    @Column(name = "USER_ID", nullable = true)
    private int userId;

    public Note() {
    }

    public String getName() {
        return name;
    }

    public Note(int noteId, String name, String text, int rank, int linkId, int userId) {
        this.noteId = noteId;
        this.name = name;
        this.text = text;
        this.rank = rank;
        this.linkId = linkId;
        this.userId = userId;
    }

    public Note(String name, String text, int rank, int linkId, int userId) {
        this.name = name;
        this.text = text;
        this.rank = rank;
        this.linkId = linkId;
        this.userId = userId;
    }

    public void setName(String name) {
        this.name = name;
    }

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

    public int getLinkId() {
        return linkId;
    }

    public void setLinkId(int linkId) {
        this.linkId = linkId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}
