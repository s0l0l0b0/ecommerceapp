package com.sololobo.ecommerceapp.controller;

import com.sololobo.ecommerceapp.domain.Product;
import com.sololobo.ecommerceapp.domain.Supplier;
import com.sololobo.ecommerceapp.repository.ProductRepository;
import com.sololobo.ecommerceapp.repository.SupplierRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class ProductController {
    @Autowired
    ProductRepository productRepository;

    @PostMapping("/products")
    public void postProductr(@RequestBody Product product){
        //System.out.println(user);
        productRepository.save(product);
    }

    @GetMapping("/products")
    public void getProducts(){
        //return productRepository.findAll();
        List<Product> productList = productRepository.findAll();
        for(int i = 0; i < productList.size(); i++){
            System.out.println(productList.get(i));
        }

    }
}
