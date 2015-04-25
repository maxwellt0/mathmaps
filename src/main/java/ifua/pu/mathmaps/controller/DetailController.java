package ifua.pu.mathmaps.controller;

import ifua.pu.mathmaps.model.Note;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller
public class DetailController {

    @RequestMapping(value = "/")
    public String getIndexPage() {
        return "index";
    }

}
