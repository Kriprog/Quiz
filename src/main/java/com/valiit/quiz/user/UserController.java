package com.valiit.quiz.user;

import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping(path = "user-controller")
public class UserController {
    private final UserRepository userRepository;
    @PostMapping("user")
    public void createUser(@RequestBody @Valid CreateUserDto createUserDto) {
       // CreateUserDto -> User (mapper)
      User user = UserMapper.INSTANCE.toUser(createUserDto);
        // create / save new client
      User savedUser = userRepository.save(user);
        // return dto object from new client as json
      //  userRepository.save();

    }
}
