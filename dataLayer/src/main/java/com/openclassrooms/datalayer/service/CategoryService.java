package com.openclassrooms.datalayer.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.openclassrooms.datalayer.model.Category;
import com.openclassrooms.datalayer.repository.CategoryRepository;

@Service
public class CategoryService {

	@Autowired
	private CategoryRepository categoryRepository;
	
	public Iterable<Category> getCategories() {
		return categoryRepository.findAll();
	}
	
	public Optional<Category> getCategoryById(Integer id) {
		return categoryRepository.findById(id);
	}

}
