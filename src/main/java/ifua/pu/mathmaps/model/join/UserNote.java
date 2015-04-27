package ifua.pu.mathmaps.model.join;

import ifua.pu.mathmaps.model.Note;
import ifua.pu.mathmaps.model.User;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "user_note", catalog = "mathmaps")
@AssociationOverrides({
        @AssociationOverride(name = "pk.user", joinColumns = @JoinColumn(name = "USERNAME")),
        @AssociationOverride(name = "pk.note", joinColumns = @JoinColumn(name = "NOTE_ID")) })
public class UserNote implements Serializable{

    private UserNoteId pk = new UserNoteId();
    // 0 - not, 1 - scheduled, 2 - learning, 3- studied, 4 - postponed, 5 - left
    private Integer status=0;

    public UserNote() {
    }

    @EmbeddedId
    public UserNoteId getPk() {
        return pk;
    }

    public void setPk(UserNoteId pk) {
        this.pk = pk;
    }

    @Transient
    public User getUser() {
        return getPk().getUser();
    }

    public void setUser(User user) {
        getPk().setUser(user);
    }

    @Transient
    public Note getNote() {
        return getPk().getNote();
    }

    public void setNote(Note note) {
        getPk().setNote(note);
    }

    @Column(name = "STATUS", nullable = false)
    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public boolean equals(Object o) {
        if (this == o)
            return true;
        if (o == null || getClass() != o.getClass())
            return false;

        UserNote that = (UserNote) o;

        if (getPk() != null ? !getPk().equals(that.getPk())
                : that.getPk() != null)
            return false;

        return true;
    }

    public int hashCode() {
        return (getPk() != null ? getPk().hashCode() : 0);
    }
}
