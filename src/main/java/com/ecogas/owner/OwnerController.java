package com.ecogas.owner;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ecogas.booking.BookingService;

@Controller
@RequestMapping("/owner")
public class OwnerController {
	
	@Autowired
	private OwnerService os;
	
	@Autowired
	private BookingService bs;
	
	@RequestMapping("/update")
	public String updateOwner(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String user = (String) session.getAttribute("user");
		if(user==null || !user.substring(0, 3).equalsIgnoreCase("PO-")) {
			return "redirect:/user/login";
		}
		PlantOwner p = os.getOwnerByid(user);
		session.setAttribute("ownerD", p);
		return "updateOwner";
	}

	@RequestMapping("/dashboard")
	public String dashboard(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String user = (String) session.getAttribute("user");
		if(user==null || !user.substring(0, 3).equalsIgnoreCase("PO-")) {
			return "redirect:/user/login";
		}
		PlantOwner p = os.getOwnerByid(user);
		session.setAttribute("ownerD", p);
		List<Integer> l = bs.dashdata(user);
		session.setAttribute("ownerdash", l);
		return "ownerDashboard";
	}
	
	@RequestMapping(path = "/updation", method = RequestMethod.POST)
	public String update(HttpServletRequest req) {
		HttpSession session = req.getSession();
		int i = 0;
		String user = (String) session.getAttribute("user");
		String s = "";
		if(user==null || !user.substring(0, 3).equalsIgnoreCase("PO-")) {
			return "redirect:/user/login";
		}
		PlantOwner p = os.getOwnerByid(user);
		
		if(req.getParameter("name").length()>0) {
			i=1;
			p.setName(req.getParameter("name"));
		}
		if(req.getParameter("email").length()>0 ) {
			i=1;
			String email = req.getParameter("email");
			if(!os.verifyEmail(email)) {
				s+="Email already registered";
				session.setAttribute("ackU", s);
				return "redirect:/owner/update";
			}
			else {
			p.setEmail(email);
			}
		}
		if(req.getParameter("address").length()>0) {
			i=1;
			p.setAdd(req.getParameter("address"));
		}
		if(req.getParameter("mobile").length()>0 ) {
			i=1;
			String mobile = req.getParameter("mobile");
			if(!os.verifyMobile(mobile)) {
				s+="Mobile already registered";
				session.setAttribute("ackU", s);
				return "redirect:/owner/update";
			}
			else {
			p.setMobile(mobile);
			}
		}
		if(i==0) {
			s+="Provide any one details to update";
			session.setAttribute("ackU", s);
			return "redirect:/owner/update";
			
		}
		s += os.update(p);
		session.setAttribute("ackU", s);
		return "redirect:/owner/update";
	}//updation
	
	
	
	
}
