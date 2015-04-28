package ifua.pu.mathmaps.dao;

import ifua.pu.mathmaps.model.User;

import java.util.List;

public interface UserDao {

    public void saveUser(User user);

    public List<User> listUsers();

    public User findByUserName(String username);

    public void deleteUser(String username);
}
