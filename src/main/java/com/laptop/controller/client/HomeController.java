package com.laptop.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping({ "/", "/home" })
	public String home(Model model) {
		model.addAttribute("Welcome", "It's Mee");
		return "index";
	}

	@GetMapping({ "/product-details" })
	public String showAllProduct() {
		return "product-details";
	}

	@GetMapping({ "/contact" })
	public String showContact() {
		return "contact";
	}

	@GetMapping({ "/shop" })
	public String takeShop() {
		return "shop";
	}
}
