package ifua.pu.mathmaps;

import ifua.core.Note;
import ifua.core.User;
import ifua.pu.mathmaps.util.HibernateUtil;
import org.hibernate.Session;

import java.util.Date;

/**
 * Created by Maxwellt on 10.04.2015.
 */
public class App {

    public static void main(String[] args) {
        System.out.println("Maven + Hibernate + MySQL");
        Session session = HibernateUtil.getSessionFactory().openSession();

        session.beginTransaction();
        User user = new User();
        Note note = new Note();

        user.setLogin("superman" + new Date().getTime()%20);
        user.setEmail("superman"+ + new Date().getTime()%20 +"@gmail.com");
        user.setPassword("qwerty25");
        user.setName("Vasya Korabel");

        note.setName("Teorema 1");
        note.setText("asdasd asdasd asdasd asdasdasd asdasd asdasdasd asdasdasd asdasdasd asdasdasdasd asdasd");
        note.setRank(10);
        note.setUserId(1);

        Note note2 = new Note();
        note2.setName("Teorema 2");
        note2.setText("asdas dsafsefas sdafawef adsfasdfasdfasdfa asdfwef sadf waefasdf awerfadf asdfwf sdfwe sadf asefwefsd faserfgas dfasdf");
        note2.setUserId(4);


        session.save(user);
//        session.save(note);
//        session.save(note2);
        session.getTransaction().commit();
    }
}
