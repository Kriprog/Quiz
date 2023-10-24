package com.valiit.quiz.question;
import com.valiit.quiz.utility.Shuffler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Service
public class QuestionService {

    private final QuestionRepository questionRepository;

    @Autowired
    public QuestionService(QuestionRepository questionRepository) {
        this.questionRepository = questionRepository;
    }



    public Question getRandomQuestion() {
        // Fetch a random question from the database
        Question randomQuestion = questionRepository.findRandomQuestion();

        // Create a list of all four options
        List<String> options = new ArrayList<>();
        options.add(randomQuestion.getOption1());
        options.add(randomQuestion.getOption2());
        options.add(randomQuestion.getOption3());
        options.add(randomQuestion.getCorrect_answer());

        // Shuffle the positions of all four options
        List<String> shuffledOptions = Shuffler.shuffleOptions(options);

        // Set the shuffled options back to the Question entity
        randomQuestion.setOption1(shuffledOptions.get(0));
        randomQuestion.setOption2(shuffledOptions.get(1));
        randomQuestion.setOption3(shuffledOptions.get(2));
        randomQuestion.setCorrect_answer(shuffledOptions.get(3));

        return randomQuestion;
    }
}