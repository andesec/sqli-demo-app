package com.andesec.sqli.controller;

import com.andesec.sqli.SqlInjectionDemoApplication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class HomeController {

    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute("manager", SqlInjectionDemoApplication.LOGGED_IN_MANAGER);
        return "index"; // Thymeleaf template
    }
}