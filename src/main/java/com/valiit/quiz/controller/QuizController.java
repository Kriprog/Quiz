package com.valiit.quiz.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
public class QuizController {

    @GetMapping("/api/quiz")
    public Map<String, String> demo () {
        return Map.of("message", "Wednesday is almost over!");
    }

    @PostMapping("/api/quiz")
    public void demoPost (@RequestBody Map<String, String> body) {
        System.out.println(body.get("email"));
    }
}
