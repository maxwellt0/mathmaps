package ifua.pu.mathmaps.dao.impl;

import ifua.pu.mathmaps.dao.NoteDao;
import ifua.pu.mathmaps.model.Note;
import ifua.pu.mathmaps.model.NoteType;
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

    public Note saveNote(Note note) {
        return (Note) getSession().merge(note);
    }

    @SuppressWarnings("unchecked")
    public List<Note> listNotes() {
        return getSession().createCriteria(Note.class).list();
    }

    @SuppressWarnings("unchecked")
    public List<Note> getNotesWithStatus(int publishingStatus) {
        Criteria criteria = getSession().createCriteria(Note.class)
                .add(Restrictions.eq("publishingStatus", publishingStatus));

        return criteria.list();
    }

    public NoteType getNoteType(int typeId) {
        return (NoteType) getSession().get(NoteType.class, typeId);
    }

    @SuppressWarnings("unchecked")
    public List<NoteType> getNoteTypes() {
        return getSession().createCriteria(NoteType.class).list();
    }

    public Note getNote(int noteId) {
        return (Note) getSession().get(Note.class, noteId);
    }

    @SuppressWarnings("unchecked")
    public List<Note> getNotesByName(String name) {
        Criteria criteria = getSession().createCriteria(Note.class)
                .add(Restrictions.eq("name", name));

        return criteria.list();
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
