package com.backendvendaslimpeza.project.repository;

import com.backendvendaslimpeza.project.model.Sales;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SalesRepository extends CrudRepository<Sales, Integer> {

}
