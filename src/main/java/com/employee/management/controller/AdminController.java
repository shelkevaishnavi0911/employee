package com.employee.management.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.employee.management.entity.Employee;
import com.employee.management.serviceImpl.EmployeeService;
import org.springframework.ui.Model;

@Controller
@RequestMapping("/admin")
public class AdminController {
	



    @Autowired
    private EmployeeService employeeService;

    
    @GetMapping("/dashboard")
    public String dashboard(Model model) {

        List<Employee> employees = employeeService.getAllEmployees();

        model.addAttribute("employees", employees);
        model.addAttribute("totalPending",
                employeeService.getPendingEmployees().size());

        model.addAttribute("totalAccepted",
                employeeService.getAcceptedEmployees().size());

        model.addAttribute("totalRejected",
                employeeService.getRejectedEmployees().size());

        return "admin/dashboard";
    }

//    // Accept Employee
//    @PostMapping("/accept")
//    public String acceptEmployee(@RequestParam Long id) {
//
//        employeeService.acceptEmployee(id);
//
//        return "redirect:/admin/dashboard";
//    }

//    // Reject Employee
//    @PostMapping("/reject")
//    public String rejectEmployee(
//            @RequestParam Long id,
//            @RequestParam String reason) {
//
//        employeeService.rejectEmployee(id, reason);
//
//        return "redirect:/admin/dashboard";
//    }
    

@PostMapping("/reject/{id}")
public String rejectEmployee(
        @PathVariable Long id,
        @RequestParam String reason) {

    employeeService.rejectEmployee(id, reason);

    return "redirect:/admin/dashboard";
}
    

@GetMapping("/login")
public String showLoginPage(
        @RequestParam(value = "error", required = false) String error,
        @RequestParam(value = "logout", required = false) String logout,
        Model model) {

    if (error != null) {
        model.addAttribute("error", "Invalid username or password!");
    }

    if (logout != null) {
        model.addAttribute("message", "You have logged out successfully.");
    }

    return "admin/login";
}

@GetMapping("/pending")
public String pendingEmployees(Model model) {

    model.addAttribute(
        "employees",
        employeeService.getPendingEmployees()
    );

    return "admin/pending-list";
}

@PostMapping("/reconsider/{id}")
public String reconsiderEmployee(@PathVariable Long id) {

    Employee employee = employeeService.getEmployeeById(id);

    employee.setStatus("PENDING");
    employee.setRejectionReason(null);

    employeeService.registerEmployee(employee);

    return "redirect:/admin/rejected";
}

@PostMapping("/accept/{id}")
public String acceptEmployee(@PathVariable Long id) {

    employeeService.acceptEmployee(id);

    return "redirect:/admin/dashboard";
}

@GetMapping("/accepted")
public String acceptedEmployees(Model model) {

    model.addAttribute(
        "employees",
        employeeService.getAcceptedEmployees()
    );

    return "admin/accepted-list";
}

@GetMapping("/rejected")
public String rejectedEmployees(Model model) {

    model.addAttribute(
        "employees",
        employeeService.getRejectedEmployees()
    );

    return "admin/rejected-list";
}


//@PostMapping("/reject/{id}")
//public String rejectEmployee(
//        @PathVariable Long id,
//        @RequestParam String reason) {
//
//    employeeService.rejectEmployee(id, reason);
//
//    return "redirect:/admin/dashboard";
//}
}
