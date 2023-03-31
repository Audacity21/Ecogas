package com.ecogas.Plant;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/plant")
public class PlantController {
	@Autowired
	private PlantService ps;
	
	@RequestMapping("/addPlant")
	public String addPlant(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String user = (String)session.getAttribute("user");
		if(user==null || !user.substring(0, 3).equalsIgnoreCase("PO-")) {
			return "redirect:/user/login";
		}
		else if(ps.verifyPlantAdded(user)) {
			session.setAttribute("plantUp", "Plant Added");
			return "redirect:/plant/update";
		}
		else return "addplant";
	}
	
	@RequestMapping(path = "/AddPlant", method = RequestMethod.POST)
	public String addPlantForm(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String user = (String)session.getAttribute("user");
		if(user==null || !user.substring(0, 3).equalsIgnoreCase("PO-")) {
			return "redirect:/user/login";
		}
		String name = req.getParameter("name");
		String add = req.getParameter("add");
		String mobile = req.getParameter("mobile");
		int fert = Integer.parseInt(req.getParameter("fert"));
		int gas = Integer.parseInt(req.getParameter("gas"));
		int require = Integer.parseInt(req.getParameter("require"));
		PlantDetails pd = new PlantDetails();
		pd.setFertAvail(fert);
		pd.setGasAvail(gas);
		pd.setLocation(add);
		pd.setMobile(mobile);
		pd.setName(name);
		pd.setRequire(require);
		pd.setUsername(user);
		String ack = ps.addPlant(pd);
		session.setAttribute("plantA", ack);
		return "redirect:/plant/addPlant";
	}
	
	@RequestMapping("/update")
	public String updatePlant(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String user = (String)session.getAttribute("user");
		if(user==null || !user.substring(0, 3).equalsIgnoreCase("PO-")) {
			return "redirect:/user/login";
		}
		PlantDetails  p = ps.plantdetails(user);
		session.setAttribute("plantd", p);
		return "updateplant";
		
	}
	
	@RequestMapping("/location")
	public String lctnupdate(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String user = (String) session.getAttribute("user");
		if(user==null || !user.substring(0, 3).equalsIgnoreCase("PO-")) {
			return "redirect:/user/login";
		}
		return "plantLocation";
	}//location updation
	
	
	@RequestMapping(path = "/UpdatePlant", method = RequestMethod.POST)
	public String updatePlantDetails(HttpServletRequest req) {
		String ack ="";
		int i=0;
		HttpSession session = req.getSession();
		String user = (String)session.getAttribute("user");
		if(user==null || !user.substring(0, 3).equalsIgnoreCase("PO-")) {
			return "redirect:/user/login";
		}
		PlantDetails pd = ps.plantdetails(user);
		if(req.getParameter("add").length()>0) {
			i=1;
			pd.setLocation(req.getParameter("add"));
		}
		if(req.getParameter("mobile").length()>0) {
			i=1;
			if(ps.verifyMobile(req.getParameter("mobile"))) {
				ack+= "Mobile number already registered";
				session.setAttribute("plantUp", ack);
				return "redirect:/plant/update";
			}
			else {
				pd.setMobile(req.getParameter("mobile"));
			}
		}
		if(req.getParameter("fert").length()>0) {
			i=1;
			pd.setFertAvail(Integer.parseInt(req.getParameter("fert")));
		}
		if(req.getParameter("gas").length()>0) {
			i=1;
			pd.setGasAvail(Integer.parseInt(req.getParameter("gas")));
		}
		if(req.getParameter("require").length()>0) {
			i=1;
			pd.setRequire(Integer.parseInt(req.getParameter("require")));
		}
		if(i==0) {
			ack+="Update atleast one field";
			session.setAttribute("plantUp", ack);
			return "redirect:/plant/update";
		}
		ack+=ps.updatePlant(pd);
		session.setAttribute("plantUp", ack);
		return "redirect:/plant/update";
		
	}//update plant
	
	@RequestMapping(path= "/{plantId}", method = RequestMethod.GET)
	public String plantDetails(HttpServletRequest req, @PathVariable int plantId) {
		HttpSession session = req.getSession();
		String user = (String)session.getAttribute("user");
		if(user==null || user.substring(0, 3).equalsIgnoreCase("PO-")) {
			return "redirect:/user/login";
		}
		
		PlantDetails pd = ps.getbyId(plantId);
		session.setAttribute("plantId", pd);
		return "points";
		
	}
	

}
