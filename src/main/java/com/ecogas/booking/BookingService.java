package com.ecogas.booking;

import java.util.List;

public interface BookingService {
	public int book(Booking b);
	public List<Booking> userBooking(String username);
	public Booking getbyid(int id);
	public List<Integer> dashdata(String username);

}
