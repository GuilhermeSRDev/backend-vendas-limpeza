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
    @Column(name = "id_sale")
    private String id;
    @Column(name = "sale_datetime")
    private Date saleDatetime;
    @Column
    private char status;
    @Column(name = "total_value")
    private double value;
    @OneToMany(mappedBy = "sales", cascade = CascadeType.ALL)
    private List<SalesItem> items;
}
