package com.orderforge.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.orderforge.entity.Order;

public interface OrderRepository extends JpaRepository<Order, Long> {
}
