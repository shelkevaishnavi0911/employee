package com.employee.management.serviceImpl;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.employee.management.entity.User;
import com.employee.management.repository.UserRepository;

@Service
public class UserService {



    @Autowired
    private UserRepository userRepository;

   
    public Optional<User> getUserByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    
    public User saveUser(User user) {
        return userRepository.save(user);
    }

    
    public User getUserById(Long id) {
        return userRepository.findById(id)
                .orElseThrow(() ->
                    new RuntimeException("User not found"));
    }
}

