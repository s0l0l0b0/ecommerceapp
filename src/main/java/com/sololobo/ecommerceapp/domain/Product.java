package com.sololobo.ecommerceapp.domain;

import com.sololobo.ecommerceapp.domain.enumeration.Brand;
import com.sololobo.ecommerceapp.domain.enumeration.ProductCategory;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "product")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    @Column(name = "img_url")
    private String imgUrl;
    private Double price;
    @Enumerated(value = EnumType.STRING)
    @Column(name = "product_category")
    private ProductCategory productCategory;

    private String detail;

    @Enumerated(value = EnumType.STRING)
    private Brand brand;

    private Long rate;



    //created many-to-many relation with supplier table
    @ManyToMany
    @JoinTable(name = "product_supplier",
    joinColumns = {@JoinColumn(name = "product_id")},
    inverseJoinColumns = {@JoinColumn(name = "supplier_id")})
    private Set<Supplier> suppliers = new HashSet<>();

    public Set<Supplier> getSuppliers() {
        return suppliers;
    }

    public void setSuppliers(Set<Supplier> suppliers) {
        this.suppliers = suppliers;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public ProductCategory getProductCategory() {
        return productCategory;
    }

    public void setProductCategory(ProductCategory productCategory) {
        this.productCategory = productCategory;
    }


    public String getDetail() {return detail;}

    public void setDetail(String detail) {this.detail = detail;}

    public Brand getBrand() {return brand;}

    public void setBrand(Brand brand) {this.brand = brand;}

    public Long getRate() {return rate;}

    public void setRate(Long rate) {this.rate = rate;}


    //utility method to add a supplier
    public void addSupplier(Supplier supplier){
        this.suppliers.add(supplier);
        supplier.getProducts().add(this);
    }

    //utility method to remove a supplier
    public void removeSupplier(Supplier supplier){
        this.suppliers.remove(supplier);
        supplier.getProducts().remove(this);
    }
}
