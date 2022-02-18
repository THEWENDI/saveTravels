package com.wendi.saveTravels.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.wendi.saveTravels.models.Travel;
import com.wendi.saveTravels.services.TravelService;

@Controller
public class HomeController {
	
	@Autowired
	private TravelService travelService;
	
	@GetMapping("/showone")
	public String showAllTravel(Model model) {
		List<Travel> travels = travelService.allTravel();
		model.addAttribute("travels", travels);
		return "index.jsp";
	}
	
	@GetMapping("/expenses/{id}")
	public String showOneTravel(@PathVariable("id")Long id, Model model) {
		Travel travel = travelService.findTravel(id);
		model.addAttribute("travel", travel);
		return "showOne.jsp";
	}
	
	//Create
	@GetMapping("/expenses/new")
	public String createForm(@ModelAttribute("travel")Travel travel) {
		return "createform.jsp";
	}
	
	// PROCESS THE CREATE FORM (POST)
	@PostMapping("/expenses/new")
	public String processCreate(@Valid @ModelAttribute("travel")Travel travel, BindingResult result) {
		if(result.hasErrors()) {
			return "createform.jsp";
		}else {
			travelService.createTravel(travel);
			return "redirect:/expenses/new";			
		}		
	}
	// ******************* DASHBOARD WITH CREATE FORM *********************
	@GetMapping("/expenses")
	public String dashboard(Model model,@ModelAttribute("travel")Travel travel) {
		List<Travel> travels = travelService.allTravel();
		model.addAttribute("travels", travels);
		return "index.jsp";
	}
	
	@PostMapping("/expenses")
	public String processdashboardCreate(@Valid @ModelAttribute("travel")Travel travel, BindingResult result,Model model) {
		if(result.hasErrors()) {
			model.addAttribute("travels",travelService.allTravel());
			return "index.jsp";
		}else {
			travelService.createTravel(travel);
			return "redirect:/expenses";			
		}		
	}
	// ******************* EDIT *********************
	// findOne + create
	@GetMapping("/expenses/edit/{id}")
	public String editForm(@PathVariable("id")Long id, Model model) {
		Travel travel = travelService.findTravel(id);
		model.addAttribute("travel", travel);
		return "editform.jsp";
	}
	
	@PutMapping("/expenses/edit/{id}")
	public String processEdit(@Valid @ModelAttribute("travel")Travel travel, BindingResult result) {
		if(result.hasErrors()) {
			return "editform.jsp";
		}else{
			travelService.updateTravel(travel);
			return "redirect:/expenses";
		}
	}
	
	// ******************* DELETE *********************
	@DeleteMapping("/expenses/delete/{id}")
	public String deleteIcecream(@PathVariable("id")Long id) {
		travelService.deleteTravel(id);
		return "redirect:/expenses";
	}
	
	
	
}
