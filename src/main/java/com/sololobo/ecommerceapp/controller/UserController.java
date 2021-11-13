package com.sololobo.ecommerceapp.controller;

import com.sololobo.ecommerceapp.domain.User;
import com.sololobo.ecommerceapp.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;



@RestController
public class UserController {


    @Autowired
    UserRepository userRepository;
}
