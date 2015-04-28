package ifua.pu.mathmaps.model;

import javax.persistence.*;

import java.util.HashSet;
import java.util.Set;

import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name = "note_type")
public class NoteType {

    private int noteTypeId;

    private String type;

    private Set<Note> notes = new HashSet<Note>(0);

    public NoteType() {
    }

    public NoteType(String type) {
        this.type = type;
    }

    public NoteType(int noteTypeId, String type) {
        this.noteTypeId = noteTypeId;
        this.type = type;
    }

    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "note_type_id", unique = true, nullable = false)
    public int getNoteTypeId() {
        return noteTypeId;
    }

    public void setNoteTypeId(int noteTypeId) {
        this.noteTypeId = noteTypeId;
    }

    @Column(name = "type", nullable = false, length = 16)
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "type")
    public Set<Note> getNotes() {
        return notes;
    }

    public void setNotes(Set<Note> notes) {
        this.notes = notes;
    }

    @Override
    public String toString() {
        return "NoteType{" +
                "noteTypeId=" + noteTypeId +
                ", type='" + type + '\'' +
                '}';
    }
}
