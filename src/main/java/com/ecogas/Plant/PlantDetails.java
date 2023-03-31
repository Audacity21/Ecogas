package com.ecogas.Plant;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name ="plantdetails")
public class PlantDetails {
	
	@Id
	@Column(name ="plantid")
	private int plantId;
	@Column(name ="username")
	private String username;
	@Column(name ="name")
	private String name;
	@Column(name ="address")
	private String location;
	@Column(name ="mobile")
	private String mobile;
	@Column(name ="fertavail")
	private int fertAvail;
	@Column(name ="gasavail")
	private int gasAvail;
	@Column(name ="requirement")
	private int require;
	public int getPlantId() {
		return plantId;
	}
	public void setPlantId(int plantId) {
		this.plantId = plantId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public int getFertAvail() {
		return fertAvail;
	}
	public void setFertAvail(int fertAvail) {
		this.fertAvail = fertAvail;
	}
	public int getGasAvail() {
		return gasAvail;
	}
	public void setGasAvail(int gasAvail) {
		this.gasAvail = gasAvail;
	}
	public int getRequire() {
		return require;
	}
	public void setRequire(int require) {
		this.require = require;
	}
	
	
	
	

}
