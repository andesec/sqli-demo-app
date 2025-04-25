package com.andesec.sqli;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class SqlInjectionDemoApplication {
    // Simulated logged-in manager
    public static final String LOGGED_IN_MANAGER = "alice";

    public static void main(String[] args) {
        SpringApplication.run(SqlInjectionDemoApplication.class, args);
    }
}