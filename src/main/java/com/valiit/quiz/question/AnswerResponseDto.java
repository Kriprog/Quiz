package com.valiit.quiz.question;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Data
public class AnswerResponseDto {
    private boolean isCorrect;
    public AnswerResponseDto(boolean isCorrect) {
        this.isCorrect = isCorrect;
    }
}

