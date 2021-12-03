package com.sololobo.ecommerceapp.repository;

import com.sololobo.ecommerceapp.domain.Order;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderRepository extends JpaRepository<Order, Long> {
}
