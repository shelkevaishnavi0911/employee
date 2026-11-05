package com.employee.management.repository;

import java.util.Optional;

import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.JpaRepository;

import com.employee.management.entity.User;

@Repository
public interface  UserRepository  extends JpaRepository<User, Long>{
    Optional<User> findByUsername(String username);
    
    

}
