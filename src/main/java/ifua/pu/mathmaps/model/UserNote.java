package ifua.pu.mathmaps.model;

import javax.persistence.*;
import java.io.Serializable;

import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name = "user_note")
public class UserNote implements Serializable{

    private Integer userNoteId;
    // 0 - not, 1 - scheduled, 2 - learning, 3- studied, 4 - postponed, 5 - left, 6- repeating
    private Integer status=0;

    private User user;

    private Note note;

    public UserNote() {
    }

    public UserNote(User user, Note note) {
        this.user = user;
        this.note = note;
    }

    public UserNote(User user, Note note, Integer status) {
        this.user = user;
        this.note = note;
        this.status = status;
    }

    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "user_note_id", unique = true, nullable = false)
    public Integer getUserNoteId() {
        return userNoteId;
    }

    public void setUserNoteId(Integer userNoteId) {
        this.userNoteId = userNoteId;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "username", nullable = false)
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "note_id", nullable = false)
    public Note getNote() {
        return note;
    }

    public void setNote(Note note) {
        this.note = note;
    }

    @Column(name = "status", nullable = false)
    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
