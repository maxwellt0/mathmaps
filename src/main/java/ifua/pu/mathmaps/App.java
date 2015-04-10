package ifua.pu.mathmaps;

import ifua.pu.mathmaps.core.Note;
import ifua.pu.mathmaps.core.User;
import ifua.pu.mathmaps.util.HibernateUtil;
import org.hibernate.Session;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * Created by Maxwellt on 10.04.2015.
 */
public class App {

    public static void main(String[] args) {
        System.out.println("Maven + Hibernate + MySQL");
        Session session = HibernateUtil.getSessionFactory().openSession();

        session.beginTransaction();

//        User user = new User();
//
//
//        user.setLogin("superman" + new Date().getTime() % 20);
//        user.setEmail("superman" + +new Date().getTime() % 20 + "@gmail.com");
//        user.setPassword("qwerty25");
//        user.setName("Vasya Korabel");
//
//        Note note = new Note();
//        note.setNoteId(1);
//        note.setName("Teorema 1");
//        note.setText("asdasd asdasd asdasd asdasdasd asdasd asdasdasd asdasdasd asdasdasd asdasdasdasd asdasd");
//        note.setRank(10);
////        note.setUsers(Arrays.asList(user));
////        session.save(note);
////
//        Note note2 = new Note();
//        Note note3 = new Note();
////
//        note2.setNoteId(15);
//        note2.setName("Teorema 15");
//        note2.setText("asdas15");
//
//        note3.setNoteId(16);
//        note3.setName("Teorema 16");
//        note3.setText("asdas16");
////        note2.setUsers(Arrays.asList(user));
////        session.save(note2);
//        List<Note> notes = new ArrayList<Note>();
//        notes.add(note);
//        notes.add(note2);
//
//        user.setNotes(notes);
//        session.save(user);
//        Note note = new Note();
//        note.setNoteId(17);
//        note.setName("Teorema17");
//        note.setText("asdasd17");
//        note.setRank(10);
//
//        List<Note> notes = new ArrayList<Note>();
//        notes.add(note2);
//        List<Note> notes2 = new ArrayList<Note>();
//        notes2.add(note3);
//        note.setAsFactIn(notes2);
//        note.setUses(notes);
//        session.save(note);

        List<Note> notes = session.createQuery("FROM Note").list();
        for (Note n : notes){
            System.out.println(n);
        }

        session.getTransaction().commit();
    }
}
