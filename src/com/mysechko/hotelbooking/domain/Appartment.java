package com.mysechko.hotelbooking.domain;

import java.math.BigDecimal;

public class Appartment {

	private long id;
	private int numPlaces;
	private Type type;
	private BigDecimal price;

	public enum Type {
		STANDARD, SEMI_LUX, LUX, PRESIDENT;
	}

}
