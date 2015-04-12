package ifua.pu.mathmaps.dao.impl;

import ifua.pu.mathmaps.dao.NoteDao;
import ifua.pu.mathmaps.model.Note;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Maxwellt on 11.04.2015.
 */
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

    public Note getNote(int noteId) {
        return (Note) getSession().get(Note.class, noteId);
    }

    public void deleteNote(int noteId) {

        Note Note = getNote(noteId);

        if (null != Note) {
            getSession().delete(Note);
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
