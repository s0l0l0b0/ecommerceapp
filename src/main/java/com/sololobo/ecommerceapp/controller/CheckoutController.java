package com.sololobo.ecommerceapp.controller;

import com.sololobo.ecommerceapp.domain.Order;
import com.sololobo.ecommerceapp.domain.User;
import com.sololobo.ecommerceapp.domain.redis.Cart;
import com.sololobo.ecommerceapp.repository.OrderRepository;
import com.sololobo.ecommerceapp.repository.ProductRepository;
import com.sololobo.ecommerceapp.repository.UserRepository;
import com.sololobo.ecommerceapp.repository.redis.CartRepository;
import com.sololobo.ecommerceapp.utility.Utility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashSet;
import java.util.Optional;

@Controller
public class CheckoutController {

    @Autowired
    CartRepository cartRepository;
    @Autowired
    ProductRepository productRepository;
    @Autowired
    UserRepository userRepository;
    @Autowired
    OrderRepository orderRepository;



    @GetMapping("/single-checkout")
    public ModelAndView singleCheckout(){
        return new ModelAndView("single-checkout");
    }


    @GetMapping("/checkout")
    public ModelAndView cart(){
        String userEmail = Utility.getLoggedInUserEmail();
        Optional<Cart> byId = cartRepository.findById(userEmail);
        Optional<User> userByEmail = userRepository.getUserByEmail(userEmail);
        if (userByEmail.isEmpty()){
            throw new IllegalArgumentException("cart not found");
        }
        if(byId.isEmpty()){
            throw new IllegalArgumentException("cart not found");
        }
        return new ModelAndView("checkout")
                .addObject("products", productRepository.getByIds(new HashSet<>(byId.get().getCartProducts().keySet())))
                .addObject("cartProducts", byId.get().getCartProducts())
                .addObject("user", userByEmail.get());
    }


    @PostMapping(value= "/shippingAddress")
    public ModelAndView postNewBook(Order order){
        orderRepository.save(order);
        return new ModelAndView("redirect:/admin");
    }
}
