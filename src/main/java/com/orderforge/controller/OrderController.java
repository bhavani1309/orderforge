package com.orderforge.controller;

import com.orderforge.dto.CreateOrderRequest;
import com.orderforge.entity.Order;
import com.orderforge.service.OrderService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/orders")
public class OrderController {

    private final OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @PostMapping
    public Long createOrder(@RequestBody CreateOrderRequest request) {
        return orderService.createOrder(request);
    }

    @GetMapping
    public List<Order> getOrders() {
        long start = System.currentTimeMillis();

        List<Order> orders = orderService.getAllOrders();

        long end = System.currentTimeMillis();
        System.out.println("GET /orders took " + (end - start) + " ms");

        return orders;
}

}
