package com.laptop.model;

import java.util.Date;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(name = "orders")
public class Order {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotNull
	private Date orderDate;
	@NotNull
	private double totalAmount;

	private String status;

	@ManyToOne
	@JoinColumn(name = "customers_id") // khoa ngoai customer
	private Customer customer;

	@OneToOne(cascade = CascadeType.PERSIST, orphanRemoval = true) // luu gia tri payment, gia tri du thua xoa
	@JoinColumn(name = "payment_id")
	private Payment payment;

	@OneToMany(mappedBy = "order", cascade = CascadeType.ALL)
	private List<OrderDetail> orderDetails;

	@OneToOne
	@JoinColumn(name = "cart_id", nullable = false)
	private Cart cart;
}
