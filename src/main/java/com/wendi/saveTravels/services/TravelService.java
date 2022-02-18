package com.wendi.saveTravels.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wendi.saveTravels.models.Travel;
import com.wendi.saveTravels.repositories.TravelRepository;

@Service
public class TravelService {
	
	@Autowired
	private TravelRepository travelRepo;
	
	//FindAll
	public List<Travel> allTravel(){
		return travelRepo.findAll();
	}
	
	//create
	public Travel createTravel(Travel travel) {
		return travelRepo.save(travel);
	}
	
	//ShowOne 
	public Travel findTravel(Long id) {
		Optional<Travel> optionalTravel = travelRepo.findById(id);
		if(optionalTravel.isPresent()) {
			return  optionalTravel.get();
		}else {
			return null;
		}
	}
	
	
	//update----findOne + create
	
	public Travel updateTravel(Travel travel) {
		return travelRepo.save(travel);
	}
	
	
	//deleteOne
	
	public void deleteTravel(Long id) {
		travelRepo.deleteById(id);
	}
	
	
	
	
	
	
	

}
