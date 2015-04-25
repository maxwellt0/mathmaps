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
    @Id
    @Column(name = "USERNAME", unique = true, nullable = false, length = 12)
    private String username;

    @Column(name = "EMAIL", unique = true, nullable = false, length = 20)
    private String email;

    @Column(name = "PASSWORD", nullable = false, length = 16)
    private String password;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
    private Set<UserRole> userRole = new HashSet<UserRole>(0);

    @Column(name = "enabled", nullable = false)
    private boolean enabled;

    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(name = "USER_NOTE", catalog = "mathmaps", joinColumns = {
            @JoinColumn(name = "USERNAME", nullable = false, updatable = false) },
            inverseJoinColumns = { @JoinColumn(name = "NOTE_ID",
                    nullable = false, updatable = false) })
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
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
                ", username='" + username + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", userRole=" + userRole +
                ", enabled=" + enabled +
                ", notes=" + notes.size() +
                '}';
    }
}
