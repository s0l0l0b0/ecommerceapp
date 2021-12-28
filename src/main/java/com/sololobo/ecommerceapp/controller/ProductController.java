package com.sololobo.ecommerceapp.controller;

import com.sololobo.ecommerceapp.domain.Product;
import com.sololobo.ecommerceapp.domain.enumeration.ProductCategory;
import com.sololobo.ecommerceapp.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Optional;

@Controller
public class ProductController {

    @Autowired
    ProductRepository productRepository;

    @GetMapping("/car")
    public ModelAndView returnCar(){
         return new ModelAndView("car")
                 .addObject("carList", productRepository.getByProductCategory(ProductCategory.CAR));
    }

    @GetMapping("/bike")
    public ModelAndView returnBike(){
        return new ModelAndView("bike")
                .addObject("bikeList", productRepository.getByProductCategory(ProductCategory.BIKE));
    }

    @GetMapping("/bicycle")
    public ModelAndView returnBicycle(){
        return new ModelAndView("bicycle")
                .addObject("bicycleList", productRepository.getByProductCategory(ProductCategory.BICYCLE));
    }

    @GetMapping("/addNewProduct")
    public ModelAndView newProduct(){
        ProductCategory[] productCategories = ProductCategory.values();
        return new ModelAndView("addNewProduct")
                .addObject("typeOfProducts", productCategories);
    }

    @PostMapping(value= "/addNewProduct")
    public ModelAndView postNewProduct(Product product){
        productRepository.save(product);
        return new ModelAndView("redirect:/admin");
    }

    @GetMapping("/editProduct")
    public ModelAndView editBook(@RequestParam Long id) {
        Optional<Product> optionalProduct = productRepository.findById(id);
        ModelAndView modelAndView = new ModelAndView("addNewProduct");
        optionalProduct.ifPresent(product -> modelAndView.addObject("product", product));
        return modelAndView
                .addObject("typeOfProducts", ProductCategory.values());
    }
}
