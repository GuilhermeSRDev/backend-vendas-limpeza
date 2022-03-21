package com.backendvendaslimpeza.project.model;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Data
@Entity(name = "products")
public class Products {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private float value;

}
