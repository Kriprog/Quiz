package com.valiit.quiz.user;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {

    private static UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        UserService.userRepository = userRepository;
    }

    public UserAccount getUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    public List<UserAccount> getTop10HighScores() {
        // Call the custom repository method to get the top 10 high scores
        return userRepository.findTop10HighScores();
    }

}
