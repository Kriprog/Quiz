package com.valiit.quiz.question;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class QuestionService {

    private final QuestionRepository questionRepository;

    @Autowired
    public QuestionService(QuestionRepository questionRepository) {
        this.questionRepository = questionRepository;
    }

    private static class Shuffle {
        public static void shuffle(List<String> options) {
            int n = options.size();
            Random random = new Random();
            for (int i = n - 1; i > 0; i--) {
                int j = random.nextInt(i + 1);
                String temp = options.get(i);
                options.set(i, options.get(j));
                options.set(j, temp);
            }
        }

    }

    public QuestionDto getRandomQuestion() {
        Question randomQuestion = questionRepository.findRandomQuestion();

        QuestionDto questionDto = new QuestionDto();
        questionDto.setId(randomQuestion.getId());
        questionDto.setQuestionText(randomQuestion.getQuestionText());
        List<String> options = new ArrayList<>();
        options.add(randomQuestion.getOption1());
        options.add(randomQuestion.getOption2());
        options.add(randomQuestion.getOption3());
        options.add(randomQuestion.getCorrectAnswer());

        Shuffle.shuffle(options);

        questionDto.setOptions(options);

        return questionDto;
    }

    public boolean checkAnswer(Integer id, String selectedAnswer) {
        String correctAnswer = questionRepository.findCorrectAnswerById(id);
        if (correctAnswer == null) {
            return false;
        }
        return selectedAnswer != null && selectedAnswer.trim().equalsIgnoreCase(correctAnswer.trim());
    }
}