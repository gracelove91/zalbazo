package kr.zalbazo.controller;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@Log4j
public class BasicController {

    @RequestMapping(value = "/welcome", produces = "application/json;charset=UTF-8;")
    @ResponseBody
    public String welcome(){
        return "웰컴이다 이말이야";
    }

    @GetMapping("/home")
    public String home(){
        log.info("로그에 찍혀야한단 말이야");
        return "home";
    }
}
