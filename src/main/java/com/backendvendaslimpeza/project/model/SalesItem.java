package com.backendvendaslimpeza.project.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Setter;
import lombok.Getter;

import javax.persistence.*;

@Setter
@Getter
@Entity(name = "salesitems")
public class SalesItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_sales_items")
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="id_sale")
    @JsonIgnore
    private Sales sales;

    @OneToOne
    @JoinColumn(name="id_product")
    private Products product;

    @Column
    private Integer quantity;

    @Column
    private double amount;
}
