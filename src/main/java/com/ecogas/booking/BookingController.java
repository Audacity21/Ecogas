package com.ecogas.booking;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ecogas.Plant.PlantDetails;
import com.ecogas.Plant.PlantService;
import com.ecogas.user.User;
import com.ecogas.user.UserService;

@Controller
@RequestMapping("/booking")
public class BookingController{
	
    @Autowired
    private BookingService bs;
    
    @Autowired 
    private PlantService ps;
    
    @Autowired
    private UserService us;
    
    

    @RequestMapping("/order")
    public String order(HttpServletRequest req) {
    	HttpSession session = req.getSession();
		String user = (String) session.getAttribute("user");
		if(user==null || user.substring(0, 3).equalsIgnoreCase("PO-")) {
			return "redirect:/user/login";
		}
        return "bookingOrder";
    }

    @RequestMapping(path = "/confirm")
    public String confirm(HttpServletRequest req){
    	HttpSession session = req.getSession();
		String user = (String) session.getAttribute("user");
		if(user==null || user.substring(0, 3).equalsIgnoreCase("PO-")) {
			return "redirect:/user/login";
		}
        return "bookingConfirm";
    }
    
    
    @RequestMapping(path = "/{id}/{type}", method = RequestMethod.GET)
    public String booking(HttpServletRequest req, @PathVariable int id, @PathVariable String type) {
    	HttpSession session = req.getSession();
		String user = (String) session.getAttribute("user");
		if(user==null || user.substring(0, 3).equalsIgnoreCase("PO-")) {
			return "redirect:/user/login";
		}
    	PlantDetails p = ps.getbyId(id);
    	PlantDetails pd = new PlantDetails();
    	pd.setPlantId(p.getPlantId());
    	pd.setName(p.getName());
    	pd.setUsername(p.getUsername());
    	pd.setPlantId(p.getPlantId());
    	pd.setMobile(p.getMobile());
    	
    	Booking b = new Booking();
    	if(type.equalsIgnoreCase("requirement")) {
    		b.setType("Plant-Requirement");
    		b.setAmount(2);
    		pd.setRequire(p.getRequire());
    	}
		if(type.equalsIgnoreCase("gas")) {
			b.setType("Gas-cylinder");
    		b.setAmount(500);
    		pd.setGasAvail(p.getGasAvail());		
		  }
		
		if(type.equalsIgnoreCase("fertilizer")) {
			b.setType("Fertilizers");
    		b.setAmount(3);
    		pd.setFertAvail(p.getFertAvail());
		}
		session.setAttribute("bookingP", pd);
		session.setAttribute("bookingB", b);
    	return "bookingOrder";
    }//booking information
    
    
    
    @RequestMapping(path = "/confirm/{type}", method = RequestMethod.POST)
    public String bookingConfirm(HttpServletRequest req, @PathVariable String type) {
    	HttpSession session = req.getSession();
		String user = (String) session.getAttribute("user");
		if(user==null || user.substring(0, 3).equalsIgnoreCase("PO-") || session.getAttribute("bookingP")==null) {
			return "redirect:/user/login";
		}
		PlantDetails pd = (PlantDetails)session.getAttribute("bookingP");
    	Booking b = (Booking)session.getAttribute("bookingB");
		int price = 0;
    	int quant = Integer.parseInt(req.getParameter("quant"));
    	if(type.equalsIgnoreCase("Plant-Requirement")) {
    		price = quant*2;
    		b.setStatus("We  will collect as early as possible");
    		b.setBuyer(pd.getUsername());
    		b.setSeller(user);
    	}
    	if(type.equalsIgnoreCase("Gas-cylinder")) {
    		price = quant*500;
    		b.setStatus("Expected delivery 3-5 days");
    		b.setBuyer(user);
    		b.setSeller(pd.getUsername());
    	}
    	if(type.equalsIgnoreCase("Fertilizers")) {
    		price = quant*3;
    		b.setStatus("Expected delivery 3-5 days");
    		b.setBuyer(user);
    		b.setSeller(pd.getUsername());
    	}
    	
    	b.setAmount(price);
    	b.setPlantId(pd.getPlantId());
    	b.setQuantity(quant);
    	
    	User u = us.userdetails(user);
    	session.setAttribute("confU", u);
    	session.setAttribute("confB", b);
    	return "redirect:/booking/bookingconfirmation";
    }
    
    @RequestMapping("/bookingconfirmation")
    public String bookcnf(HttpServletRequest req) {
    	HttpSession session = req.getSession();
		String user = (String) session.getAttribute("user");
		if(user==null || user.substring(0, 3).equalsIgnoreCase("PO-")) {
			return "redirect:/user/login";
		}
		if(session.getAttribute("confU")==null) {
			return "redirect:/map";
		}
		return "bookingConfirm";
    }
    
    @RequestMapping("/confirmation")
    public String confirmbook(HttpServletRequest req) {
    	HttpSession session = req.getSession();
		String user = (String) session.getAttribute("user");
		if(user==null || user.substring(0, 3).equalsIgnoreCase("PO-")) {
			return "redirect:/user/login";
		}
	if(session.getAttribute("confU")==null || session.getAttribute("confB")==null) {
			return "redirect:/map";
		}
		 PlantDetails pd = (PlantDetails)session.getAttribute("bookingP");
		 Booking b = (Booking)session.getAttribute("confB");
	 int id = bs.book(b);
		 PlantDetails p = ps.getbyId(pd.getPlantId());
		 String type = b.getType();
		 int q = b.getQuantity();
		 if(type.equalsIgnoreCase("Plant-Requirement")) {
   		p.setRequire(p.getRequire()-q);
    	}
	    	if(type.equalsIgnoreCase("Gas-cylinder")) {
	    		p.setGasAvail(p.getGasAvail()-q);
	    	}
	    	if(type.equalsIgnoreCase("Fertilizers")) {
	    		p.setFertAvail(p.getFertAvail()-q);
	    	}
	    String a = ps.updatePlant(p);
		 session.setAttribute("bid", id);
		 session.setAttribute("confU", null);
	     session.setAttribute("confB", null);
	     session.setAttribute("plantId", null);
	    	
		 return "confirm";
		 
    }//order booking completed
    
    
    @RequestMapping("/usertxn")
    public String usertxn(HttpServletRequest req) {
    	HttpSession session = req.getSession();
		String user = (String) session.getAttribute("user");
		if(user==null || user.substring(0, 3).equalsIgnoreCase("PO-")) {
			return "redirect:/user/login";
		}
		
		List<Booking> b = bs.userBooking(user);
		session.setAttribute("usertxnl", b);
		return "usertxnlist";
    	
    }
    
    @RequestMapping(path = "/user/{id}", method = RequestMethod.GET)
    public String userviewlist(HttpServletRequest req, @PathVariable int id) {
    	HttpSession session = req.getSession();
		String user = (String) session.getAttribute("user");
		if(user==null || user.substring(0, 3).equalsIgnoreCase("PO-")) {
			return "redirect:/user/login";
		}
		Booking b = bs.getbyid(id);
		PlantDetails pd = ps.getbyId(b.getPlantId());
		session.setAttribute("listub", b);
		session.setAttribute("listupd", pd);
		return "viewusertxn";
    	
    }
    
    @RequestMapping("/transaction")
    public String ownertxn(HttpServletRequest req) {
    	HttpSession session = req.getSession();
		String user = (String) session.getAttribute("user");
		if(user==null || !user.substring(0, 3).equalsIgnoreCase("PO-")) {
			return "redirect:/user/login";
		}
		List<Booking> b = bs.userBooking(user);
		session.setAttribute("listob", b);
		return "ownertxnlist";
    }
    
    
    @RequestMapping(path = "/owner/{id}", method = RequestMethod.GET)
    public String ownerviewlist(HttpServletRequest req, @PathVariable int id) {
    	HttpSession session = req.getSession();
		String user = (String) session.getAttribute("user");
		if(user==null || !user.substring(0, 3).equalsIgnoreCase("PO-")) {
			return "redirect:/user/login";
		}
		Booking b = bs.getbyid(id);
		String u = "";
		if(!b.getSeller().substring(0, 3).equalsIgnoreCase("PO-")) {
			u +=b.getSeller();
		}
		else {
			u+=b.getBuyer();
		}
		User use = us.userdetails(u);
		session.setAttribute("ob", b);
		session.setAttribute("ou", use);
		return "viewownertxn";
    	
    }
    
    
    
}