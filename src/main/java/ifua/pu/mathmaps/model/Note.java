package ifua.pu.mathmaps.model;

import org.hibernate.annotations.ForeignKey;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

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
    private Set<User> users = new HashSet<User>();

    @ManyToMany(targetEntity=Note.class)
    @ForeignKey(name="FK_H_NOTE_TO_L_NOTE", inverseName = "FK_L_NOTE_TO_H_NOTE")
    @JoinTable(
            name = "LINK",
            joinColumns = @JoinColumn(name = "HIGHER_NOTE_ID"),
            inverseJoinColumns = @JoinColumn(name = "LOWER_NOTE_ID")
    )
    @LazyCollection(LazyCollectionOption.FALSE)
    private Set<Note> higherNotes = new HashSet<Note>();

    @ManyToMany(
            mappedBy = "higherNotes",
            targetEntity = Note.class
    )
    @LazyCollection(LazyCollectionOption.FALSE)
    private Set<Note> lowerNotes = new HashSet<Note>();

    public Note() {
    }

    public String getName() {
        return name;
    }

    public Note(int noteId, String name, String text, int rank, Set<User> users, Set<Note> higherNotes, Set<Note> lowerNotes) {
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

    public Set<User> getUsers() {
        return users;
    }

    public void setUsers(Set<User> users) {
        this.users = users;
    }

    public Set<Note> getHigherNotes() {
        return higherNotes;
    }

    public void setHigherNotes(Set<Note> higherNotes) {
        this.higherNotes = higherNotes;
    }

    public Set<Note> getLowerNotes() {
        return lowerNotes;
    }

    public void setLowerNotes(Set<Note> lowerNotes) {
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
