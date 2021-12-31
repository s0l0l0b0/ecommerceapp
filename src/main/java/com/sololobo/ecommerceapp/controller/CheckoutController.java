package com.sololobo.ecommerceapp.controller;

import com.sololobo.ecommerceapp.domain.Order;
import com.sololobo.ecommerceapp.domain.OrderProduct;
import com.sololobo.ecommerceapp.domain.Product;
import com.sololobo.ecommerceapp.domain.User;
import com.sololobo.ecommerceapp.domain.redis.Cart;
import com.sololobo.ecommerceapp.repository.OrderProductRepository;
import com.sololobo.ecommerceapp.repository.OrderRepository;
import com.sololobo.ecommerceapp.repository.ProductRepository;
import com.sololobo.ecommerceapp.repository.UserRepository;
import com.sololobo.ecommerceapp.repository.redis.CartRepository;
import com.sololobo.ecommerceapp.utility.Utility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashSet;
import java.util.Map;
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
    @Autowired
    OrderProductRepository orderProductRepository;



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


    @Transactional
    @PostMapping(value= "/checkout")
    public ModelAndView placeOrder(String address){
        String userEmail = Utility.getLoggedInUserEmail();
        Optional<Cart> byId = cartRepository.findById(userEmail);
        Map<Long, Integer> cartProducts = byId.get().getCartProducts();
        Optional<User> user = userRepository.getUserByEmail(userEmail);

        Order order = new Order();
        order.setShippingAdd(address);
        order.setUser(user.get());
        order.setShippingPhoneNo(user.get().getPhoneNo());

        orderRepository.save(order);

        for (Map.Entry<Long, Integer> cartProductEntry : cartProducts.entrySet()) {
            Long productId = cartProductEntry.getKey();
            Integer quantity = cartProductEntry.getValue();

            OrderProduct orderProduct = new OrderProduct();
            orderProduct.setQuantity(quantity);

            Product product = productRepository.getById(productId);
            orderProduct.setProduct(product);
            orderProduct.setOrder(order);

            orderProductRepository.save(orderProduct);
        }


        cartRepository.delete(byId.get());

        return new ModelAndView("redirect:/")
                .addObject("order", order);
    }
}
