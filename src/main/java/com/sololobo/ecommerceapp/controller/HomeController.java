package com.sololobo.ecommerceapp.controller;

import com.sololobo.ecommerceapp.domain.Product;
import com.sololobo.ecommerceapp.domain.enumeration.ProductCategory;
import com.sololobo.ecommerceapp.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class HomeController {
    @Autowired
    ProductRepository productRepository;

    @GetMapping()
    public ModelAndView homePage(){
        List<Product> productList = productRepository.findAll();

        return new ModelAndView("homeBase")
                .addObject("productList", productList)
                .addObject("productCategory", ProductCategory.values());
    }
}
