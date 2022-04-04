package com.backendvendaslimpeza.project.controller;

import com.backendvendaslimpeza.project.model.Sales;
import com.backendvendaslimpeza.project.repository.SalesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
public class SalesController {

    @Autowired
    private SalesRepository saleRepository;

    @GetMapping(path = "/api/sales")
    public ResponseEntity getAllSales() {
        return ResponseEntity.ok().body(saleRepository.findAll());
    }

    @GetMapping(path = "/api/sales/{id}")
    public ResponseEntity getSaleById(@PathVariable("id") Integer id) {
        return saleRepository.findById(id)
            .map(record -> ResponseEntity.ok().body(record))
            .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping(path = "/api/sales")
    public ResponseEntity insertSale(@RequestBody Sales sale) {
        saleRepository.save(sale);
        return ResponseEntity.ok().build();
    }

    @DeleteMapping(path = "/api/sales/{id}")
    public ResponseEntity deleteSale(@PathVariable("id") Integer id) {
        saleRepository.deleteById(id);
        return ResponseEntity.ok().build();
    }

}
