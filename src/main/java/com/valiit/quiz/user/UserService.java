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
    public UserAccount findUserById(Integer id) {
        return userRepository.findById(id).orElse(null);
    }

    public Integer getHighScore(Integer userId) {
        UserAccount user = findUserById(userId);
        if (user != null) {
            return user.getHighscore();
        }
        // You might want to handle the case where the user is not found, e.g., return a default value or throw an exception.
        return null;
    }
    public void updateUserHighScore(Integer userId, Integer newHighScore) {
        System.out.println("Updating high score for user with ID: " + userId);
        UserAccount user = findUserById(userId);
        if (user != null) {
            System.out.println("User found. Current high score: " + user.getHighscore());
            user.setHighscore(newHighScore);
            System.out.println("Updating high score to: " + newHighScore);
            userRepository.save(user); // Use the save method to update the user
            System.out.println("High score updated successfully.");
        }
    }
}
