package com.ecogas.booking;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoookingServiceImpl implements BookingService {

	@Autowired
	private BookingRepo br;

	@Override
	public int book(Booking b) {
		int id = randomNumber();
		while(br.existsById(id)) {
			id = randomNumber();
		}
		b.setOrderId(id);
		Date date = new Date();
		Timestamp timestamp = new Timestamp(date.getTime());
		b.setTime(timestamp);
		br.save(b);
		return id;

	}

	public int randomNumber() {
		int max = 9999;
		int min = 111;
		return  (int)(Math.random()*(max-min+1)+min);  
	}

	@Override
	public List<Booking> userBooking(String username) {
		List<Booking> bk = br.findAll();
		List<Booking> bl = new ArrayList<>();
		for(Booking b : bk) {
			if(b.getBuyer().equalsIgnoreCase(username) ||  b.getSeller().equalsIgnoreCase(username)) {
				bl.add(b);
			}
		}
		return bl;
	}

	@Override
	public Booking getbyid(int id) {
		return br.findById(id).get();
	}

	@Override
	public List<Integer> dashdata(String username) {
		List<Booking> bk = br.findAll();
		int f=0, g=0, a=0, r=0;
		for(Booking b : bk) {
			if(b.getSeller().equalsIgnoreCase(username) || b.getBuyer().equalsIgnoreCase(username)) {
				if(b.getType().equalsIgnoreCase("Fertilizers")) {
					f+=b.getQuantity();
					a = a + b.getAmount();
				}
				if(b.getType().equalsIgnoreCase("Gas-cylinder")) {
					g+=b.getQuantity();
					a = a  + b.getAmount();
				}
				if(b.getType().equalsIgnoreCase("Plant-Requirement")) {
					r+=b.getQuantity();
					a = a - b.getAmount();
				}
			}
		}
		List<Integer> l = new ArrayList<>();
		l.add(g);
		l.add(f);
		l.add(r);
		l.add(a);
		return l;
	}

}
