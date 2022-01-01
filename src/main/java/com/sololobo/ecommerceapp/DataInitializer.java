package com.sololobo.ecommerceapp;

import com.sololobo.ecommerceapp.domain.Product;
import com.sololobo.ecommerceapp.domain.Supplier;
import com.sololobo.ecommerceapp.domain.User;
import com.sololobo.ecommerceapp.domain.enumeration.ProductCategory;
import com.sololobo.ecommerceapp.domain.enumeration.Role;
import com.sololobo.ecommerceapp.repository.ProductRepository;
import com.sololobo.ecommerceapp.repository.SupplierRepository;
import com.sololobo.ecommerceapp.repository.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.Set;

import static com.sololobo.ecommerceapp.domain.enumeration.ProductCategory.BIKE;
import static com.sololobo.ecommerceapp.domain.enumeration.ProductCategory.CAR;

@Service
public class DataInitializer {

    private static final Logger LOGGER = LoggerFactory.getLogger(DataInitializer.class);

    @Autowired
    UserRepository userRepository;
    @Autowired
    ProductRepository productRepository;
    @Autowired
    SupplierRepository supplierRepository;
    @Autowired
    PasswordEncoder passwordEncoder;

    //@Bean
    ApplicationRunner runner() {
        return args -> {
            LOGGER.info("Initializing Data");

            User adminUser = new User();
            adminUser.setBankAccNo("234234234234");
            adminUser.setBankName("AbBank");
            adminUser.setEmail("admin@test.com");
            adminUser.setPassword(passwordEncoder.encode("1234"));
            adminUser.setIsActive(true);
            adminUser.setPhoneNo("23424234234");
            adminUser.setUserName("admin");
            adminUser.setRole(Role.ADMIN);

            User customer = new User();
            customer.setBankAccNo("4234234234");
            customer.setBankName("AbBank");
            customer.setEmail("customer@test.com");
            customer.setPassword(passwordEncoder.encode("1234"));
            customer.setIsActive(true);
            customer.setPhoneNo("24234234");
            customer.setUserName("customer");
            customer.setRole(Role.CUSTOMER);

            userRepository.save(adminUser);
            userRepository.save(customer);


            final Supplier kawasaki = new Supplier("Kawasaki");
            final Supplier audi = new Supplier("Audio");
            final Supplier buggati = new Supplier("Buggati");
            supplierRepository.save(kawasaki);
            supplierRepository.save(audi);
            supplierRepository.save(buggati);

            Product product = getProduct(BIKE, "Kawasaki Ninja 750J", "The fastest bike on earth!",
                    154000D, Collections.singleton(kawasaki));
            product.setImgUrl("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-Mc_DLyQWmM9qCjk2nw-vCLmv5MwhSldR8w&usqp=CAU");
            Product product1 = getProduct(CAR, "Audio R8", "The HyperCar For Human!",
                    235840D, Collections.singleton(audi));
            product1.setImgUrl("https://imgd.aeplcdn.com/664x374/cw/ec/21724/Audi-R8-Right-Front-Three-Quarter-66713.jpg?v=201711021421&q=85");
            Product product2 = getProduct(CAR, "Bugatti Veyron Supersport", "The fastest car on earth!",
                    350000000D, Collections.singleton(buggati));
            product2.setImgUrl("https://www.bugatti.com/fileadmin/_processed_/sei/p63/se-image-ce40627babaa7b180bc3dedd4354d61c.jpg");
            productRepository.save(product);
            productRepository.save(product1);
            productRepository.save(product2);

            LOGGER.info("Initialization Done");
        };
    }

    private Product getProduct(ProductCategory category, String name, String details, Double price, Set<Supplier> suppliers) {
        Product product = new Product();
        product.setName(name);
        product.setDetail(details);
        product.setProductCategory(category);
        product.setPrice(price);
        product.setRate(1L);
        product.setSuppliers(suppliers);
        return product;
    }
}
