package com.ecogas.pointing;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.ecogas.Plant.PlantDetails;
import com.ecogas.Plant.PlantService;
import com.google.maps.GeoApiContext;
import com.google.maps.GeocodingApi;
import com.google.maps.errors.ApiException;
import com.google.maps.model.GeocodingResult;
import com.google.maps.model.LatLng;

@Service
public class GoogleMapsService {

  private GeoApiContext geoApiContext;
  
  @Autowired
  private PointService ps;
  
  @Autowired
  private PlantService pls;
  

  public GoogleMapsService(@Value("${google.maps.api.key}") String apiKey) {
    geoApiContext = new GeoApiContext.Builder().apiKey(apiKey).build();
  }

//  public LatLng getLatLng(String address) throws ApiException, InterruptedException, IOException {
//    GeocodingResult[] results = GeocodingApi.geocode(geoApiContext, address).await();
//    if (results.length > 0) {
//    	LatLng l = results[0].geometry.location;
//    	double s = l.lat;
//    	double e = l.lng;
//    	System.out.println(s+"******"+e);
//      return results[0].geometry.location;
//    } else {
//      return null;
//    }
//  }
  
  
  
  public List<Point> getPoints() throws ApiException, InterruptedException, IOException {
	     List<Point> point = new ArrayList<>();
	     List<PlantDetails> pd = pls.getAllPlant();
	     for (PlantDetails plant : pd) {
	        // GeocodingResult[] results = GeocodingApi.reverseGeocode(geoApiContext, new LatLng(point.getLat(), point.getLng())).await();
	    	 Point p = ps.getuserlctn(plant.getUsername());
	    	 p.setPlantId(plant.getPlantId());
	    	 p.setPlantName(plant.getName());
	    	 point.add(p);
	         }
	     return point;
	 }
  
  public String getAddress(double latitude, double longitude) throws Exception {
      GeocodingResult[] results = GeocodingApi.reverseGeocode(geoApiContext, new com.google.maps.model.LatLng(latitude, longitude)).await();
      if (results.length > 0) {
          return results[0].formattedAddress;
      } else {
          throw new Exception("No address found");
      }
  }

}

