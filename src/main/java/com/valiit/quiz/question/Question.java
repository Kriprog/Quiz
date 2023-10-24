package com.valiit.quiz.question;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
public class Question {
    @Id
   // @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "questions_id") //For future implementation of user added questions
    private Integer id;
    private String question_text;
    private String correct_answer;
    private String option1;
    private String option2;
    private String option3;
    // DTO kus on questionText ja massiiv valikutest Set<String> options
}
