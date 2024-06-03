package com.example.Movie;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;




@Controller
public class Rest {
	
	@Autowired
	public dbrepo dbr;
	
	
	
	@GetMapping("/")
	public String demo() {
		return "registermovie";
	}
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@GetMapping("/index")
	public String index() {
		return "index";
	}
	
	@GetMapping("/favorite")
	public String favorite() {
		return "favorite";
	}
	
	@GetMapping("/movie")
	public String movie() {
		return "movie";
	}

	
	@GetMapping("/save")
	public String save(@ModelAttribute("reg") Register r) {
		dbr.save(r);	
		return "login";
	}
	
	@PostMapping("/login")
    public String authenticate(@RequestParam String email, @RequestParam String password, Model model) {
        Register user = dbr.findByEmailAndPassword(email, password);
        if (user != null) {
        	return "redirect:/index";
        } else {
            model.addAttribute("error", "Invalid credentials");
            return "login";
        }
    }
	
	
	

}
