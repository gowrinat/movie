package com.example.Movie;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface dbrepo extends JpaRepository<Register, Integer>{
	Register findByEmailAndPassword(String email, String password);

}
