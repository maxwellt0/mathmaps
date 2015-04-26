package ifua.pu.mathmaps.service;

import ifua.pu.mathmaps.model.User;

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
    public User getUser(String username);

    /*
     * DELETE
     */
    public void deleteUser(String username);
}
