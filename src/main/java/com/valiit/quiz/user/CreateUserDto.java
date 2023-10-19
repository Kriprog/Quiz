package com.valiit.quiz.user;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public record CreateUserDto(
        @NotBlank(message = "minu veateate sisu: postedName on kohustuslik")
        String name,
        @NotNull
        String password,
        @NotNull
        @Email(message = "postedEmail peab vastama e-maili formaadile", regexp = "[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}")
        String email,
        Integer highscore

) {
}
