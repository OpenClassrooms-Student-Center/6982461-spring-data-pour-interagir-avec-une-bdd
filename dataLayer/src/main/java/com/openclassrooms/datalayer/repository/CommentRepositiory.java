package com.openclassrooms.datalayer.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.openclassrooms.datalayer.model.Comment;

@Repository
public interface CommentRepositiory extends CrudRepository<Comment, Integer> {
	
	
}
