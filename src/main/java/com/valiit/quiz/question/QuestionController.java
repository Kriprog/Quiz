package com.valiit.quiz.question;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Set;

@RestController
public class QuestionController {

    private final QuestionService questionService;

    @Autowired
    public QuestionController(QuestionService questionService) {
        this.questionService = questionService;
    }

   /* @GetMapping("/api/quiz")
    public QuestionDto getRandomQuestion() {
        return questionService.getRandomQuestion();*/

    @GetMapping("/api/quiz")
        public ResponseEntity<QuestionDto> getRandomQuestionOptions() {
        QuestionDto questionDto = questionService.getOptionsForRandomQuestion();
            return ResponseEntity.ok(questionDto);
    }

}


