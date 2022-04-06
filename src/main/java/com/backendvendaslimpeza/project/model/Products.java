package com.backendvendaslimpeza.project.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Setter
@Getter
@Entity(name = "products")
public class Products {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false, name = "id_product")
    private Integer id;

    @Column(nullable = false, name = "product_name")
    private String name;

    @Column(nullable = false)
    private float value;
}
