
package com.employee.management.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import com.employee.management.entity.User;
import com.employee.management.repository.UserRepository;

@Component
public class AdminUserInitializer implements CommandLineRunner {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public void run(String... args) throws Exception {

        User admin = userRepository.findByUsername("admin")
                .orElseGet(User::new);

        admin.setUsername("admin");
        admin.setPassword(passwordEncoder.encode("Admin@123"));
        admin.setRole("ADMIN");

        userRepository.save(admin);

        System.out.println("Admin password initialized successfully!");
    }
}
