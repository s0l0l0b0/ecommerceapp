package com.sololobo.ecommerceapp.repository;

import com.sololobo.ecommerceapp.domain.Product;
import com.sololobo.ecommerceapp.domain.enumeration.ProductCategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
//    @Query("SELECT c from Product c where c.productCategory = :category")
//    List<Product> getAllByCategory(ProductCategory category);

    List<Product> getByProductCategory(ProductCategory category);

}
