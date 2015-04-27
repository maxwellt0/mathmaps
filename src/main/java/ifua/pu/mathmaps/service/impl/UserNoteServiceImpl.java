package ifua.pu.mathmaps.service.impl;

import ifua.pu.mathmaps.dao.UserNoteDao;
import ifua.pu.mathmaps.model.UserNote;
import ifua.pu.mathmaps.service.UserNoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserNoteServiceImpl implements UserNoteService {

    @Autowired
    private UserNoteDao userNoteDao;

    @Transactional
    public void saveUserNote(UserNote userNote) {
        userNoteDao.saveUserNote(userNote);
    }

    @Transactional(readOnly = true)
    public List<UserNote> listByUser(String username) {
        return userNoteDao.listByUser(username);
    }

    @Transactional(readOnly = true)
    public List<UserNote> listByNote(int noteId) {
        return userNoteDao.listByNote(noteId);
    }

    @Transactional(readOnly = true)
    public UserNote getUserNote(int noteId, String username) {
        return userNoteDao.getUserNote(noteId, username);
    }
    @Transactional
    public void deleteUserNote(int noteId, String username) {
        userNoteDao.deleteUserNote(noteId, username);
    }
}
