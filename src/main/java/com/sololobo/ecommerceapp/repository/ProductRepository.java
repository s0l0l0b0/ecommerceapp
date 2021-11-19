package com.sololobo.ecommerceapp.repository;

import com.sololobo.ecommerceapp.domain.Product;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepository extends JpaRepository<Product, Long> {
}
