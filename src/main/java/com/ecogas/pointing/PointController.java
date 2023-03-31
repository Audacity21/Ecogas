package com.ecogas.pointing;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.maps.errors.ApiException;

@Controller
public class PointController {
	
	  @Autowired
	  private GoogleMapsService gms;
	  
	  @Autowired
	  private PointService ps;
	  
	  @RequestMapping("/location")
	  public String fetchLctn(HttpServletRequest req) {
		  HttpSession session = req.getSession();
			String user = (String) session.getAttribute("user");
			if(user==null) {
				return "redirect:/user/login";
			}
		  return "lctnFetch";
	  }
	
	
	@PostMapping("/coordinates")
    public void receiveLocation(@RequestBody Map<String, String> coordinates, HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req.getSession();
		if(session.getAttribute("user")==null) {
			return ;
			
		}
		if(coordinates.get("lat").length()==0) {
			session.setAttribute("add", "Your location not fetched!!");
		}
        double lat = Double.parseDouble(coordinates.get("lat"));
        double lng = Double.parseDouble(coordinates.get("lng"));
        session.setAttribute("lat", lat);
        session.setAttribute("lng", lng);
        String add = gms.getAddress(lat, lng);
        session.setAttribute("add",add );
        return ;
    }
	
	@RequestMapping("/updatelocation")
	public String updateLocation(HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession();
		if(session.getAttribute("user")==null) {
			return "redirect:/user/login";
		}
		String user = (String) session.getAttribute("user");
		if(session.getAttribute("lat")==null) {
			session.setAttribute("war", "Location not fetched");
			return "redirect:/plant/location";
		}
		double lat = (double) session.getAttribute("lat");
		double lng = (double) session.getAttribute("lng");
		String add = gms.getAddress(lat, lng);
		session.setAttribute("add", add);
		 if(user.substring(0, 3).equalsIgnoreCase("PO-")) {
		       Point p = new Point();
		       String username = (String) session.getAttribute("user");
		       p.setLat(lat);
		       p.setLng(lng);
		       p.setUsername(username);
		       p.setAddress(add);
		       ps.addLocation(p);
		       session.setAttribute("war", "Location updated");
	        }
		 return "redirect:/plant/location";
		
		
	}
 
 

	@GetMapping("/map")
	public String mapping(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String user = (String) session.getAttribute("user");
		if(user==null) {
			return "redirect:/user/login";
		}
		
		if(session.getAttribute("lat")==null) {
			session.setAttribute("add", "Your location not fetched");
			return "redirect:/location";
		}
		return "points";
	}
	
	 @GetMapping("/points")
	 @ResponseBody  public List<Point> getpoint(HttpServletRequest req) throws ApiException, InterruptedException, IOException {
		 HttpSession session = req.getSession();
			String user = (String) session.getAttribute("user");
			if(user==null) {
				return null;
			}
	   List<Point> p =  gms.getPoints();
	    return p;
	  }
	 
	 @GetMapping("/mypoints")
	 @ResponseBody  public Point getmylctn(HttpServletRequest req) throws Exception {
		 HttpSession session = req.getSession();
		 String user = (String) session.getAttribute("user");
		if(user==null) {
			return null;
		}
		double lat = (double)session.getAttribute("lat");
        double lng = (double)session.getAttribute("lng");
	   Point p = new Point();
	   p.setLat(lat);
	   p.setLng(lng);
	   p.setUsername(user);
	   p.setAddress(gms.getAddress(lat, lng));
	    return p;
	 }
	 
	 @GetMapping("/myplantpoint")
	 @ResponseBody  public Point getplantLctn(HttpServletRequest req) throws Exception {
		 HttpSession session = req.getSession();
		 String user = (String) session.getAttribute("user");
		if(user==null || !user.substring(0, 3).equalsIgnoreCase("PO-")) {
			return null;
		}
	   Point p = ps.getuserlctn(user);
	   p.setAddress(gms.getAddress(p.getLat(), p.getLng()));
	    return p;
	 }
	 
	 

}
