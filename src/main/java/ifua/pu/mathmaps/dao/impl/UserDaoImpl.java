package ifua.pu.mathmaps.dao.impl;

import ifua.pu.mathmaps.dao.UserDao;
import ifua.pu.mathmaps.model.Note;
import ifua.pu.mathmaps.model.User;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Maxwellt on 11.04.2015.
 */
@Repository
public class UserDaoImpl implements UserDao {

    @Autowired
    private SessionFactory sessionFactory;

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

    @SuppressWarnings("unchecked")
    public User findByUserName(String username) {
        Criteria criteria = getSession().createCriteria(User.class);

        return (User) criteria.add(Restrictions.eq("name", username)).uniqueResult();
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
