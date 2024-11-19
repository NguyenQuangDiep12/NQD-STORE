package com.laptop.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.laptop.exception.ResourceNotFoundException;
import com.laptop.model.Product;
import com.laptop.repository.ProductRepository;
import com.laptop.services.IProductService;

@Service
public class ProductService implements IProductService {

    private ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    @Override
    public void addProduct(Product product) {
        productRepository.save(product);
    }

    @Override
    public Product updateProduct(Long productId) {
        // neu co Id product roi ms cap nhat con khong tao moi
        Product product = this.productRepository.findProductById(productId)
                .orElseThrow(() -> new ResourceNotFoundException("Product Not Found"));
        return product;
    }

    @Override
    public void deleteProduct(Long productId) {
        if (this.productRepository.findProductById(productId).isPresent()) {
            this.productRepository.deleteProductById(productId);
        } else {
            throw new ResourceNotFoundException("Product Not Found");
        }
    }

    @Override
    public void manageInventory(Long productId, int quantity) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'manageInventory'");
    }

    @Override
    public List<Product> getAllProduct() {
        return this.productRepository.findAll();
    }

    @Override
    public List<Product> getProductByName(String stringName) {

        if (stringName == null || stringName.trim().isEmpty()) {
            // neu chuoi tim kiem rong, tra ve danh sach rong
            return new ArrayList<>();
        }

        Optional<List<Product>> products = productRepository.findProductByNameLikeString(stringName);

        if (products.isPresent()) {
            // tra ve danh sach san pham neu tim thay
            return products.get();
        }

        // tra ve danh sach rong neu khong tim thay
        return new ArrayList<>();
    }

}
