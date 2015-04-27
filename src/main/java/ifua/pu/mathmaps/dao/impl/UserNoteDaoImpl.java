package ifua.pu.mathmaps.dao.impl;

import ifua.pu.mathmaps.dao.UserNoteDao;
import ifua.pu.mathmaps.model.Note;
import ifua.pu.mathmaps.model.User;
import ifua.pu.mathmaps.model.join.UserNote;
import ifua.pu.mathmaps.model.join.UserNoteId;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserNoteDaoImpl implements UserNoteDao {

    @Autowired
    SessionFactory sessionFactory;

    public void saveUserNote(UserNote userNote) {
        getSession().merge(userNote);
    }

    public List<UserNote> listByUser(String username) {
        Criteria criteria = getSession().createCriteria(UserNote.class)
                .add(Restrictions.eq("username", username));

        return criteria.list();
    }

    public List<UserNote> listByNote(int noteId) {
        Criteria criteria = getSession().createCriteria(UserNote.class)
                .add(Restrictions.eq("note_id", noteId));

        return criteria.list();
    }

    public UserNote getUserNote(int noteId, String username) {
        Criteria userCriteria = getSession().createCriteria(User.class)
                .add(Restrictions.eq("username", username));
        User user =  (User) userCriteria.uniqueResult();
        Note note = (Note) getSession().get(Note.class, noteId);
        UserNoteId userNoteId = new UserNoteId(user, note);
        Criteria criteria = getSession().createCriteria(UserNote.class)
                .add(Restrictions.eq("pk", userNoteId));

        return (UserNote) criteria.uniqueResult();
    }

    public void deleteUserNote(int noteId, String username) {
        UserNote userNote = getUserNote(noteId, username);

        if (userNote != null) {
            getSession().delete(userNote);
        }
    }

    private Session getSession() {
        Session sess = getSessionFactory().getCurrentSession();
        if (sess == null) {
            sess = getSessionFactory().openSession();
        }
        return sess;
    }

    private SessionFactory getSessionFactory() {
        return sessionFactory;
    }
}
