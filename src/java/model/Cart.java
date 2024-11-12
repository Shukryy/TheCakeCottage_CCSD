/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author User
 */
public class Cart {

    private int cartId;
    private double cartTotalAmount;
    private String cartDetail;
    private String cartDateTime;
    private int customerId;

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public double getCartTotalAmount() {
        return cartTotalAmount;
    }

    public void setCartTotalAmount(double cartTotalAmount) {
        this.cartTotalAmount = cartTotalAmount;
    }

    public String getCartDetail() {
        return cartDetail;
    }

    public void setCartDetail(String cartDetail) {
        this.cartDetail = cartDetail;
    }

    public String getCartDateTime() {
        return cartDateTime;
    }

    public void setCartDateTime(String cartDateTime) {
        this.cartDateTime = cartDateTime;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    

}
