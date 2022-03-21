package com.backendvendaslimpeza.project.model;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Data
@Entity(name = "sales")
public class Sales {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false)
    private Date saleDatetime;

    @Column(nullable = false)
    private char status;

    @Column(nullable = false)
    private float value;

}
