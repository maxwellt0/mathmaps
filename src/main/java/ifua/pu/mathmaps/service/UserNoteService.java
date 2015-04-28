package ifua.pu.mathmaps.service;

import ifua.pu.mathmaps.model.UserNote;

import java.util.List;

public interface UserNoteService {

    public void saveUserNote(UserNote userNote);

    public void addWithParams(int noteId, String username, int status);

    public List<UserNote> listByUser(String username);

    public List<UserNote> listByNote(int noteId);

    public UserNote getUserNote(int noteId, String username);

    public void deleteUserNote(int noteId, String username);
}
