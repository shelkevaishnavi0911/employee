package com.employee.management.exception;


	import org.springframework.ui.Model;
	import org.springframework.web.bind.annotation.ControllerAdvice;
	import org.springframework.web.bind.annotation.ExceptionHandler;

	@ControllerAdvice
	public class GlobalExceptionHandler {

	    @ExceptionHandler(Exception.class)
	    public String handleGlobalException(Exception ex, Model model) {

	        model.addAttribute("error",
	                "Something went wrong. Please try again later.");

	        return "error";
	    }
	}


