package ifua.pu.mathmaps.core;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Maxwellt on 10.04.2015.
 */
@Entity
@Table(name = "NOTE", catalog = "mathmaps")
public class Note implements java.io.Serializable {
    @Id
    @Column(name = "NOTE_ID", unique = true, nullable = false, precision = 5, scale = 0)
    private int noteId;

    @Column(name = "NAME", nullable = false, length = 45)
    private String name;

    @Column(name = "TEXT", nullable = false, length = 10000)
    private String text;

    @Column(name = "RANK", nullable = true)
    private int rank;

    @ManyToMany(fetch = FetchType.LAZY, mappedBy = "notes")
    private List<User> users = new ArrayList<User>();

    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(name = "link", catalog = "mathmaps", joinColumns = {
            @JoinColumn(name = "NOTE_ID", nullable = false, updatable = false) },
            inverseJoinColumns = { @JoinColumn(name = "LINK_ID",
                    nullable = false, updatable = false) })
    private List<Note> usedIn = new ArrayList<Note>();

    public Note() {
    }

    public String getName() {
        return name;
    }

    public Note(int noteId, String name, String text, int rank, List<User> users) {
        this.noteId = noteId;
        this.name = name;
        this.text = text;
        this.rank = rank;
        this.users = users;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getNoteId() {
        return noteId;
    }

    public void setNoteId(int noteId) {
        this.noteId = noteId;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public int getRank() {
        return rank;
    }

    public void setRank(int rank) {
        this.rank = rank;
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    public List<Note> getUsedIn() {
        return usedIn;
    }

    public void setUsedIn(List<Note> usedIn) {
        this.usedIn = usedIn;
    }
}
