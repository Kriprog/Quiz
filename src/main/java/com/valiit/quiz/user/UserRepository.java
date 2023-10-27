package com.valiit.quiz.user;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;


public interface UserRepository extends CrudRepository<UserAccount, Integer> {

    UserAccount findByEmail(@Param("email") String email);

    @Query("SELECT u FROM UserAccount u ORDER BY u.highscore DESC, u.highscore_date ASC LIMIT 10")
    List<UserAccount> findTop10HighScores();



}