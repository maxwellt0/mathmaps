package ifua.pu.mathmaps.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DetailController {

    @RequestMapping(value = "/")
    public String getIndexPage() {
        return "redirect:/maps/";
    }

}
