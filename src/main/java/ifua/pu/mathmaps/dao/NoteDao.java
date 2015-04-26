package ifua.pu.mathmaps.dao;

import ifua.pu.mathmaps.model.Note;

import java.util.List;

public interface NoteDao {
    /*
    * CREATE and UPDATE
    */
    public void saveNote(Note note); // create and update

    /*
     * READ
     */
    public List<Note> listNotes();
    public Note getNote(int noteId);
    public Note getNoteByName(String name);

    /*
     * DELETE
     */
    public void deleteNote(int noteId);
}
