package com.ecogas.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ecogas.owner.OwnerService;
import com.ecogas.owner.PlantOwner;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService us;
	
	@Autowired
	private OwnerService os;
	
	@RequestMapping("/home")
	public String home() {
		return "index";
	}
	
	@RequestMapping("/register")
	public String register() {
		return "register";
	}
	
	@RequestMapping("/about")
	public String about() {
		return "about";
	}
	
	@RequestMapping("/dashboard")
	public String userDash(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String u= (String)session.getAttribute("user");
		if(u==null || u.substring(0, 3).equalsIgnoreCase("PO-")) {
			return "redirect:/user/login";
		}
		return "userdashboard";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping( path = "RegisterUser", method = RequestMethod.POST )
	public String registerUser(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String username = req.getParameter("username");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String add = req.getParameter("add");
		String pass = req.getParameter("pass");
		String repass = req.getParameter("repass");
		String mobile = req.getParameter("mobile");
		String type = req.getParameter("usertype");
		String ra = "";
		if(type.equalsIgnoreCase("user")) {
			User u = new User();
			u.setAdd(add);
			u.setEmail(email);
			u.setMobile(mobile);
			u.setUsername(username);
			u.setPassword(pass);
			if(!pass.equals(repass)) {
				ra +="password mismatch";
			}
			ra+= us.addUser(u);
			session.setAttribute("ra", ra);
			if(ra.equalsIgnoreCase("Registered")) {
				ra+=" username:- "+username;
			}		
			
		}
		else if(type.equalsIgnoreCase("owner")) {
			PlantOwner p = new PlantOwner();
			p.setAdd(add);
			p.setEmail(email);
			p.setName(name);
			p.setMobile(mobile);
			p.setUsername("PO-"+username);
			p.setPassword(pass);
			if(!pass.equals(repass)) {
				ra +="password mismatch";
			}
			ra+= os.addOwner(p);
			if(ra.equalsIgnoreCase("Registered")) {
				ra+=" username:- "+"PO-"+username;
			}	
		}
		session.setAttribute("ra", ra);
		return "redirect:/user/register";
		
	}
	
	@RequestMapping( path = "LoginUser", method = RequestMethod.POST )
	public String loginUser(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String username = req.getParameter("username");
		String pass = req.getParameter("pass");
		String la = "";
		if(!username.substring(0, 3).equalsIgnoreCase("PO-")) {
			la+=us.login(username, pass);
			if(la.equals(username)) {
				session.setAttribute("user", username);
				return "redirect:/user/dashboard";
				
			}
			else {
				session.setAttribute("la", la);
				return "redirect:/user/login";
			}
		}
		else if(username.substring(0, 3).equalsIgnoreCase("PO-")) {
			la+=os.login(username, pass);
			if(la.equals(username)) {
				session.setAttribute("user", username);
				return "redirect:/owner/update";
				
			}
			else {
				session.setAttribute("la", la);
				return "redirect:/user/login";
			}
		}
		return "redirect:/user/login";
	}//login user
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		return "redirect:/";
	}

}
