package com.openclassrooms.datalayer;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.openclassrooms.datalayer.model.Category;
import com.openclassrooms.datalayer.model.Product;
import com.openclassrooms.datalayer.service.CategoryService;
import com.openclassrooms.datalayer.service.CommentService;
import com.openclassrooms.datalayer.service.ProductService;

@SpringBootApplication
public class DataLayerApplication implements CommandLineRunner {
	
	@Autowired
	private ProductService productService;

	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private CommentService commentService;

	public static void main(String[] args) {
		SpringApplication.run(DataLayerApplication.class, args);
	}

	@Override
	@Transactional
	public void run(String... args) throws Exception {

		categoryService.getCategories().forEach(
				category -> System.out.println(category.getName()));
		
		Category newCategory = new Category();
		newCategory.setName("Promotion");
		
		newCategory = categoryService.addCategory(newCategory);
		
		categoryService.getCategories().forEach(
				category -> System.out.println(category.getName()));
		
		Product newProduct = new Product();
		newProduct.setName("AssuranceTousRisquesFidelite");
		newProduct.setDescription("Les garanties de l'assurance tous risques à un prix moindre grâce à votre fidélité!");
		newProduct.setCost(1100);
		
		newProduct = productService.addProduct(newProduct);
		
		productService.getProducts().forEach(
				product -> System.out.println(product.getName()));
	}

}
