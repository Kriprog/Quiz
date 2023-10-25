package com.valiit.quiz.question;

import lombok.Getter;
import lombok.Setter;

import java.util.List;
import java.util.Set;
    @Getter
    @Setter

    public class QuestionDto {
        private Integer id;
        private String questionText;
        private List<String> options;
        private String selectedAnswer;

    }