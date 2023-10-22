package com.valiit.quiz.user;

import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import lombok.RequiredArgsConstructor;

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
    @GetMapping("login")
    public ResponseEntity<String> login(
            @RequestParam String email,
            @RequestParam String enteredPassword) {

        System.out.println("received email: " + email);
        System.out.println("received password: " + enteredPassword);

        if (email == null || email.isEmpty() || enteredPassword == null || enteredPassword.isEmpty()) {
            System.out.println("invalid input");
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Invalid input");
        }

        UserAccount userAccount = userService.getUserByEmail(email);

        if (userAccount == null) {
            System.out.println("useraccount not found");
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Useraccount not found");
        }

        String storedPasswordHash = userAccount.getPassword();
        System.out.println("databaasis: " + storedPasswordHash);
        System.out.println("sisestatud: " + PasswordManager.hashPassword(enteredPassword));

        if (PasswordManager.verifyPassword(enteredPassword, storedPasswordHash)) {
            System.out.println("login worked for " + userAccount);
            return ResponseEntity.ok("Login successful");
        } else {
            System.out.println("invalid password");
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Invalid password");
        }
    }
}
