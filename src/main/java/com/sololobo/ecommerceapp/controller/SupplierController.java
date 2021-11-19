package com.sololobo.ecommerceapp.controller;

import com.sololobo.ecommerceapp.domain.Supplier;
import com.sololobo.ecommerceapp.domain.User;
import com.sololobo.ecommerceapp.repository.SupplierRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class SupplierController {
    @Autowired
    SupplierRepository supplierRepository;

    @PostMapping("/suppliers")
    public void postSupplier(@RequestBody Supplier supplier){
        //System.out.println(user);
        supplierRepository.save(supplier);
    }

    @GetMapping("/suppliers")
    public List<Supplier> getSuppliers(){
        return supplierRepository.findAll();
    }
}
