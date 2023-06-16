package com.loginpage.user.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.loginpage.user.entity.User;

public interface UserRepo extends JpaRepository<User, Long> {
    User findByUsername(String username);
}

//public interface UserRepo extends JpaRepository<User, Long> {
//    User findByUsername(String username);
//    
//    @Query("SELECT u FROM User u WHERE u.username = :username")
//    User findUserByUsername(@Param("username") String username);
// 
//    @Modifying
//    @Query("INSERT INTO User (username, password) VALUES (:username, :password)")
//    User saveUser(@Param("username") String username, @Param("password") String password);
//}



