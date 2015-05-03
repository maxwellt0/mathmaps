package ifua.pu.mathmaps.model;

import javax.persistence.*;
import java.io.Serializable;

import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name = "link")
public class NoteNote implements Serializable{

    private int linkId;

    private int higherNoteId;

    private int lowerNoteId;

    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "link_id", unique = true, nullable = true)
    public int getLinkId() {
        return linkId;
    }

    public void setLinkId(int linkId) {
        this.linkId = linkId;
    }

    @Column(name = "higher_note_id")
    public int getHigherNoteId() {
        return higherNoteId;
    }

    public void setHigherNoteId(int higherNoteId) {
        this.higherNoteId = higherNoteId;
    }

    @Column(name = "lower_note_id")
    public int getLowerNoteId() {
        return lowerNoteId;
    }

    public void setLowerNoteId(int lowerNoteId) {
        this.lowerNoteId = lowerNoteId;
    }
}
