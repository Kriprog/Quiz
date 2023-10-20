package com.valiit.quiz.user;

import jakarta.validation.Valid;
import org.bouncycastle.util.encoders.Hex;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@RestController
@RequiredArgsConstructor
@RequestMapping(path = "user-controller")
public class UserController {
    private final UserRepository userRepository;
    @PostMapping("/api/register")
    public void createUser(@RequestBody @Valid CreateUserDto createUserDto) {
        System.out.println("Please");
            String sha256hex = "";
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(createUserDto.password().getBytes(StandardCharsets.UTF_8));
            sha256hex = new String(Hex.encode(hash));
            System.out.println("hex: " + sha256hex);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
        System.out.println(sha256hex);
        UserAccount user = UserMapper.INSTANCE.toUser(createUserDto);
        user.setPassword(sha256hex);

        UserAccount savedUser = userRepository.save(user);

        System.out.println(savedUser);

    }
}
