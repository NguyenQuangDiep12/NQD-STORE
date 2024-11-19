package com.laptop.model;

import java.math.BigDecimal;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.DecimalMin;

@Entity
@Table(name = "cart")
public class Cart {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@DecimalMin(value = "0.0", inclusive = true, message = "Sum must be high or equal than 0")
	private BigDecimal sum;

	@OneToMany(mappedBy = "cart", cascade = CascadeType.ALL)
	private List<Product> products;

	@OneToMany(mappedBy = "cart", cascade = CascadeType.ALL)
	private List<CartDetail> cartDetails;

	@OneToOne(mappedBy = "cart", cascade = CascadeType.ALL)
	private Order order;
}
