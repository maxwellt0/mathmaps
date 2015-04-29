package ifua.pu.mathmaps.dao.impl;

import ifua.pu.mathmaps.dao.NoteDao;
import ifua.pu.mathmaps.model.Note;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.criteria.From;
import java.util.List;

@Repository
public class NoteDaoImpl implements NoteDao {
    @Autowired
    SessionFactory sessionFactory;

    public void saveNote(Note note) {
        getSession().merge(note);
    }

    public List<Note> listNotes() {

        return getSession().createCriteria(Note.class).list();
    }

    public List<Note> getNotesWithStatus(int publishingStatus) {
        Criteria criteria = getSession().createCriteria(Note.class)
                .add(Restrictions.eq("publishingStatus", publishingStatus));

        return criteria.list();
    }

    public Note getNote(int noteId) {
        return (Note) getSession().get(Note.class, noteId);
    }

    public Note getNoteByName(String name) {
        Criteria criteria = getSession().createCriteria(Note.class);

        return (Note) criteria.add(Restrictions.eq("name", name)).uniqueResult();
    }

    public void deleteNote(int noteId) {

        Note note = getNote(noteId);

        if (note != null) {
            getSession().delete(note);
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
