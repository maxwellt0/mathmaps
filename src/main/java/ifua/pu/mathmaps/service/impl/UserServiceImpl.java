package ifua.pu.mathmaps.service.impl;

import ifua.pu.mathmaps.dao.UserDao;
import ifua.pu.mathmaps.model.User;
import ifua.pu.mathmaps.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Maxwellt on 11.04.2015.
 */
@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserDao userDao;

    @Transactional
    public void saveUser(User user) {
        userDao.saveUser(user);
    }

    @Transactional( readOnly = true)
    public List<User> listUsers() {
        return userDao.listUsers();
    }

    @Transactional( readOnly = true)
    public User getUser(int userId) {
        return userDao.getUser(userId);
    }

    @Transactional
    public void deleteUser(int userId) {
        userDao.deleteUser(userId);

    }

}
