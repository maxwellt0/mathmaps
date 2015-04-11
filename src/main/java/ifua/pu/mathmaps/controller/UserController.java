package ifua.pu.mathmaps.controller;

import ifua.pu.mathmaps.model.User;
import ifua.pu.mathmaps.service.NoteService;
import ifua.pu.mathmaps.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Map;

/**
 * Created by Maxwellt on 11.04.2015.
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private NoteService noteService;

    @RequestMapping(value = { "/", "/listUsers" })
    public String listUsers(Map<String, Object> map) {

        map.put("user", new User());

        map.put("userList", userService.listUsers());

        return "/user/listUsers";
    }

    @RequestMapping("/get/{userId}")
    public String getUser(@PathVariable int userId, Map<String, Object> map) {

        User user = userService.getUser(userId);

        map.put("user", user);

        return "/user/userForm";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String saveUser(@ModelAttribute("user") User user,
                           BindingResult result) {

        user.setNotes(noteService.listNotes());
        userService.saveUser(user);

              /*
               * Note that there is no slash "/" right after "redirect:"
               * So, it redirects to the path relative to the current path
               */
        return "redirect:listUsers";
    }

    @RequestMapping("/delete/{userId}")
    public String deleteUser(@PathVariable("userId") int id) {

        userService.deleteUser(id);

              /*
               * redirects to the path relative to the current path
               */
        // return "redirect:../listUsers";

              /*
               * Note that there is the slash "/" right after "redirect:"
               * So, it redirects to the path relative to the project root path
               */
        return "redirect:/user/listUsers";
    }
}
