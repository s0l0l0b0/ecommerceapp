package com.sololobo.ecommerceapp.domain;

public class Order {
    Long id;
    Long customerId;
    Long customerProductId;
    String shippingAdd;
    String shippingPhoneNo;
    Double totalPrice;
    Double shippingCharge;
    Double payable;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }

    public Long getCustomerProductId() {
        return customerProductId;
    }

    public void setCustomerProductId(Long customerProductId) {
        this.customerProductId = customerProductId;
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

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Double getShippingCharge() {
        return shippingCharge;
    }

    public void setShippingCharge(Double shippingCharge) {
        this.shippingCharge = shippingCharge;
    }

    public Double getPayable() {
        return payable;
    }

    public void setPayable(Double payable) {
        this.payable = payable;
    }
}
