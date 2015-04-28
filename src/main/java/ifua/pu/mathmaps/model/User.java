package ifua.pu.mathmaps.model;

import ifua.pu.mathmaps.model.join.UserNote;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name = "USER", catalog = "mathmaps", uniqueConstraints = {
        @UniqueConstraint(columnNames = "USERNAME"),
        @UniqueConstraint(columnNames = "EMAIL") })
public class User implements Serializable {

    private String username;

    private String email;

    private String password;

    private boolean enabled;

    private Set<UserRole> userRole = new HashSet<UserRole>(0);

    private Set<UserNote> userNotes = new HashSet<UserNote>(0);

    public User() {
    }

    public User(String username, String email, String password, boolean enabled, Set<UserRole> userRole, Set<UserNote> userNotes) {
        this.username = username;
        this.email = email;
        this.password = password;
        this.enabled = enabled;
        this.userRole = userRole;
        this.userNotes = userNotes;
    }

    @Id
    @Column(name = "USERNAME", unique = true, nullable = false, length = 16)
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Column(name = "EMAIL", nullable = false, length = 45)
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Column(name = "PASSWORD", nullable = false, length = 16)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "pk.user")
    public Set<UserNote> getUserNotes() {
        return userNotes;
    }

    public void setUserNotes(Set<UserNote> userNotes) {
        this.userNotes = userNotes;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
    public Set<UserRole> getUserRole() {
        return userRole;
    }

    public void setUserRole(Set<UserRole> userRole) {
        this.userRole = userRole;
    }

    @Column(name = "enabled", nullable = false)
    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }
}
