package ifua.pu.mathmaps.model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;
import static javax.persistence.GenerationType.IDENTITY;


@Entity
@Table(name = "USER", catalog = "mathmaps", uniqueConstraints = {
        @UniqueConstraint(columnNames = "USERNAME"),
        @UniqueConstraint(columnNames = "EMAIL") })
public class User {

    private String username;

    private String email;

    private String password;

    private boolean enabled;

    private Set<UserRole> userRole = new HashSet<UserRole>(0);

    private Set<Note> notes = new HashSet<Note>();

    public User() {
    }

    public User(String username, String email, String password, Set<UserRole> userRole, boolean enabled, Set<Note> notes) {
        this.username = username;
        this.email = email;
        this.password = password;
        this.userRole = userRole;
        this.enabled = enabled;
        this.notes = notes;
    }

    @Id
    @Column(name = "USERNAME", unique = true, nullable = false, length = 12)
    public String getUsername() {
        return username;
    }

    @Column(name = "EMAIL", unique = true, nullable = false, length = 20)
    public String getEmail() {
        return email;
    }

    @Column(name = "PASSWORD", nullable = false, length = 16)
    public String getPassword() {
        return password;
    }

    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(name = "USER_NOTE", catalog = "mathmaps", joinColumns = {
            @JoinColumn(name = "USERNAME", nullable = false, updatable = false) },
            inverseJoinColumns = { @JoinColumn(name = "NOTE_ID",
                    nullable = false, updatable = false) })
    public Set<Note> getNotes() {
        return notes;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
    public Set<UserRole> getUserRole() {
        return userRole;
    }

    @Column(name = "enabled", nullable = false)
    public boolean isEnabled() {
        return enabled;
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
                ", username='" + username + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", userRole=" + userRole +
                ", enabled=" + enabled +
                ", notes=" + notes.size() +
                '}';
    }
}
