package ifua.pu.mathmaps.controller;

import ifua.pu.mathmaps.model.User;
import ifua.pu.mathmaps.model.UserRole;
import ifua.pu.mathmaps.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
public class AuthorizationController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String adminPage(Map<String, Object> map) {
        map.put("message", "This page is for ROLE_ADMIN only!");

        return "admin";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(
            @RequestParam(value = "error", required = false) String error,
            HttpServletRequest request,
            Map<String, Object> map) {
        if (error != null) {
            map.put("error", getErrorMessage(request, "SPRING_SECURITY_LAST_EXCEPTION"));
        }

        return "login";
    }

    private String getErrorMessage(HttpServletRequest request, String key) {
        Exception exception = (Exception) request.getSession().getAttribute(key);
        String error = "";
        if (exception instanceof BadCredentialsException) {
            error = "Хибний логін або пароль!";
        } else if (exception instanceof LockedException) {
            error = exception.getMessage();
        } else {
            error = "Хибний логін або пароль!";
        }

        return error;
    }

    @RequestMapping(value = "/403", method = RequestMethod.GET)
    public String accessDenied(Map<String, Object> map) {
        // check if user is login
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)) {
            UserDetails userDetail = (UserDetails) auth.getPrincipal();
            System.out.println(userDetail);

            map.put("username", userDetail.getUsername());
        }

        return "403";

    }

    @RequestMapping("/signup")
    public String signUp(ModelMap model){

        return "signup";
    }

    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
    public String addUser(@ModelAttribute User user, ModelMap model){

        user.setUsername(user.getUsername().trim());
        user.setEmail(user.getEmail().trim());
        user.getUserRole().add(new UserRole(user, "USER"));
        user.setEnabled(true);

        userService.saveUser(user);

        return "redirect:/user/page/" + user.getUsername();
    }
}
