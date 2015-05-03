package ifua.pu.mathmaps.service.impl;

import ifua.pu.mathmaps.dao.NoteDao;
import ifua.pu.mathmaps.model.Note;
import ifua.pu.mathmaps.model.NoteNote;
import ifua.pu.mathmaps.model.NoteType;
import ifua.pu.mathmaps.service.NoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class NoteServiceImpl implements NoteService{
    @Autowired
    private NoteDao noteDao;

    @Transactional
    public Note saveNote(Note note) {
        return (Note) noteDao.saveNote(note);
    }

    @Transactional(readOnly = true)
    public List<Note> listNotes() {
        return noteDao.listNotes();
    }

    @Transactional(readOnly = true)
    public List<Note> getNotesWithStatus(int publishingStatus) {
        return noteDao.getNotesWithStatus(publishingStatus);
    }

    @Transactional(readOnly = true)
    public List<NoteNote> getLinksWithStatus(int higherId, int lowerId, int publishingStatus) {
        return noteDao.getLinksWithStatus(higherId, lowerId);
    }

    @Transactional(readOnly = true)
    public List<NoteType> getNoteTypes() {
        return noteDao.getNoteTypes();
    }

    @Transactional(readOnly = true)
    public NoteType getNoteType(int typeId) {
        return noteDao.getNoteType(typeId);
    }

    @Transactional(readOnly = true)
    public Note getNote(int noteId) {
        return noteDao.getNote(noteId);
    }

    @Transactional(readOnly = true)
    public List<Note> getNotesByName(String name) {
        return noteDao.getNotesByName(name);
    }

    @Transactional
    public void deleteNote(int noteId) {
        noteDao.deleteNote(noteId);
    }
}
