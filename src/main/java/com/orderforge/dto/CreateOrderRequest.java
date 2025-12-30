package com.orderforge.dto;

import java.math.BigDecimal;
import java.util.List;

public class CreateOrderRequest {

    public Long userId;
    public List<OrderItem> items;

    public static class OrderItem {
        public String productName;
        public int quantity;
        public BigDecimal price;
    }
}
