package com.employee.management.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import com.employee.management.serviceImpl.CustomUserDetailsService;
import jakarta.servlet.DispatcherType;

@Configuration
public class SecurityConfig {

    @Autowired
    private CustomUserDetailsService customUserDetailsService;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http)
            throws Exception {

        http
            .userDetailsService(customUserDetailsService)

            .authorizeHttpRequests(auth -> auth

            		
            	    .dispatcherTypeMatchers(
            	        DispatcherType.FORWARD,
            	        DispatcherType.ERROR
            	    ).permitAll()
                
                .requestMatchers(
                    "/admin/login",
                    "/employee/register",
                    "/employee/status",
                    "/css/**",
                    "/js/**",
                    "/images/**",
                    "/error"
                ).permitAll()

                // Admin-only pages
                .requestMatchers("/admin/**").hasRole("ADMIN")

                .anyRequest().authenticated()
            )

            .formLogin(form -> form
                .loginPage("/admin/login")
                .loginProcessingUrl("/admin/login")
                .usernameParameter("username")
                .passwordParameter("password")
                .defaultSuccessUrl("/admin/dashboard", true)
                .failureUrl("/admin/login?error=true")
                .permitAll()
            )

            .logout(logout -> logout
                .logoutUrl("/admin/logout")
                .logoutSuccessUrl("/admin/login?logout=true")
                .permitAll()
            );

        return http.build();
    }
}
