package com.valiit.quiz.question;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface QuestionRepository extends JpaRepository<Question, Long> {
    @Query(value = "SELECT * FROM question ORDER BY RANDOM() LIMIT 1", nativeQuery = true)
    Question findRandomQuestion();

    @Query(value = "SELECT q.correctAnswer FROM Question q WHERE q.id = :id")
    String findCorrectAnswerById(Integer id);
}
