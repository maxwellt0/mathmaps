package ifua.pu.mathmaps.service;

import ifua.pu.mathmaps.model.Note;

import java.util.List;

public interface NoteService {

    public void saveNote(Note note);

    public List<Note> listNotes();

    public List<Note> getNotesWithStatus(int publishingStatus);

    public Note getNote(int noteId);

    public Note getNoteByName(String name);

    public void deleteNote(int noteId);
}
