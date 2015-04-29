package ifua.pu.mathmaps.dao;

import ifua.pu.mathmaps.model.Note;

import java.util.List;

public interface NoteDao {

    public void saveNote(Note note);

    public List<Note> listNotes();

    public List<Note> getNotesWithStatus(int publishingStatus);

    public Note getNote(int noteId);

    public Note getNoteByName(String name);

    public void deleteNote(int noteId);
}
