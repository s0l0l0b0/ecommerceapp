package com.sololobo.ecommerceapp.domain.redis;

import org.springframework.data.redis.core.RedisHash;

import java.util.LinkedHashSet;
import java.util.Set;

@RedisHash("cart")
public class Cart {
    String id;
    Set<Long> productIds = new LinkedHashSet<>();

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

    public Set<Long> getProductIds() {
        return productIds;
    }

    public void setProductIds(Set<Long> productIds) {
        this.productIds = productIds;
    }
}
