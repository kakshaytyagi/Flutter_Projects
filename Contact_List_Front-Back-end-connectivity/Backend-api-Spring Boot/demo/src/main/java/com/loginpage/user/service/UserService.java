package com.loginpage.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.loginpage.user.dao.UserRepo;
import com.loginpage.user.entity.User;

@Service
@Component
public class UserService {
    private final UserRepo userRepository;

    @Autowired
    public UserService(UserRepo userRepository) {
        this.userRepository = userRepository;
    }

    public User createUser(User user) {
        // Add any additional logic, such as password encryption, before saving the user
        return userRepository.save(user);
    }

    public User getUserByUsername(String username) {
        return userRepository.findByUsername(username);
    }
}
