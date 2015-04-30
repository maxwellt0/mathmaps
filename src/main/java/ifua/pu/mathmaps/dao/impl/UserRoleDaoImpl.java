package ifua.pu.mathmaps.dao.impl;

import ifua.pu.mathmaps.dao.UserRoleDao;
import ifua.pu.mathmaps.model.User;
import ifua.pu.mathmaps.model.UserRole;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserRoleDaoImpl implements UserRoleDao {

    @Autowired
    private SessionFactory sessionFactory;

    public void saveUserRole(UserRole userRole) {
        getSession().merge(userRole);
    }

    @SuppressWarnings("unchecked")
    public List<UserRole> listUserRoles() {
        return getSession().createCriteria(UserRole.class).list();
    }

    public UserRole getRole(String role) {
        Criteria criteria = getSession().createCriteria(UserRole.class);

        return (UserRole) criteria.add(Restrictions.eq("role", role)).uniqueResult();
    }

    public void deleteUserRole(String role) {
        UserRole userRole = getRole(role);

        if (userRole != null) {
            getSession().delete(userRole);
        }
    }

    private Session getSession() {
        Session sess = getSessionFactory().getCurrentSession();
        if (sess == null) {
            sess = getSessionFactory().openSession();
        }
        return sess;
    }

    private SessionFactory getSessionFactory() {
        return sessionFactory;
    }
}
