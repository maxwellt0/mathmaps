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
@Table(name = "note")
public class Note implements Serializable{

    private Integer noteId;

    private String name;

    private String text;

    private NoteType type;

    private boolean published=false;

    private boolean offered=false;

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
    @Column(name = "note_id", unique = true, nullable = false)
    public Integer getNoteId() {
        return noteId;
    }

    public void setNoteId(Integer noteId) {
        this.noteId = noteId;
    }

    @Column(name = "name", nullable = false, length = 45)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column(name = "text", nullable = false, length = 10000)
    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    @Column(name = "rank", nullable = true)
    public Integer getRank() {
        return rank;
    }

    public void setRank(Integer rank) {
        this.rank = rank;
    }

    @Column(name = "published")
    public boolean isPublished() {
        return published;
    }

    public void setPublished(boolean published) {
        this.published = published;
    }

    @Column(name = "offered")
    public boolean isOffered() {
        return offered;
    }

    public void setOffered(boolean offered) {
        this.offered = offered;
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
            name = "link",
            joinColumns = @JoinColumn(name = "lower_note_id"),
            inverseJoinColumns = @JoinColumn(name = "higher_note_id")
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
            name = "link",
            joinColumns = @JoinColumn(name = "higher_note_id"),
            inverseJoinColumns = @JoinColumn(name = "lower_note_id")
    )
    @LazyCollection(LazyCollectionOption.FALSE)
    public Set<Note> getLowerNotes() {
        return lowerNotes;
    }

    public void setLowerNotes(Set<Note> lowerNotes) {
        this.lowerNotes = lowerNotes;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "note_type_id")
    public NoteType getType() {
        return type;
    }

    public void setType(NoteType type) {
        this.type = type;
    }
}
