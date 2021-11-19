package com.sololobo.ecommerceapp.repository;

import com.sololobo.ecommerceapp.domain.Supplier;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SupplierRepository extends JpaRepository<Supplier, Long> {
}
