package com.valiit.quiz.user;

import com.valiit.quiz.user.UserAccount;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
public class UserAnswer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    // Use the @Column annotation to map the user_id field to the corresponding column in the table
    @Column(name = "user_id")
    private Integer userId;

    private Integer questionId;

    @ManyToOne
    @JoinColumn(name = "user_id", insertable = false, updatable = false)
    private UserAccount user;
}
