package ifua.pu.mathmaps.model.join;

import ifua.pu.mathmaps.model.Note;
import ifua.pu.mathmaps.model.User;

import javax.persistence.Embeddable;
import javax.persistence.ManyToOne;
import java.io.Serializable;

@Embeddable
public class UserNoteId implements Serializable {

    private User user;
    private Note note;

    public UserNoteId() {
    }

    public UserNoteId(User user, Note note) {
        this.user = user;
        this.note = note;
    }

    @ManyToOne
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @ManyToOne
    public Note getNote() {
        return note;
    }

    public void setNote(Note note) {
        this.note = note;
    }

    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UserNoteId that = (UserNoteId) o;

        if (user != null ? !user.equals(that.user) : that.user != null) return false;
        if (note != null ? !note.equals(that.note) : that.note != null) return false;

        return true;
    }

    public int hashCode() {
        int result;
        result = (user != null ? user.hashCode() : 0);
        result = 31 * result + (note != null ? note.hashCode() : 0);
        return result;
    }

}
