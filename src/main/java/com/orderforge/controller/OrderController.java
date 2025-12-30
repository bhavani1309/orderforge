package com.orderforge.controller;

import com.orderforge.dto.CreateOrderRequest;
import com.orderforge.service.OrderService;
import org.springframework.web.bind.annotation.*;

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
}
