package ifua.pu.mathmaps.dao.impl;

import ifua.pu.mathmaps.dao.UserDao;
import ifua.pu.mathmaps.pojo.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Maxwellt on 11.04.2015.
 */
@Repository
public class UserDaoImpl implements UserDao {

    @Autowired
    SessionFactory sessionFactory;

    public void saveUser(User user) {

        getSession().merge(user);
    }

    public List<User> listUsers() {

        return getSession().createCriteria(User.class).list();
    }

    public User getUser(int userId) {
        return (User) getSession().get(User.class, userId);
    }

    public void deleteUser(int userId) {

        User User = getUser(userId);

        if (null != User) {
            getSession().delete(User);
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
