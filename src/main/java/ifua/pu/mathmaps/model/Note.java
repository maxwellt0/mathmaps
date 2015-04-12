package ifua.pu.mathmaps.model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

import static javax.persistence.GenerationType.IDENTITY;

/**
 * Created by Maxwellt on 10.04.2015.
 */
@Entity
@Table(name = "NOTE", catalog = "mathmaps")
public class Note implements java.io.Serializable {
    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "NOTE_ID", nullable = false)
    private int noteId;

    @Column(name = "NAME", nullable = false, length = 45)
    private String name;

    @Column(name = "TEXT", nullable = false, length = 10000)
    private String text;

    @Column(name = "RANK", nullable = true)
    private int rank;

    @ManyToMany(fetch = FetchType.LAZY, mappedBy = "notes")
    private List<User> users = new ArrayList<User>();

    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(name = "LINK", catalog = "mathmaps", joinColumns = {
            @JoinColumn(name = "HIGHER_NOTE_ID", nullable = false, updatable = false) },
            inverseJoinColumns = { @JoinColumn(name = "LOWER_NOTE_ID",
                    nullable = false, updatable = false) })
    private List<Note> higherNotes = new ArrayList<Note>();

    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(name = "LINK", catalog = "mathmaps", joinColumns = {
            @JoinColumn(name = "LOWER_NOTE_ID", nullable = false, updatable = false) },
            inverseJoinColumns = { @JoinColumn(name = "HIGHER_NOTE_ID",
                    nullable = false, updatable = false) })
    private List<Note> lowerNotes = new ArrayList<Note>();

    public Note() {
    }

    public String getName() {
        return name;
    }

    public Note(int noteId, String name, String text, int rank, List<User> users, List<Note> higherNotes, List<Note> lowerNotes) {
        this.noteId = noteId;
        this.name = name;
        this.text = text;
        this.rank = rank;
        this.users = users;
        this.higherNotes = higherNotes;
        this.lowerNotes = lowerNotes;
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

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    public List<Note> getHigherNotes() {
        return higherNotes;
    }

    public void setHigherNotes(List<Note> higherNotes) {
        this.higherNotes = higherNotes;
    }

    public List<Note> getLowerNotes() {
        return lowerNotes;
    }

    public void setLowerNotes(List<Note> lowerNotes) {
        this.lowerNotes = lowerNotes;
    }

    @Override
    public String toString() {
        return "Note{" +
                "noteId=" + noteId +
                ", name='" + name + '\'' +
                ", text='" + text + '\'' +
                ", rank=" + rank +
                ", higherNotes=" + higherNotes.size() +
                ", lowerNotes=" + lowerNotes.size() +
                '}';
    }
}
