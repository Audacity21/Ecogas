package com.ecogas.Plant;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PlantServiceImpl implements PlantService{
	
	@Autowired
	private PlantRepo pr;

	@Override
	public String addPlant(PlantDetails pd) {
		int plantId = randomNumber();
		while(pr.existsById(plantId)) {
			plantId = randomNumber();
		}
		pd.setPlantId(plantId);
		pr.save(pd);
		return "Plant added with plant id: "+Integer.toString(plantId);
		
	}
	
	public int randomNumber() {
		int max = 9999;
		int min = 111;
		return  (int)(Math.random()*(max-min+1)+min);  
	}

	@Override
	public boolean verifyPlantAdded(String username) {
		List<PlantDetails> details = pr.findAll();
		for(PlantDetails p : details) {
			if(p.getUsername().equalsIgnoreCase(username)) {
				return true;
			}
		}
		return false;
	}

	@Override
	public PlantDetails plantdetails(String username) {
		List<PlantDetails> l = pr.findAll();
		for(PlantDetails p : l) {
			if(p.getUsername().equals(username)) {
				return p;
			}
		}
		return null;
	}

	@Override
	public boolean verifyMobile(String mobile) {
		List<PlantDetails> pd = pr.findAll();
		for(PlantDetails p : pd) {
			if(p.getMobile().equalsIgnoreCase(mobile)) {
				return true;
			}
		}
		return false;
	}

	@Override
	public String updatePlant(PlantDetails pd) {
		if(pr.existsById(pd.getPlantId())) {
			pr.save(pd);
			return "Details updated";
		}
		return "Invalid user";
	}

	

	@Override
	public List<PlantDetails> getAllPlant() {
		return pr.findAll();
	}

	@Override
	public PlantDetails getbyId(int plantId) {
		if(pr.existsById(plantId)) {
			return pr.findById(plantId).get();
		}
		return null;
	}

}
