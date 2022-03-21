package com.backendvendaslimpeza.project.controller;

import com.backendvendaslimpeza.project.model.Products;
import com.backendvendaslimpeza.project.repository.ProductsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class ProductsController {

    @Autowired
    private ProductsRepository productRepository;

    @GetMapping(path = "/api/products")
    public ResponseEntity<List<Products>> getAllSales() {
        return new ResponseEntity<List<Products>>((List<Products>) productRepository.findAll(), HttpStatus.OK);
    }

    @GetMapping(path = "/api/products/{id}")
    public ResponseEntity getSaleById(@PathVariable("id") Integer id) {
        return productRepository.findById(id)
                .map(record -> ResponseEntity.ok().body(record))
                .orElse(ResponseEntity.notFound().build());
    }

}
