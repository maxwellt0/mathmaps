package ifua.pu.mathmaps.service.impl;

import ifua.pu.mathmaps.dao.UserRoleDao;
import ifua.pu.mathmaps.model.UserRole;
import ifua.pu.mathmaps.service.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserRoleServiceImpl implements UserRoleService {

    @Autowired
    private UserRoleDao userRoleDao;

    @Transactional
    public void saveUserRole(UserRole userRole) {
        userRoleDao.saveUserRole(userRole);
    }

    @Transactional(readOnly = true)
    public List<UserRole> listUserRoles() {
        return userRoleDao.listUserRoles();
    }

    @Transactional(readOnly = true)
    public UserRole getUserRole(String role) {
        return userRoleDao.getRole(role);
    }

    @Transactional
    public void deleteUserRole(String role) {
        userRoleDao.deleteUserRole(role);
    }

}
