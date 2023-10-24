package com.valiit.quiz.question;

import lombok.Getter;
import lombok.Setter;
import java.util.Set;
    @Getter
    @Setter

    public class QuestionDto {
        private String questionText;
        private String correctAnswer;
        private Set<String> options;

    }