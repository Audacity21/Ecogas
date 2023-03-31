package com.ecogas.user;


public interface UserService {
	public String addUser(User u);
	public String login(String username, String password);
	public User userdetails(String username);

}
