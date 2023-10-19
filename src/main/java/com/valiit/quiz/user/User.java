package com.valiit.quiz.user;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "user_account_id")
    @SequenceGenerator(name="user_account_id", sequenceName = "user_account_id_seq", allocationSize=1)
    private Integer id;
    private String name;
    private String password;
    private String email;
    private Integer highscore;

}
