package ifua.pu.mathmaps.model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
import static javax.persistence.GenerationType.IDENTITY;

/**
 * Created by Maxwellt on 10.04.2015.
 */
@Entity
@Table(name = "USER", catalog = "mathmaps", uniqueConstraints = {
        @UniqueConstraint(columnNames = "LOGIN"),
        @UniqueConstraint(columnNames = "EMAIL") })
public class User implements java.io.Serializable {
    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "USER_ID", nullable = false)
    private int userId;

    @Column(name = "LOGIN", unique = true, nullable = false, length = 12)
    private String login;

    @Column(name = "EMAIL", unique = true, nullable = false, length = 20)
    private String email;

    @Column(name = "PASSWORD", nullable = false, length = 16)
    private String password;

    @Column(name = "NAME", nullable = false, length = 35)
    private String name;

    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(name = "USER_NOTE", catalog = "mathmaps", joinColumns = {
            @JoinColumn(name = "USER_ID", nullable = false, updatable = false) },
            inverseJoinColumns = { @JoinColumn(name = "NOTE_ID",
                    nullable = false, updatable = false) })
    private List<Note> notes = new ArrayList<Note>();

    public User() {
    }

    public User(String login, String email, String password, String name, List<Note> notes) {
        this.login = login;
        this.email = email;
        this.password = password;
        this.name = name;
        this.notes = notes;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Note> getNotes() {
        return notes;
    }

    public void setNotes(List<Note> notes) {
        this.notes = notes;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", login='" + login + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", notes=" + notes.size() +
                '}';
    }
}
