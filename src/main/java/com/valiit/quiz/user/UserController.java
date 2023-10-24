package com.valiit.quiz.user;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;


import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping(path = "api")
public class UserController {
    private final UserRepository userRepository;

    @Autowired
    private UserService userService;

    @PostMapping("register")
    public void createUser(@RequestBody @Valid CreateUserDto createUserDto) {

        String passwordHash = PasswordManager.hashPassword(createUserDto.password());

        UserAccount user = UserMapper.INSTANCE.toUser(createUserDto);
        user.setPassword(passwordHash);

        UserAccount savedUser = userRepository.save(user);

        System.out.println(savedUser);
    }

    @PostMapping("login")
    public ResponseEntity<Map<String, String>> login(@RequestBody @Valid LoginRequestDTO loginRequestDTO) {
        String email = loginRequestDTO.email();
        String enteredPassword = loginRequestDTO.password();

        if (email == null || email.isEmpty() || enteredPassword == null || enteredPassword.isEmpty()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(createErrorResponse("Invalid input"));
        }

        UserAccount userAccount = userService.getUserByEmail(email);

        if (userAccount == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(createErrorResponse("Useraccount not found"));
        }

        String storedPasswordHash = userAccount.getPassword();

        if (PasswordManager.verifyPassword(enteredPassword, storedPasswordHash)) {
            String sessionToken = SessionManager.generateSessionToken();
            SessionManager.storeSessionToken(userAccount.getId(), sessionToken, String.valueOf(SessionManager.expirationTimestamp));

            Map<String, String> responseMap = new HashMap<>();
            responseMap.put("message", "Login successful");
            responseMap.put("sessionToken", sessionToken);
            responseMap.put("name", userAccount.getName());
            responseMap.put("highscore", String.valueOf(userAccount.getHighscore()));


            HttpHeaders headers = new HttpHeaders();
            headers.add("X-Session-Token", sessionToken);

            return ResponseEntity.ok()
                    .headers(headers)
                    .body(responseMap);
        } else {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(createErrorResponse("Invalid login credentials"));
        }
    }

    private Map<String, String> createErrorResponse(String message) {
        Map<String, String> errorResponse = new HashMap<>();
        errorResponse.put("message", message);
        return errorResponse;
    }
    @GetMapping("highscores")
    public ResponseEntity<List<UserAccount>> getTop10HighScores() {
        List<UserAccount> top10HighScores = userService.getTop10HighScores();
        return ResponseEntity.ok(top10HighScores);
    }
}




