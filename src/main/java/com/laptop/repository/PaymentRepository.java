package com.laptop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.laptop.model.Payment;

@Repository
public interface PaymentRepository extends JpaRepository<Payment, Long> {

}
