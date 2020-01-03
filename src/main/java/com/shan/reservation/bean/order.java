package com.shan.reservation.bean;

import java.util.Date;

public class order {
    private String orderId;

    private Integer orderUser;

    private Integer orderRestaurant;

    private Integer orderPrice;

    private Date orderTime;

    private String orderFood;

    private Integer orderState;

    public order(String orderId, Integer orderUser, Integer orderRestaurant, Integer orderPrice, Date orderTime, String orderFood, Integer orderState) {
        this.orderId = orderId;
        this.orderUser = orderUser;
        this.orderRestaurant = orderRestaurant;
        this.orderPrice = orderPrice;
        this.orderTime = orderTime;
        this.orderFood = orderFood;
        this.orderState = orderState;
    }

    public order() {
        super();
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId == null ? null : orderId.trim();
    }

    public Integer getOrderUser() {
        return orderUser;
    }

    public void setOrderUser(Integer orderUser) {
        this.orderUser = orderUser;
    }

    public Integer getOrderRestaurant() {
        return orderRestaurant;
    }

    public void setOrderRestaurant(Integer orderRestaurant) {
        this.orderRestaurant = orderRestaurant;
    }

    public Integer getOrderPrice() {
        return orderPrice;
    }

    public void setOrderPrice(Integer orderPrice) {
        this.orderPrice = orderPrice;
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    public String getOrderFood() {
        return orderFood;
    }

    public void setOrderFood(String orderFood) {
        this.orderFood = orderFood == null ? null : orderFood.trim();
    }

    public Integer getOrderState() {
        return orderState;
    }

    public void setOrderState(Integer orderState) {
        this.orderState = orderState;
    }
}