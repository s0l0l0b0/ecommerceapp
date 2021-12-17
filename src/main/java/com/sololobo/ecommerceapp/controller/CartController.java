package com.sololobo.ecommerceapp.controller;

import com.sololobo.ecommerceapp.domain.redis.Cart;
import com.sololobo.ecommerceapp.repository.redis.CartRepository;
import com.sololobo.ecommerceapp.utility.Utility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Optional;

@RestController
public class CartController {
    @Autowired
    CartRepository cartRepository;

    @PostMapping("/add-to-cart")
    public void addToCart(@RequestParam Long productId){
        String userEmail = Utility.getLoggedInUserEmail();
        Optional<Cart> byId = cartRepository.findById(userEmail);
        Cart cart = new Cart(userEmail);
        if(byId.isPresent()) {
            cart = byId.get();
        }
        cart.getProductIds().add(productId);
        cartRepository.save(cart);
    }

    @GetMapping("add-to-cart")
    public void testCart(){
        String userEmail = "nice@nice.com";
        Optional<Cart> byId = cartRepository.findById(userEmail);
        System.out.println(byId);
    }
}
