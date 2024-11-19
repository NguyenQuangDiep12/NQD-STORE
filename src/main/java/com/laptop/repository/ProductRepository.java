package com.laptop.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.laptop.model.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

    public Optional<Product> findProductById(Long id);

    @Query("SELECT p FROM Product p WHERE p.name LIKE CONCAT('%', :stringName, '%')")
    public Optional<List<Product>> findProductByNameLikeString(@Param("stringName") String stringName);// jpql

    @Modifying // yeu cau spring data jpa xu ly truy van nay nhu mot cap nhat/ xoa
    @Transactional // dam bao tinh nhat quan khi xoa du lieu
    @Query("DELETE FROM Product p WHERE p.id = :productId") // jpql
    public void deleteProductById(@Param("productId") Long productId);
    // xoa nhieu phan tu cung mot luc

}
