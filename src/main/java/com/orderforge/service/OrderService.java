package com.orderforge.service;

import com.orderforge.entity.*;
import com.orderforge.repository.*;
import com.orderforge.dto.CreateOrderRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;

@Service
public class OrderService {

    private final OrderRepository orderRepository;
    private final UserRepository userRepository;
    private final OrderItemRepository orderItemRepository;

    public OrderService(OrderRepository orderRepository,
                        UserRepository userRepository,
                        OrderItemRepository orderItemRepository) {
        this.orderRepository = orderRepository;
        this.userRepository = userRepository;
        this.orderItemRepository = orderItemRepository;
    }

    @Transactional
    public Long createOrder(CreateOrderRequest request) {

        User user = userRepository.findById(request.userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        Order order = new Order();
        order.setUser(user);
        order.setStatus("CREATED");

        BigDecimal total = BigDecimal.ZERO;

        for (CreateOrderRequest.OrderItem i : request.items) {
            total = total.add(i.price.multiply(BigDecimal.valueOf(i.quantity)));
        }

        order.setTotalAmount(total);
        order = orderRepository.save(order);

        for (CreateOrderRequest.OrderItem i : request.items) {

         //   if ("Book".equals(i.productName)) {
           //     throw new RuntimeException("Simulated failure during order creation");
            //}

            OrderItem oi = new OrderItem();
            oi.setOrder(order);
            oi.setProductName(i.productName);
            oi.setQuantity(i.quantity);
            oi.setPrice(i.price);
            orderItemRepository.save(oi);
        }

        return order.getId();
    }
}
