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


    /*  public QuestionDto getRandomQuestion() {
          QuestionDto randomQuestion = questionRepository.findRandomQuestion();
          QuestionDto responseDto = new QuestionDto();

          // Set values for the QuestionResponseDto
          responseDto.setQuestionText(randomQuestion.getQuestionText());
          responseDto.setOptions(new HashSet<>(randomQuestion.getOptions()));


          return responseDto;
      }*/
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
        // Retrieve the correct answer for the given questionId from the database
        String correctAnswer = questionRepository.findCorrectAnswerById(id);

        if (correctAnswer != null) {
            // Compare the selected answer with the correct answer
            return selectedAnswer != null && selectedAnswer.trim().equalsIgnoreCase(correctAnswer.trim());
        } else {
            // Handle the case where correctAnswer is null (e.g., return false)
            return false;
        }
}
}