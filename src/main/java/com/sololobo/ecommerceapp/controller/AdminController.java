package com.sololobo.ecommerceapp.controller;

import com.sololobo.ecommerceapp.domain.Product;
import com.sololobo.ecommerceapp.domain.User;
import com.sololobo.ecommerceapp.repository.ProductRepository;
import com.sololobo.ecommerceapp.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class AdminController {
    @Autowired
    UserRepository userRepository;
    @Autowired
    ProductRepository productRepository;

    @GetMapping("/admin")
    public ModelAndView adminHomePage(){
        List<User> allUser = userRepository.findAll();
        List<Product> allProduct = productRepository.findAll();

        return new ModelAndView("admin")
                .addObject("user", allUser)
                .addObject("product", allProduct);
    }
}
