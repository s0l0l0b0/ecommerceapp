package com.sololobo.ecommerceapp.repository.redis;

import com.sololobo.ecommerceapp.domain.redis.Cart;
import org.springframework.data.redis.repository.configuration.EnableRedisRepositories;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
@EnableRedisRepositories
public interface CartRepository extends CrudRepository<Cart, String> {

}
