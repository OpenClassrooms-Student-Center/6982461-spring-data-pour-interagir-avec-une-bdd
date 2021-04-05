package com.openclassrooms.datalayer;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.openclassrooms.datalayer.model.Category;
import com.openclassrooms.datalayer.model.Comment;
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
		Optional<Product> optProduct = productService.getProductById(1);
		Product productId1 = optProduct.get();
 
		System.out.println(productId1.getName());	
 
		productId1.getCategories().forEach(
				category -> System.out.println(category.getName()));
		
		productId1.getComments().forEach(
				comment -> System.out.println(comment.getContent()));	
		
		Optional<Category> optCategory = categoryService.getCategoryById(1);
		Category categoryId1 = optCategory.get();
		
		System.out.println(categoryId1.getName());	
 
		categoryId1.getProducts().forEach(
				product -> System.out.println(product.getName()));
		
		Optional<Comment> optComment = commentService.getCommentById(1);
		Comment commentId1 = optComment.get();
		
		System.out.println(commentId1.getContent());
		System.out.println(commentId1.getProduct().getName());

	}

}
