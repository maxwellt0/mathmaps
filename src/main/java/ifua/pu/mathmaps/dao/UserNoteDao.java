package ifua.pu.mathmaps.dao;

import ifua.pu.mathmaps.model.Note;
import ifua.pu.mathmaps.model.join.UserNote;

import java.util.List;

public interface UserNoteDao {

    public void saveUserNote(UserNote userNote);

    public List<UserNote> listByUser(String username);

    public List<UserNote> listByNote(int noteId);

    public UserNote getUserNote(int noteId, String username);

    public void deleteUserNote(int noteId, String username);
}