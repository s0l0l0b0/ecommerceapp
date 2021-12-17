package com.sololobo.ecommerceapp.controller;

import com.sololobo.ecommerceapp.domain.User;
import com.sololobo.ecommerceapp.domain.enumeration.Role;
import com.sololobo.ecommerceapp.model.RegistrationDTO;
import com.sololobo.ecommerceapp.repository.UserRepository;
import com.sololobo.ecommerceapp.utility.Utility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.Objects;

@Controller
public class RegistrationController {
    @Autowired
    UserRepository userRepository;

//    @Bean
//    PasswordEncoder getPasswordEncoder() {
//        return new BCryptPasswordEncoder();
//    }
//
//    @Autowired
//    PasswordEncoder passwordEncoder;

    @GetMapping("/registration")
    public String registration(){
        return "registration";
    }

    @PostMapping("/registration")
    public ModelAndView postRegistration(RegistrationDTO registrationDTO){
        ModelAndView modelAndView = new ModelAndView("registration");
        try {
            registrationDTO.setRole(Role.CUSTOMER);
            validateRegistrationDTO(registrationDTO);
            User user = registrationDTO.toUser();
//            user.setPassword(passwordEncoder.encode(user.getPassword()));
            userRepository.save(user);
            return new ModelAndView("login")
                    .addObject("successMsg", "Registration Successful!");
        }
        catch(IllegalArgumentException ex) {
            modelAndView.addObject("error_msg", ex.getMessage());
        }
        return modelAndView;
    }

    private void validateRegistrationDTO(RegistrationDTO registrationDTO) {
        if (Objects.isNull(registrationDTO.getUserName())){
            throw new IllegalArgumentException("Username can't be null!");
        }
        if (Objects.nonNull(registrationDTO.getUserName()) && registrationDTO.getUserName().isBlank()){
            throw new IllegalArgumentException("Username can't be blank!");
        }
        if (!Utility.isValidEmail(registrationDTO.getEmail())){
            throw new IllegalArgumentException("Invalid email address!");
        }
        if (Objects.isNull(registrationDTO.getRole())){
            throw new IllegalArgumentException("Your role can't be empty!");
        }
        if (Objects.isNull(registrationDTO.getPassword1())){
            throw new IllegalArgumentException("Password can't be null!");
        }
        if (Objects.nonNull(registrationDTO.getPassword1()) && !registrationDTO.getPassword1().equals(registrationDTO.getPassword2())){
            throw new IllegalArgumentException("Password and Re-type password doesn't match!");
        }
        if (Objects.isNull(registrationDTO.getBank())){
            throw new IllegalArgumentException("Bank name can not be empty!");
        }
        if (Objects.isNull(registrationDTO.getBankAccNo())){
            throw new IllegalArgumentException("Bank account number can not be empty!");
        }
        if (Objects.isNull(registrationDTO.getPhoneNo())){
            throw new IllegalArgumentException("Phone number can not be empty!");
        }
    }
}
