package ifua.pu.mathmaps.model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;
import static javax.persistence.GenerationType.IDENTITY;


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

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
    private Set<UserRole> userRole = new HashSet<UserRole>(0);

    @Column(name = "NAME", nullable = false, length = 35)
    private String name;

    @Column(name = "enabled", nullable = false)
    private boolean enabled;

    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(name = "USER_NOTE", catalog = "mathmaps", joinColumns = {
            @JoinColumn(name = "USER_ID", nullable = false, updatable = false) },
            inverseJoinColumns = { @JoinColumn(name = "NOTE_ID",
                    nullable = false, updatable = false) })
    private Set<Note> notes = new HashSet<Note>();

    public User() {
    }

    public User(String login, String email, String password, Set<UserRole> userRole, String name, boolean enabled, Set<Note> notes) {
        this.login = login;
        this.email = email;
        this.password = password;
        this.userRole = userRole;
        this.name = name;
        this.enabled = enabled;
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

    public Set<Note> getNotes() {
        return notes;
    }

    public void setNotes(Set<Note> notes) {
        this.notes = notes;
    }

    public Set<UserRole> getUserRole() {
        return userRole;
    }

    public void setUserRole(Set<UserRole> userRole) {
        this.userRole = userRole;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public void addNote(Note note) {
        this.notes.add(note);
    }

    public void removeNote(Note note) {
        if (this.notes.contains(note)) {
            this.notes.remove(note);
        }
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
