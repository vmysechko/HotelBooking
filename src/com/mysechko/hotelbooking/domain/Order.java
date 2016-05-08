package com.mysechko.hotelbooking.domain;

import java.math.BigDecimal;
import java.util.Date;

public class Order {
	
	private long id;
	private int numPlaces;
	private Appartment.Type appartmentType;
	private Date checkIn;
	private Date CheckOut;
	private Status status;
	private BigDecimal totalPrice;
	private User user;
	private Appartment appartment;

	public enum Status{
		NEW, PROCESSED, CLOSED;
	}
	
	
}
