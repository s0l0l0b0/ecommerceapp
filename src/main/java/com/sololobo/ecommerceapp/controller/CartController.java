package com.sololobo.ecommerceapp.controller;

import com.sololobo.ecommerceapp.domain.redis.Cart;
import com.sololobo.ecommerceapp.repository.ProductRepository;
import com.sololobo.ecommerceapp.repository.redis.CartRepository;
import com.sololobo.ecommerceapp.utility.Utility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashSet;
import java.util.Map;
import java.util.Optional;

@Controller
public class CartController {
    @Autowired
    CartRepository cartRepository;
    @Autowired
    ProductRepository productRepository;

    @ResponseBody
    @PostMapping("/add-to-cart")
    public void addToCart(@RequestParam Long productId){
        String userEmail = Utility.getLoggedInUserEmail();
        Optional<Cart> byId = cartRepository.findById(userEmail);
        Cart cart = new Cart(userEmail);
        if(byId.isPresent()) {
            cart = byId.get();
        }
        Map<Long, Integer> cartProducts = cart.getCartProducts();
        if (!cartProducts.containsKey(productId)) {
             cartProducts.put(productId, 1);
        }

        cartRepository.save(cart);
    }

    @GetMapping("/cart")
    public ModelAndView cart(){
        String userEmail = Utility.getLoggedInUserEmail();
        Optional<Cart> byId = cartRepository.findById(userEmail);
        if(byId.isEmpty()){
            throw new IllegalArgumentException("cart not found");
        }
        return new ModelAndView("cart")
                .addObject("products", productRepository.getByIds(new HashSet<>(byId.get().getCartProducts().keySet())))
                .addObject("cartProducts", byId.get().getCartProducts());

    }
}
