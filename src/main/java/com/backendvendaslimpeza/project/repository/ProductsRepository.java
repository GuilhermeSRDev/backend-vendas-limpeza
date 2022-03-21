package com.backendvendaslimpeza.project.repository;

import com.backendvendaslimpeza.project.model.Products;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductsRepository extends CrudRepository<Products, Integer> {

}
