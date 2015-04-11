package ifua.pu.mathmaps.service;

import ifua.pu.mathmaps.pojo.User;

import java.util.List;

/**
 * Created by Maxwellt on 11.04.2015.
 */
public interface UserService {
    /*
        * CREATE and UPDATE
        */
    public void saveUser(User user);

    /*
     * READ
     */
    public List<User> listUsers();
    public User getUser(int userId);

    /*
     * DELETE
     */
    public void deleteUser(int userId);
}
