package com.valiit.quiz.user;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public record LoginRequestDTO(
        @NotBlank
        String password,
        @NotBlank
        String email
) {
}