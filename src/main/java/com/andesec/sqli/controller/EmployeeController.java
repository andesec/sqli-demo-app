package com.andesec.sqli.controller;

import com.andesec.sqli.SqlInjectionDemoApplication;
import com.andesec.sqli.model.Employee;
import com.andesec.sqli.repo.EmployeeRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLException;
import java.util.List;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class EmployeeController {
    private final EmployeeRepository repo;

    @GetMapping("/employees")
    public List<Employee> search(@RequestParam(defaultValue="") String q) throws SQLException {
        /* toggle ↓↓↓ to demo insecure vs secure build */
         return repo.findInsecure(SqlInjectionDemoApplication.LOGGED_IN_MANAGER, q); // ✗
//        return repo.findSecure(SqlInjectionDemoApplication.LOGGED_IN_MANAGER, q);      // ✓
    }
}