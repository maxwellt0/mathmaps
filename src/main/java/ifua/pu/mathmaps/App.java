package ifua.pu.mathmaps;

import ifua.pu.mathmaps.pojo.Note;
import ifua.pu.mathmaps.util.HibernateUtil;
import org.hibernate.Session;

import java.util.ArrayList;
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
//        note.setNoteId(1);
//        note.setName("Teorema 1");
//        note.setText("asdasd asdasd asdasd asdasdasd asdasd asdasdasd asdasdasd asdasdasd asdasdasdasd asdasd");
//        note.setRank(10);
////        note.setUsers(Arrays.asList(user));
////        session.save(note);
////
        int id3 = 40;
        int id2 = id3 + 1;
        int id1 = id3 + 2;

        Note note2 = new Note();
        Note note3 = new Note();

        note2.setNoteId(id2);
        note2.setName("Teorema "+id2);
        note2.setText("asdas" +id2);

        note3.setNoteId(id3);
        note3.setName("Teorema "+id3);
        note3.setText("Doved "+ id3);

////        note2.setUsers(Arrays.asList(user));
////        session.save(note2);
//        List<Note> notes = new ArrayList<Note>();
//        notes.add(note);
//        notes.add(note2);
//
//        user.setNotes(notes);
//        session.save(user);

        Note note = new Note();

        note.setNoteId(id1);
        note.setName("Teorema " + id1);
        note.setText("Doved " + id1);
        note.setRank(10);

        List<Note> notesF = new ArrayList<Note>();
        notesF.add(note2);


        List<Note> notesU = new ArrayList<Note>();
        notesU.add(note3);

        note.setAsFactIn(notesF);
        note.setUses(notesU);
//        session.save(note);

        List<Note> notesSel = session.createQuery("FROM Note").list();
        for (Note n : notesSel){
            System.out.println(n);
            for (Note n1: n.getAsFactIn()){
                System.out.print("--> ");
                System.out.println(n1);
            }
            for (Note n2: n.getUses()){
                System.out.print("--< ");
                System.out.println(n2);
            }
        }

        session.getTransaction().commit();
    }
}
