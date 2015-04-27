package ifua.pu.mathmaps.model;

import org.hibernate.annotations.ForeignKey;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name = "NOTE", catalog = "mathmaps")
public class Note implements Serializable{

    private Integer noteId;

    private String name;

    private String text;

    private Integer rank;

    private Set<UserNote> userNotes = new HashSet<UserNote>(0);

    private Set<Note> higherNotes = new HashSet<Note>(0);

    private Set<Note> lowerNotes = new HashSet<Note>(0);

    public Note() {
    }

    public Note(Integer noteId, String name, String text, Integer rank, Set<UserNote> userNotes, Set<Note> higherNotes, Set<Note> lowerNotes) {
        this.noteId = noteId;
        this.name = name;
        this.text = text;
        this.rank = rank;
        this.userNotes = userNotes;
        this.higherNotes = higherNotes;
        this.lowerNotes = lowerNotes;
    }

    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "NOTE_ID", unique = true, nullable = false)
    public Integer getNoteId() {
        return noteId;
    }

    public void setNoteId(Integer noteId) {
        this.noteId = noteId;
    }

    @Column(name = "NAME", nullable = false, length = 45)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column(name = "TEXT", nullable = false, length = 10000)
    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    @Column(name = "RANK", nullable = true)
    public Integer getRank() {
        return rank;
    }

    public void setRank(Integer rank) {
        this.rank = rank;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "note", cascade=CascadeType.ALL)
    public Set<UserNote> getUserNotes() {
        return userNotes;
    }

    public void setUserNotes(Set<UserNote> userNotes) {
        this.userNotes = userNotes;
    }

    @ManyToMany(targetEntity=Note.class)
    @ForeignKey(name="FK_H_NOTE_TO_L_NOTE", inverseName = "FK_L_NOTE_TO_H_NOTE")
    @JoinTable(
            name = "LINK",
            joinColumns = @JoinColumn(name = "LOWER_NOTE_ID"),
            inverseJoinColumns = @JoinColumn(name = "HIGHER_NOTE_ID")
    )
    @LazyCollection(LazyCollectionOption.FALSE)
    public Set<Note> getHigherNotes() {
        return higherNotes;
    }

    public void setHigherNotes(Set<Note> higherNotes) {
        this.higherNotes = higherNotes;
    }

    @ManyToMany(targetEntity=Note.class)
    @ForeignKey(name="FK_L_NOTE_TO_H_NOTE", inverseName = "FK_H_NOTE_TO_L_NOTE")
    @JoinTable(
            name = "LINK",
            joinColumns = @JoinColumn(name = "HIGHER_NOTE_ID"),
            inverseJoinColumns = @JoinColumn(name = "LOWER_NOTE_ID")
    )
    @LazyCollection(LazyCollectionOption.FALSE)
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
