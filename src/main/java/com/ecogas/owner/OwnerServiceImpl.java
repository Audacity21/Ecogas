package com.ecogas.owner;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecogas.user.User;

@Service
public class OwnerServiceImpl implements OwnerService {
	
	@Autowired
	private OwnerRepo or;

	@Override
	public String addOwner(PlantOwner p) {
		String s ="";
		if(p.getUsername().length()<=7) {
			s+="too small username";
			return s;
		}
		
		if(or.existsById(p.getUsername())) {
			s+="Username already taken";
			return s;
		}
		
		List<PlantOwner> users = or.findAll();
		for(PlantOwner user : users) {
			if(user.getEmail().equalsIgnoreCase(p.getEmail())) {
				s+="Email already regsitered";
				return s;
			}
			if(user.getMobile().equalsIgnoreCase(p.getMobile())) {
				s+="Mobile no. already registered";
				return s;
			}
		}
		
		or.save(p);
		s+="Registered";
		return s;
	}

	@Override
	public String login(String username, String password) {
		String s ="";
		if(!or.existsById(username)) {
			s+="Invalid username/password";
			return s;
		}
		List<PlantOwner> po = or.findAll();
		for(PlantOwner o : po) {
			if(o.getUsername().equals(username) && o.getPassword().equals(password)) {
				return username;
			}
		}
		s+="Invalid username/password";
		return s;
	}

	@Override
	public PlantOwner getOwnerByid(String username) {
	if(or.existsById(username)) {
		return or.findById(username).get();
	}
	return null;
	}

	@Override
	public String update(PlantOwner p) {
		or.save(p);
		return "Details updated";
		
		
	}

	@Override
	public boolean verifyEmail(String email) {
		List<PlantOwner> owners = or.findAll();
		for(PlantOwner o : owners) {
			if(o.getEmail().equalsIgnoreCase(email)) {
				return false;
			}
		}
		return true;
	}

	@Override
	public boolean verifyMobile(String mobile) {
		List<PlantOwner> owners = or.findAll();
		for(PlantOwner o : owners) {
			if(o.getMobile().equalsIgnoreCase(mobile)) {
				return false;
			}
		}
		return true;
		
	}
}
