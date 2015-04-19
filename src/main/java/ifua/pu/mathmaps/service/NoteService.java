package ifua.pu.mathmaps.service;

import ifua.pu.mathmaps.model.Note;

import java.util.List;

/**
 * Created by Maxwellt on 11.04.2015.
 */
public interface NoteService {
    /*
       * CREATE and UPDATE
       */
    public void saveNote(Note note);

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
