package com.koitt.tim;

import org.springframework.web.bind.annotation.GetMapping;

@org.springframework.stereotype.Controller
public class Controller {

    @GetMapping("test")
    public String home(){
        return "test";
    }

}
