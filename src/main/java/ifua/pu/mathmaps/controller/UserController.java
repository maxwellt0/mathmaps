package ifua.pu.mathmaps.controller;

import ifua.pu.mathmaps.model.Note;
import ifua.pu.mathmaps.model.User;
import ifua.pu.mathmaps.model.UserNote;
import ifua.pu.mathmaps.service.NoteService;
import ifua.pu.mathmaps.service.UserNoteService;
import ifua.pu.mathmaps.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Controller
@RequestMapping("/user")
public class UserController {

    public static final String LISTS = "lists";
    public static final String TYPES = "types";

    private static final Logger log = Logger.getLogger(UserController.class);
    public static final String NOTE = "note";
    public static final String USERS = "users";
    public static final String USER = "user";

    @Autowired
    private UserService userService;

    @Autowired
    private NoteService noteService;

    @Autowired
    private UserNoteService userNoteService;

    @PostAuthorize("#username == principal.name")
    @RequestMapping("/page/{username}")
    public String getUserPage(@PathVariable String username,
                              ModelMap map) {
        User user = userService.getUser(username);
        Set<UserNote> userNotes = user.getUserNotes();

        List<Note> scheduled = new ArrayList<Note>();
        List<Note> learning = new ArrayList<Note>();
        List<Note> studied = new ArrayList<Note>();
        List<Note> postponed = new ArrayList<Note>();
        List<Note> left = new ArrayList<Note>();

        for (UserNote un :userNotes) {
            Note note = un.getNote();
            switch (un.getStatus()) {
                case 1: scheduled.add(note);
                    break;
                case 2: learning.add(note);
                    break;
                case 3: studied.add(note);
                    break;
                case 4: postponed.add(note);
                    break;
                case 5: left.add(note);
                    break;
                default:
                    log.debug("Added note with status 0");
                    break;
            }
        }
        List<List> lists = new ArrayList<List>();
        lists.add(scheduled);
        lists.add(learning);
        lists.add(studied);
        lists.add(postponed);
        lists.add(left);
        String[] types = {"Заплановано", "Вивчається", "Вивчено", "Відкладено", "Покинуто"};

        map.addAttribute(LISTS, lists);
        map.addAttribute(TYPES, types);
        map.addAttribute(NOTE, new Note());

        return "user/userPage";
    }

    @PostAuthorize("hasRole('ADMIN')")
    @RequestMapping("/admin")
    public String getAdminPage(ModelMap map) {
        List<Note> offered = noteService.getNotesWithStatus(1);
        List<Note> published = noteService.getNotesWithStatus(2);
        List<Note> denied  = noteService.getNotesWithStatus(3);

        List<List> listsOfNotes = new ArrayList<List>();
        listsOfNotes.add(offered);
        listsOfNotes.add(published);
        listsOfNotes.add(denied);

        String[] types = {"Пропонується", "Опубліковано", "Відхилено"};

        map.addAttribute(LISTS, listsOfNotes);
        map.addAttribute(TYPES, types);

        return "user/admin";
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @RequestMapping("/admin/users")
    public String getUserList(ModelMap map) {
        List<User> users = userService.listUsers();

        map.addAttribute(USERS, users);

        return "user/userList";
    }

    @RequestMapping("/admin/users/{username}")
    public String getUserForAdmin(@PathVariable String username, ModelMap map) {

        User user = userService.getUser(username);

        map.addAttribute(USER, user);

        return "/user/userForm";
    }

    @RequestMapping(value = "/admin/users/update", method = RequestMethod.POST)
    public String saveUser(@ModelAttribute("user") User user,
                           BindingResult result) {

        userService.saveUser(user);

        return "redirect:../admin/users";
    }

//    @RequestMapping("/delete/{userId}")
//    public String deleteUser(@PathVariable("userId") int id) {
//
//        userService.deleteUser(id);
//
//              /*
//               * redirects to the path relative to the current path
//               */
//        // return "redirect:../listUsers";
//
//              /*
//               * Note that there is the slash "/" right after "redirect:"
//               * So, it redirects to the path relative to the project root path
//               */
//        return "redirect:/user/listUsers";
//    }

}
