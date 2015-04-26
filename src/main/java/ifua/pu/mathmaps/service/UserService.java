package ifua.pu.mathmaps.service;

import ifua.pu.mathmaps.model.User;

import java.util.List;

public interface UserService {

    public void saveUser(User user);

    public List<User> listUsers();

    public User getUser(String username);

    public void deleteUser(String username);
}
