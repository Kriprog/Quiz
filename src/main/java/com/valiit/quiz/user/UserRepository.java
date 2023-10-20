package com.valiit.quiz.user;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;


    public interface UserRepository extends CrudRepository<UserAccount, Integer> {

        // spring genereerib automaatselt andmebaasi päringu
        // vastavalt meetodi nimele - on oluline, et vastaks kindlale formaadile

       // Client findClientByName(String name);

      //  @Query(value = "select * from user_account", nativeQuery = true)
      //  List<user_account> getAll();
      //  @Query(value = "select c from user_account c") // as JPA (Java oersistance api) syntax, JPQL
      //  List<Client> findAllAsList();
    }
