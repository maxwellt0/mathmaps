package ifua.core;

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
    @Column(name = "USER_ID", unique = true, nullable = false)
    private int userId;

    @Column(name = "LOGIN", unique = true, nullable = false, length = 12)
    private String login;

    @Column(name = "EMAIL", unique = true, nullable = false, length = 20)
    private String email;

    @Column(name = "PASSWORD", nullable = false, length = 16)
    private String password;

    @Column(name = "NAME", nullable = false, length = 35)
    private String name;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "userId")
    private List<Note> notes = new ArrayList<Note>();

    public User() {
    }

    public User(int userId, String login, String email, String password, String name) {
        this.userId = userId;
        this.login = login;
        this.email = email;
        this.password = password;
        this.name = name;
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

}
