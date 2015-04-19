package ifua.pu.mathmaps.service.impl;

import ifua.pu.mathmaps.dao.NoteDao;
import ifua.pu.mathmaps.model.Note;
import ifua.pu.mathmaps.service.NoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Maxwellt on 11.04.2015.
 */
@Service
public class NoteServiceImpl implements NoteService{
    @Autowired
    private NoteDao noteDao;

    @Transactional
    public void saveNote(Note note) {
        noteDao.saveNote(note);
    }

    @Transactional(readOnly = true)
    public List<Note> listNotes() {
        return noteDao.listNotes();
    }

    @Transactional(readOnly = true)
    public Note getNote(int noteId) {
        return noteDao.getNote(noteId);
    }

    @Transactional(readOnly = true)
    public Note getNoteByName(String name) {
        return noteDao.getNoteByName(name);
    }

    @Transactional
    public void deleteNote(int noteId) {
        noteDao.deleteNote(noteId);
    }
}
