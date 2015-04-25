package ifua.pu.mathmaps.service.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import ifua.pu.mathmaps.dao.UserDao;
import ifua.pu.mathmaps.model.UserRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("userDetailsService")
public class UserDetailsServiceImpl implements UserDetailsService {

    //get user from the database, via Hibernate
    @Autowired
    private UserDao userDao;

    @Transactional(readOnly=true)
    public UserDetails loadUserByUsername(final String username)
            throws UsernameNotFoundException {

        ifua.pu.mathmaps.model.User user = userDao.findByUserName(username);
        System.out.println("got: " + user.getUsername() + " : " + user.getPassword());
        System.out.println("got role: " + user.getUserRole());
        List<GrantedAuthority> authorities =
                buildUserAuthority(user.getUserRole());

        return buildUserForAuthentication(user, authorities);

    }

    // Converts ifua.pu.mathmaps.model.User user to
    // org.springframework.security.core.userdetails.User
    private User buildUserForAuthentication(ifua.pu.mathmaps.model.User user,
                                            List<GrantedAuthority> authorities) {
        System.out.println(user.getUsername() + " : " + user.getPassword());
        System.out.println(user.getUserRole());
        System.out.println(user.isEnabled());
        return new User(user.getUsername(), user.getPassword(),
                user.isEnabled(), true, true, true, authorities);
    }

    private List<GrantedAuthority> buildUserAuthority(Set<UserRole> userRoles) {

        Set<GrantedAuthority> setAuths = new HashSet<GrantedAuthority>();

        // Build user's authorities
        for (UserRole userRole : userRoles) {
            setAuths.add(new SimpleGrantedAuthority(userRole.getRole()));
            System.out.println(userRole.getRole());
        }

        List<GrantedAuthority> Result = new ArrayList<GrantedAuthority>(setAuths);

        return Result;
    }

}