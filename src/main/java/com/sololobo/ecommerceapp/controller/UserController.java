package com.sololobo.ecommerceapp.controller;

import com.sololobo.ecommerceapp.domain.User;
import com.sololobo.ecommerceapp.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


@RestController
public class UserController {
    @Autowired
    UserRepository userRepository;

    @GetMapping("/users")
    public List<User> getUser(){
        return userRepository.findAll();
    }

    @PostMapping
    public void postUser(@RequestBody User user){
        //System.out.println(user);
        userRepository.save(user);
    }


}
