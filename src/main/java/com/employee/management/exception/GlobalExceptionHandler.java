package com.employee.management.exception;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlobalExceptionHandler {

  
    @ExceptionHandler(EmployeeNotFoundException.class)
    public String handleEmployeeNotFound(
            EmployeeNotFoundException ex, Model model) {

        model.addAttribute("error", ex.getMessage());

        return "error";
    }

   
    @ExceptionHandler(InvalidPhotoException.class)
    public String handleInvalidPhoto(
            InvalidPhotoException ex, Model model) {

        model.addAttribute("error", ex.getMessage());

        return "error";
    }
    
    @ExceptionHandler(UserNotFoundException.class)
    public String handleUserNotFound(
            UserNotFoundException ex, Model model) {

        model.addAttribute("error", ex.getMessage());
        return "error";
    }

    @ExceptionHandler(DuplicateUsernameException.class)
    public String handleDuplicateUsername(
            DuplicateUsernameException ex, Model model) {

        model.addAttribute("error", ex.getMessage());
        return "error";
    }

   
    @ExceptionHandler(Exception.class)
    public String handleGlobalException(
            Exception ex, Model model) {

        model.addAttribute("error",
                "Something went wrong. Please try again later.");

        return "error";
    }
}
