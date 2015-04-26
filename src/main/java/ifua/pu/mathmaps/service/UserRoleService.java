package ifua.pu.mathmaps.service;

import ifua.pu.mathmaps.model.UserRole;

import java.util.List;

public interface UserRoleService {

    public void saveUserRole(UserRole userRole);

    public List<UserRole> listUserRoles();

    public UserRole getUserRole(String role);

    public void deleteUserRole(String role);
}