package com.sololobo.ecommerceapp.domain;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "order")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    User user;

    @OneToMany(mappedBy = "order", cascade = CascadeType.PERSIST)
    private Set<OrderProduct> orderProducts = new HashSet<>();

    String shippingAdd;
    String shippingPhoneNo;
    //totalprice(product quantity) + shipping charge = payable

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Set<OrderProduct> getOrderProducts() {
        return orderProducts;
    }

    public void setOrderProducts(Set<OrderProduct> orderProducts) {
        this.orderProducts = orderProducts;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getShippingAdd() {
        return shippingAdd;
    }

    public void setShippingAdd(String shippingAdd) {
        this.shippingAdd = shippingAdd;
    }

    public String getShippingPhoneNo() {
        return shippingPhoneNo;
    }

    public void setShippingPhoneNo(String shippingPhoneNo) {
        this.shippingPhoneNo = shippingPhoneNo;
    }


}
