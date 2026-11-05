package com.employee.management.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.employee.management.entity.Employee;

@Repository
public interface  EmployeeRepository  extends JpaRepository<Employee, Long> {

	List<Employee> findByStatus(String status);
	
	long countByStatus(String status);
}
