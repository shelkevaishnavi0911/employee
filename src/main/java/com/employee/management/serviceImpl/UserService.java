package com.employee.management.serviceImpl;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.employee.management.entity.User;
import com.employee.management.exception.DuplicateUsernameException;
import com.employee.management.exception.UserNotFoundException;
import com.employee.management.repository.UserRepository;
import org.springframework.security.crypto.password.PasswordEncoder;

@Service
public class UserService {



    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private PasswordEncoder passwordEncoder;

   
    public Optional<User> getUserByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    
    public User saveUser(User user) {
        return userRepository.save(user);
    }

    
    public User getUserById(Long id) {
        return userRepository.findById(id)
                .orElseThrow(() ->
                    new UserNotFoundException("User not found"));
    }
    
 
    public void createAdmin(String username, String password) {

        if (userRepository.findByUsername(username).isPresent()) {
            throw new DuplicateUsernameException("Username already exists!");
        }

        User user = new User();
        user.setUsername(username);
        user.setPassword(passwordEncoder.encode(password));
        user.setRole("ADMIN");

        userRepository.save(user);
    }
}

