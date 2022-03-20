package com.backendvendaslimpeza.project.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/hello")
public class HelloController {

    @GetMapping
    public String helloWorld() {
        return "Hello World";
    }
}
