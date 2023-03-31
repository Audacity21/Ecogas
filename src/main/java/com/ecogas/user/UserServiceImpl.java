package com.ecogas.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserRepo ur;

	@Override
	public String addUser(User u) {
		String s ="";
		
		if(u.getUsername().length()<=3) {
			s+="too small username";
			return s;
		}
		
		if(ur.existsById(u.getUsername()) || u.getUsername().substring(0, 3).equalsIgnoreCase("PO-")) {
			s+="Username already taken";
			return s;
		}
		
		List<User> users = ur.findAll();
		for(User user : users) {
			if(user.getEmail().equalsIgnoreCase(u.getEmail())) {
				s+="Email already regsitered";
				return s;
			}
			if(user.getMobile().equalsIgnoreCase(u.getMobile())) {
				s+="Mobile no. already registered";
				return s;
			}
		}
		
		ur.save(u);
		s+="Registered";
		return s;
		
	}

	@Override
	public String login(String username, String password) {
		String s ="";
		if(!ur.existsById(username)) {
			s+="Invalid username/password";
			return s;
		}
		List<User> user = ur.findAll();
		for(User u : user) {
			if(u.getUsername().equals(username) && u.getPassword().equals(password)) {
				return username;
			}
		}
		s+="Invalid username/password";
		return s;
	}

	@Override
	public User userdetails(String username) {
		return ur.findById(username).get();
	}

}
