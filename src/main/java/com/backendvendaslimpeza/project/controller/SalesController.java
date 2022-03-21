package com.backendvendaslimpeza.project.controller;

import com.backendvendaslimpeza.project.model.Sales;
import com.backendvendaslimpeza.project.repository.SalesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class SalesController {

    @Autowired
    private SalesRepository saleRepository;

    @GetMapping(path = "/api/sales")
    public List<Sales> getAllSales() {
        return (List<Sales>) saleRepository.findAll();
    }

    @GetMapping(path = "/api/sales/{id}")
    public ResponseEntity getSaleById(@PathVariable("id") Integer id) {
        return saleRepository.findById(id)
            .map(record -> ResponseEntity.ok().body(record))
            .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping(path = "/api/sales")
    public Sales insertSale(@RequestBody Sales sale) {
        return saleRepository.save(sale);
    }

//    @PutMapping(path = "/api/sales/{id}")
//    public Sales updateSale(@RequestBody Sales newSale, @PathVariable("id") Integer id) {
//        return saleRepository.findById(id)
//            .map(sale -> {
//                sale.setValue(newSale.getValue());
//                sale.setStatus(newSale.getStatus());
//                sale.setSaleDatetime(newSale.getSaleDatetime());
//                return saleRepository.save(sale);
//            })
//            .orElseGet(() -> {
//                newSale.setId(id);
//                return saleRepository.save(sale);
//            });
//    }

    @DeleteMapping(path = "/api/sales/{id}")
    public ResponseEntity deleteSale(@PathVariable("id") Integer id) {
        saleRepository.deleteById(id);
        return ResponseEntity.noContent().build();
    }

}
