package ifua.pu.mathmaps.dao.impl;

import ifua.pu.mathmaps.dao.UserNoteDao;
import ifua.pu.mathmaps.model.Note;
import ifua.pu.mathmaps.model.User;
import ifua.pu.mathmaps.model.UserNote;
import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class UserNoteDaoImpl implements UserNoteDao {

    @Autowired
    SessionFactory sessionFactory;

    private static final Logger log = Logger.getLogger(UserNoteDaoImpl.class);

    public void saveUserNote(UserNote userNote) {
        getSession().merge(userNote);
    }

    public void addWithParams(int noteId, String username, int status) {
        Criteria userCriteria = getSession().createCriteria(User.class)
                .add(Restrictions.eq("username", username));
        User user =  (User) userCriteria.uniqueResult();

        Note note = (Note) getSession().get(Note.class, noteId);

        UserNote userNote = new UserNote(user, note, status);

        saveUserNote(userNote);
    }

    @SuppressWarnings("unchecked")
    public List<UserNote> listByUser(String username) {
        Criteria userCriteria = getSession().createCriteria(User.class)
                .add(Restrictions.eq("username", username));
        User user =  (User) userCriteria.uniqueResult();

        Criteria criteria = getSession().createCriteria(UserNote.class)
                .add(Restrictions.eq("user", user));

        return criteria.list();
    }

    @SuppressWarnings("unchecked")
    public List<UserNote> listByNote(int noteId) {
        Note note = (Note) getSession().get(Note.class, noteId);

        Criteria criteria = getSession().createCriteria(UserNote.class)
                .add(Restrictions.eq("note", note));

        return criteria.list();
    }

    public UserNote getUserNote(int noteId, String username) {
        Criteria userCriteria = getSession().createCriteria(User.class)
                .add(Restrictions.eq("username", username));
        User user =  (User) userCriteria.uniqueResult();

        Note note = (Note) getSession().get(Note.class, noteId);

        Criteria criteria = getSession().createCriteria(UserNote.class)
                .add(Restrictions.eq("note", note))
                .add(Restrictions.eq("user", user));

        return (UserNote) criteria.uniqueResult();
    }

    public void deleteUserNote(int noteId, String username) {
        UserNote userNote = getUserNote(noteId, username);

        if (userNote != null) {
            getSession().delete(userNote);
            log.debug("Deleted association note " + noteId + " - " + username );
        } else {
            log.debug("The association is null");
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
