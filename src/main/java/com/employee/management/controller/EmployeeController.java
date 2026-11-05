package com.employee.management.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;
import com.employee.management.entity.Employee;
import com.employee.management.exception.InvalidPhotoException;
import com.employee.management.serviceImpl.EmployeeService;
import com.employee.management.serviceImpl.FileStorageService;

import jakarta.validation.Valid;

import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
	
    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private FileStorageService fileStorageService;

    @GetMapping("/register")
    public String showRegistrationForm(Model model) {

        model.addAttribute("employee", new Employee());

        return "employee/registration";
    }


    @PostMapping("/register")
    public String registerEmployee(
            @Valid @ModelAttribute("employee") Employee employee,
            BindingResult result,
            @RequestParam("photo") MultipartFile photo,
            Model model) {
    	if (result.hasErrors()) {

    	    Map<String, String> errors = new HashMap<>();

    	    result.getFieldErrors().forEach(error ->
    	        errors.putIfAbsent(
    	            error.getField(),
    	            error.getDefaultMessage()
    	        )
    	    );

    	    model.addAttribute("errors", errors);

    	    return "employee/registration";
    	}

        try {
            String photoPath = fileStorageService.savePhoto(photo);
            employee.setPhotoPath(photoPath);

            Employee savedEmployee =
                    employeeService.registerEmployee(employee);

            return "redirect:/employee/status?id=" + savedEmployee.getId();

        } catch (IOException | InvalidPhotoException  e) {
            model.addAttribute("error", e.getMessage());
            return "employee/registration";
        }
    }

    // Check Application Status
//    @GetMapping("/status")
//    public String checkApplicationStatus(
//            @RequestParam("id") Long id, Model model) {
//
//        Employee employee = employeeService.getEmployeeById(id);
//
//        model.addAttribute("employee", employee);
//
//        return "employee/application-status";
//    }
    
    @GetMapping("/status")
    public String applicationStatus(
            @RequestParam("id") Long id,
            Model model) {

        try {
            Employee employee = employeeService.getEmployeeById(id);

            model.addAttribute("employee", employee);

        } catch (RuntimeException e) {

            model.addAttribute("error",
                    "Employee application not found.");
        }

        return "employee/application-status";
    }
 

}
