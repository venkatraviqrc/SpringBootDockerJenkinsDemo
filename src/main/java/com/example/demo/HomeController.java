package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeController {

    @GetMapping("/")
    public String home() {
        return "Home Page Working";
    }

    @GetMapping("/demo")
    public String demo() {
        return "Home Page Working v2";
    }

    @GetMapping("/hello")
    public String hello() {
        return "Hello DevOps CI/CD!";
    }
}
