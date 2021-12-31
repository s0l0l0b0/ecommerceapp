package com.sololobo.ecommerceapp.controller;

import com.sololobo.ecommerceapp.domain.redis.Cart;
import com.sololobo.ecommerceapp.repository.ProductRepository;
import com.sololobo.ecommerceapp.repository.redis.CartRepository;
import com.sololobo.ecommerceapp.utility.Utility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

@Controller
public class CartController {
    @Autowired
    CartRepository cartRepository;
    @Autowired
    ProductRepository productRepository;


    //to add a item to the cart
    @ResponseBody
    @PostMapping("/add-to-cart")
    public void addToCart(@RequestParam Long productId, @CookieValue(value = "gci", required = false) String guestCartId,
                          HttpServletResponse httpServletResponse){

        String userEmail = Utility.getLoggedInUserEmail();

        if(Objects.isNull(userEmail)){
            if (Objects.isNull(guestCartId)){
                Random random = new Random();
                String randomUser = String.valueOf(random.nextInt());
                Cookie cookie = new Cookie("gci",randomUser);
                cookie.setPath("/");
                httpServletResponse.addCookie(cookie);
                Cart cart = new Cart(randomUser);
                cart.getCartProducts().put(productId, 1);
                cartRepository.save(cart);
            } else {
                Optional<Cart> byId = cartRepository.findById(guestCartId);
                Cart cart = byId.get();
                Map<Long, Integer> cartProducts = cart.getCartProducts();
                if (!cartProducts.containsKey(productId)) {
                    cartProducts.put(productId, 1);
                }
                cartRepository.save(cart);
            }
        }else {
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


    }

    //to display all the items in the cart
    @GetMapping("/cart")
    public ModelAndView cart(@CookieValue(value = "gci", required = false) String guestCartId){
        String userEmail = Utility.getLoggedInUserEmail();
        Optional<Cart> optionalCart;
        if(Objects.isNull(userEmail)){
            if (Objects.isNull((guestCartId))){
                return new ModelAndView("redirect:/");
            }
             optionalCart = cartRepository.findById(guestCartId);
        }else {
            optionalCart = cartRepository.findById(userEmail);
        }
        if(optionalCart.isEmpty()){
            throw new IllegalArgumentException("cart not found");
        }
        return new ModelAndView("cart")
                .addObject("products", productRepository.getByIds(new HashSet<>(optionalCart.get().getCartProducts().keySet())))
                .addObject("cartProducts", optionalCart.get().getCartProducts());
    }


    //to increase the quantity of an item in the cart
    @ResponseBody
    @PostMapping("/quantityIncrement")
    public void quantityIncrements(@RequestParam Long productId) {
        Cart cart = getCart();

        Map<Long, Integer> cartProducts = cart.getCartProducts();
        if (cartProducts.containsKey(productId)) {
            Integer previousQuantity = cartProducts.get(productId);
            cartProducts.put(productId, previousQuantity + 1);
            cartRepository.save(cart);
        }
    }


    //to decrease the quantity of an item in the cart
    @ResponseBody
    @PostMapping("/quantityDecrement")
    public void quantifyDecrements(@RequestParam Long productId) {
        Cart cart = getCart();

        Map<Long, Integer> cartProducts = cart.getCartProducts();
        if (cartProducts.containsKey(productId)) {
            Integer previousQuantity = cartProducts.get(productId);
            if (previousQuantity > 1) {
                cartProducts.put(productId, previousQuantity - 1);
                cartRepository.save(cart);
            }else{
                throw new IllegalArgumentException("error occurred!");
            }
        }
    }


    //to delete an item from the cart
    @ResponseBody
    @PostMapping("deleteOne")
    public void deleteOne(@RequestParam Long productId){
        Cart cart = getCart();

        Map<Long, Integer> cartProducts = cart.getCartProducts();
        if(cartProducts.containsKey(productId)){
            cartProducts.remove(productId);
            cartRepository.save(cart);
        }
        else {
            throw new IllegalArgumentException("Error Occurred!");
        }
    }



    private Cart getCart() {
        String userEmail = Utility.getLoggedInUserEmail();
        Optional<Cart> byId = cartRepository.findById(userEmail);

        Cart cart = null;
        if (byId.isPresent()) {
            cart = byId.get();
        }
        return cart;
    }

}
