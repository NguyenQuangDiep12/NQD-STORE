package com.laptop.model;

import java.math.BigDecimal;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.Min;

@Entity
@Table(name = "cart_detail")
public class CartDetail {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@DecimalMin(value = "0.0", inclusive = true, message = "Price must be greater or equal than 0")
	private BigDecimal price;

	@Min(value = 0, message = "quantity must be greater or equal than 0")
	private int quantity;

	@ManyToOne
	@JoinColumn(name = "cart_id")
	private Cart cart;

	@OneToMany(mappedBy = "cartDetail", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Product> products;
}
