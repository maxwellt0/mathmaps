package ifua.pu.mathmaps.dao;

import ifua.pu.mathmaps.model.User;

import java.util.List;

public interface UserDao {
    /*
        * CREATE and UPDATE
        */
    public void saveUser(User user); // create and update

    /*
     * READ
     */
    public List<User> listUsers();
    public User findByUserName(String username);

    /*
     * DELETE
     */
    public void deleteUser(String username);
}
