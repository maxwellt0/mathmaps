package ifua.pu.mathmaps.service;

import ifua.pu.mathmaps.model.Note;
import ifua.pu.mathmaps.model.NoteNote;
import ifua.pu.mathmaps.model.NoteType;

import java.util.List;

public interface NoteService {

    public Note saveNote(Note note);

    public List<Note> listNotes();

    public List<Note> getNotesWithStatus(int publishingStatus);

    public List<NoteNote> getLinksWithStatus(int higherId, int lowerId, int publishingStatus);

    public List<NoteType> getNoteTypes();

    public NoteType getNoteType(int typeId);

    public Note getNote(int noteId);

    public List<Note> getNotesByName(String name);

    public void deleteNote(int noteId);
}
