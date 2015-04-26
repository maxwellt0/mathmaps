package ifua.pu.mathmaps.dao;

import ifua.pu.mathmaps.model.UserRole;

import java.util.List;

public interface UserRoleDao {

    public void saveUserRole(UserRole userRole);

    public List<UserRole> listUserRoles();

    public UserRole getRole(String role);

    public void deleteUserRole(String role);
}
