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
    @PostMapping("user")
    public void createUser(@RequestBody @Valid CreateUserDto createUserDto) {
       // CreateUserDto -> User (mapper)
      //User user = UserMapper.INSTANCE.toUser(createUserDto);
        // create / save new client
      //User savedUser = userRepository.save(user);
        // return dto object from new client as json
        //  userRepository.save();
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(createUserDto.password().getBytes(StandardCharsets.UTF_8));
            String sha256hex = new String(Hex.encode(hash));
            System.out.println("hex: " + sha256hex);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
}
