package com.valiit.quiz.user;

import jakarta.validation.constraints.NotNull;

public record LoginRequestDTO(
        @NotNull
        String password,
        @NotNull
        String email
) {
}