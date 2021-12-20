package com.sololobo.ecommerceapp.domain.redis;

import org.springframework.data.redis.core.RedisHash;

import java.util.LinkedHashMap;
import java.util.Map;

@RedisHash("cart")
public class Cart {
    String id;
    Map<Long, Integer> cartProducts = new LinkedHashMap<>();

    public Cart(String id) {
        this.id = id;
    }

    public Cart(){}

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Map<Long, Integer> getCartProducts() {
        return cartProducts;
    }

    public void setCartProducts(Map<Long, Integer> cartProducts) {
        this.cartProducts = cartProducts;
    }
}
