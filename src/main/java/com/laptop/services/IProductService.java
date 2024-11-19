package com.laptop.services;

import java.util.List;

import com.laptop.model.Product;

public interface IProductService {

    public List<Product> getAllProduct();

    public List<Product> getProductByName(String stringName);

    // them san pham
    public void addProduct(Product product);

    // cap nhat san pham
    public Product updateProduct(Long productId);

    // xua san pham
    public void deleteProduct(Long productId);

    // quan ly so luong hang ton kho
    public void manageInventory(Long productId, int quantity);

}
