package com.laptop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.laptop.model.Customer;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Long> {

}
