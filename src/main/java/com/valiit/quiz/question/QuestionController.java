package com.valiit.quiz.question;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class QuestionController {
    private final QuestionService questionService;

    @Autowired
    public QuestionController(QuestionService questionService) {
        this.questionService = questionService;
    }

    @GetMapping("/api/quiz")
    public ResponseEntity<QuestionDto> getRandomQuestionOptions() {
        QuestionDto questionDto = questionService.getRandomQuestion();
        return ResponseEntity.ok(questionDto);
    }

    @PostMapping("/api/check-answer")
    public ResponseEntity<AnswerResponseDto> checkAnswer(@RequestBody AnswerCheckDto answerRequest) {
        Integer id = answerRequest.getId();
        String selectedAnswer = answerRequest.getSelectedAnswer();
        boolean isCorrect = questionService.checkAnswer(id, selectedAnswer);
        return ResponseEntity.ok(new AnswerResponseDto(isCorrect));
    }

}


