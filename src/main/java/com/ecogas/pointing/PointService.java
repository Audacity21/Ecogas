package com.ecogas.pointing;

import java.util.List;

public interface PointService {
	
	public String addLocation(Point p);
	public List<Point> getAll();
	public Point getuserlctn(String username);

}
