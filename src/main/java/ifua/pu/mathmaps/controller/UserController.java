package ifua.pu.mathmaps.controller;

import ifua.pu.mathmaps.model.Note;
import ifua.pu.mathmaps.model.User;
import ifua.pu.mathmaps.model.join.UserNote;
import ifua.pu.mathmaps.service.NoteService;
import ifua.pu.mathmaps.service.UserNoteService;
import ifua.pu.mathmaps.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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
                    System.out.println("ERROR!");
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

        return "user/userPage";
    }
//    @RequestMapping(value = { "/", "/listUsers" })
//    public String listUsers(Map<String, Object> map) {
//
//        map.put("user", new User());
//
//        map.put("userList", userService.listUsers());
//
//        return "/user/listUsers";
//    }

//    @RequestMapping("/get/{userId}")
//    public String getUser(@PathVariable int userId, Map<String, Object> map) {
//
//        User user = userService.getUser(userId);
//
//        map.put("user", user);
//
//        return "/user/userForm";
//    }

//    @RequestMapping(value = "/save", method = RequestMethod.POST)
//    public String saveUser(@ModelAttribute("user") User user,
//                           BindingResult result) {
//
//        List<Note> list = noteService.listNotes();
//        Set<Note> set = user.getNotes();
//        for (Note n : list) {
//            set.add(n);
//        }
//        user.setNotes(set);
//
//        userService.saveUser(user);
//
//              /*
//               * Note that there is no slash "/" right after "redirect:"
//               * So, it redirects to the path relative to the current path
//               */
//        return "redirect:listUsers";
//    }

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

    @RequestMapping("/notes/add/{noteId}")
    public String addNote(@PathVariable int noteId){
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        log.debug("Security context returns name " + username);

        User user = userService.getUser(username);
        log.debug("Found user with username " + user.getUsername() + " and roles: " + user.getUserRole().toString());

        log.debug("Searching for note with id " + noteId);
        Note note = noteService.getNote(noteId);
        log.debug("Found note with name " + note.getName());

        UserNote userNote = new UserNote();
        userNote.setUser(user);
        userNote.setNote(note);
        userNote.setStatus(1);
        note.getUserNotes().add(userNote);

        log.debug("Saving the note for the user " + user.getUsername());

        noteService.saveNote(note);

        return "redirect:/note/page/" + noteId;
    }

    @RequestMapping("/notes/delete/{noteId}")
    public String deleteNote(@PathVariable int noteId){
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        log.debug("Security context returns name " + username);

        User user = userService.getUser(username);
        log.debug("Found user with username " + user.getUsername() + " and roles: " + user.getUserRole().toString());

        log.debug("Searching for note with id " + noteId);
        Note note = noteService.getNote(noteId);
        log.debug("Found note with name " + note.getName());;

        log.debug("Deleting the note from the user " + user.getUsername() + " list.");
        userNoteService.deleteUserNote(noteId, username);


        return "redirect:page/" + username;
    }

}
