package com.sololobo.ecommerceapp.model;

import com.sololobo.ecommerceapp.domain.User;
import com.sololobo.ecommerceapp.domain.enumeration.Role;

public class RegistrationDTO {
    String userName;
    String email;
    Role role;
    String password1;
    //    comfirm password is password2
    String password2;

    String bank;
    String bankAccNo;
    String phoneNo;

    public String getBank() {
        return bank;
    }

    public void setBank(String bank) {
        this.bank = bank;
    }

    public String getBankAccNo() {
        return bankAccNo;
    }

    public void setBankAccNo(String bankAccNo) {
        this.bankAccNo = bankAccNo;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public String getPassword1() {
        return password1;
    }

    public void setPassword1(String password1) {
        this.password1 = password1;
    }

    public String getPassword2() {
        return password2;
    }

    public void setPassword2(String password2) {
        this.password2 = password2;
    }

    public User toUser() {
        User user = new User();
        user.setEmail(this.getEmail());
        user.setUserName(this.getUserName());
        user.setRole(this.getRole());
        user.setIsActive(true);
        user.setPassword(this.getPassword1());
        user.setBankName(this.getBank());
        user.setBankAccNo(this.getBankAccNo());
        user.setPhoneNo(this.getPhoneNo());
        return user;
    }

    @Override
    public String toString() {
        return "RegistrationDTO{" +
                "userName='" + userName + '\'' +
                ", email='" + email + '\'' +
                ", role=" + role +
                ", password1='" + password1 + '\'' +
                ", password2='" + password2 + '\'' +
                '}';
    }
}
