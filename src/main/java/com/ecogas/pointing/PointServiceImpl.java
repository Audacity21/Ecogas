package com.ecogas.pointing;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PointServiceImpl implements PointService{
	
	@Autowired
	private PointRepo pr;

	@Override
	public String addLocation(Point p) {
		pr.save(p);
		return "save";
	}

	@Override
	public List<Point> getAll() {
		List<Point> points  = pr.findAll();
		List<Point> l = new ArrayList<>();
		for(Point point : points) {
			if(point.getUsername().substring(0, 3).equals("PO-")) {
				l.add(point);
			}
		}
		return l;
	}

	@Override
	public Point getuserlctn(String username) {
	return pr.findById(username).get();
	}

}
