package com.orderforge.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.orderforge.entity.User;

public interface UserRepository extends JpaRepository<User, Long> {
}
