package com.backendvendaslimpeza.project.model;

import lombok.Setter;
import lombok.Getter;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Setter
@Getter
@Entity(name = "sales")
public class Sales {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false, name = "id_sale")
    private Integer id;

    @Column(nullable = false, name = "sale_datetime")
    private Date saleDatetime;

    @Column(nullable = false)
    private char status;

    @Column(nullable = false, name = "total_value")
    private float value;

    @OneToMany(mappedBy = "sales", cascade = CascadeType.ALL)
    private List<SalesItem> items;
}
