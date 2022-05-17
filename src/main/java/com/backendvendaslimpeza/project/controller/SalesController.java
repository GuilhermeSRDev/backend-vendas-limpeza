package com.backendvendaslimpeza.project.controller;

import com.backendvendaslimpeza.project.model.*;
import com.backendvendaslimpeza.project.repository.ProductsRepository;
import com.backendvendaslimpeza.project.repository.SalesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.concurrent.atomic.AtomicBoolean;

@CrossOrigin
@RestController
public class SalesController {
    @Autowired
    private SalesRepository saleRepository;

    @Autowired
    private ProductsRepository productRepository;
    @GetMapping(path = "/api/sales")
    public ResponseEntity getAllSales() {
        return ResponseEntity.ok().body(saleRepository.findAll());
    }
    @GetMapping(path = "/api/sales/{id}")
    public ResponseEntity getSaleById(@PathVariable("id") Integer id) {
        return saleRepository.findById(id).map(
                record -> ResponseEntity.ok().body(record)
                )
            .orElse(ResponseEntity.notFound().build());
    }
    @PostMapping(path = "/api/sales")
    public ResponseEntity insertSale(@RequestBody SalesBody saleBody) {

        double totalValue = saleBody.getItems().stream().mapToDouble(item -> item.value * item.qtd).sum();
        Date now = new Date();

        Sales sale = new Sales();
        sale.setId(UUID.randomUUID().toString());
        sale.setSaleDatetime(now);
        sale.setStatus('1');
        sale.setValue(totalValue);

        List<SalesItem> salesitems = new ArrayList<SalesItem>();
        saleBody.getItems().forEach(item->{
            Products product = productRepository.findById(item.id).orElse(new Products());
            SalesItem saleitem = new SalesItem();
            saleitem.setAmount(item.value * item.qtd);
            saleitem.setProduct(product);
            saleitem.setSales(sale);
            saleitem.setQuantity(item.qtd);
            salesitems.add(saleitem);
        });

        sale.setItems(salesitems);

        saleRepository.save(sale);

        return ResponseEntity.ok().build();
    }
    @DeleteMapping(path = "/api/sales/{id}")
    public ResponseEntity deleteSale(@PathVariable("id") String id) {
        List<Sales> allSales = (List<Sales>) saleRepository.findAll();
        AtomicBoolean found = new AtomicBoolean(false);
        allSales.forEach(item -> {
            if (item.getId().equals(id)) {
                found.set(true);
                saleRepository.delete(item);
            }
        });

        if (!found.get()) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok().build();
        }
    }
}
