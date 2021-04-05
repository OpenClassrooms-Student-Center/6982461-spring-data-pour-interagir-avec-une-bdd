package com.openclassrooms.datalayer.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.openclassrooms.datalayer.model.Product;
import com.openclassrooms.datalayer.repository.ProductRepository;

@Service
public class ProductService {
	
	@Autowired
	private ProductRepository productRepository;
	
	public Iterable<Product> getProducts() {
		return productRepository.findAll();
	}

}
