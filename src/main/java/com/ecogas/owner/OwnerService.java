package com.ecogas.owner;

public interface OwnerService {
	
	public String addOwner(PlantOwner p);
	public String login(String username, String password);
	public PlantOwner getOwnerByid(String username);
	public String update(PlantOwner p);
	public boolean verifyEmail(String email);
	public boolean verifyMobile(String mobile);

}
