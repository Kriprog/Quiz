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

    public QuestionDto getOptionsForRandomQuestion() {
        Question randomQuestion = questionRepository.findRandomQuestion();

        QuestionDto questionDto = new QuestionDto();

        questionDto.setQuestionText(randomQuestion.getQuestion_text());
        questionDto.setCorrectAnswer(randomQuestion.getCorrect_answer());

        Set<String> options = new HashSet<>();

        options.add(randomQuestion.getOption1());
        options.add(randomQuestion.getOption2());
        options.add(randomQuestion.getOption3());

        questionDto.setOptions(options);

        return questionDto;
}
}