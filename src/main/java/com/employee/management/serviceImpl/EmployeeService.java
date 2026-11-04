package com.employee.management.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.employee.management.entity.Employee;
import com.employee.management.repository.EmployeeRepository;

@Service
public class EmployeeService {


    @Autowired
    private EmployeeRepository employeeRepository;

    
    public Employee registerEmployee(Employee employee) {
        employee.setStatus("PENDING");
        return employeeRepository.save(employee);
    }

  
    public List<Employee> getAllEmployees() {
        return employeeRepository.findAll();
    }

  
    public Employee getEmployeeById(Long id) {
        return employeeRepository.findById(id)
                .orElseThrow(() ->
                    new RuntimeException("Employee not found"));
    }

    
    public String getApplicationStatus(Long id) {
        Employee employee = getEmployeeById(id);
        return employee.getStatus();
    }

    
    public Employee acceptEmployee(Long id) {
        Employee employee = getEmployeeById(id);
        employee.setStatus("ACCEPTED");
        employee.setRejectionReason(null);

        return employeeRepository.save(employee);
    }

    
    public Employee rejectEmployee(Long id, String reason) {
        Employee employee = getEmployeeById(id);
        employee.setStatus("REJECTED");
        employee.setRejectionReason(reason);

        return employeeRepository.save(employee);
    }
    

public List<Employee> getPendingEmployees() {
    return employeeRepository.findByStatus("PENDING");
}

public List<Employee> getAcceptedEmployees() {
    return employeeRepository.findByStatus("ACCEPTED");
}

public List<Employee> getRejectedEmployees() {
    return employeeRepository.findByStatus("REJECTED");
}

public Employee reconsiderEmployee(Long id) {

    Employee employee = getEmployeeById(id);

    employee.setStatus("PENDING");
    employee.setRejectionReason(null);

    return employeeRepository.save(employee);
}
}

