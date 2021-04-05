package com.openclassrooms.datalayer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.openclassrooms.datalayer.model.Category;
import com.openclassrooms.datalayer.model.Comment;
import com.openclassrooms.datalayer.model.Product;
import com.openclassrooms.datalayer.repository.CategoryRepository;
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
	public void run(String... args) throws Exception {
		Iterable<Product> products = productService.getProducts();
		products.forEach(product -> System.out.println(product.getName()));
		
		Iterable<Category> categories = categoryService.getCategories();
		categories.forEach(category -> System.out.println(category.getName()));
		
		Iterable<Comment> comments = commentService.getComments();
		comments.forEach(comment -> System.out.println(comment.getContent()));
	}

}
