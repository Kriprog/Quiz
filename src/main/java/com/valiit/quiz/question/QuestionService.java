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

        System.out.println("Question" + randomQuestion.getQuestionText());
        System.out.println("Before shuffle option 1: " + options.get(0));
        System.out.println("Before shuffle option 2: " + options.get(1));
        System.out.println("Before shuffle option 3: " + options.get(2));
        System.out.println("Before shuffle correct answer: " + options.get(3));

        Shuffle.shuffle(options);

        System.out.println("After shuffle option 1: " + options.get(0));
        System.out.println("After shuffle option 2: " + options.get(1));
        System.out.println("After shuffle option 3: " + options.get(2));
        System.out.println("After shuffle correct answer: " + options.get(3));

        questionDto.setOptions(options);

        return questionDto;
    }
}
