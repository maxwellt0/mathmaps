package ifua.pu.mathmaps;

import ifua.pu.mathmaps.core.User;
import ifua.pu.mathmaps.util.HibernateUtil;
import org.hibernate.Session;

/**
 * Created by Maxwellt on 10.04.2015.
 */
public class App {

    public static void main(String[] args) {
        System.out.println("Maven + Hibernate + MySQL");
        Session session = HibernateUtil.getSessionFactory().openSession();

        session.beginTransaction();
        User user = new User();

        user.setUserId(1);
        user.setLogin("superman");
        user.setEmail("superman@gmail.com");
        user.setPassword("qwerty25");
        user.setName("Vasya Korabel");

        session.save(user);
        session.getTransaction().commit();
    }
}
