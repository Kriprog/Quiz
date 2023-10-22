package com.valiit.quiz.user;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;


public interface UserRepository extends CrudRepository<UserAccount, Integer> {

    UserAccount findByEmail(@Param("email") String email);


}