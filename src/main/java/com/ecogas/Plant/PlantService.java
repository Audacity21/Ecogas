package com.ecogas.Plant;

import java.util.List;

public interface PlantService {
	public String addPlant(PlantDetails pd);
	public boolean verifyPlantAdded(String username);
	public PlantDetails plantdetails(String username);
	public boolean verifyMobile(String mobile);
	public String updatePlant(PlantDetails pd);
	public List<PlantDetails> getAllPlant();
	public PlantDetails getbyId(int plantId);

}
