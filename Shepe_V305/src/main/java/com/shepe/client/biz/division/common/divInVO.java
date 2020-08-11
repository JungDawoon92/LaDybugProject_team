package com.shepe.client.biz.division.common;

import org.springframework.stereotype.Service;

@Service
public class divInVO {
	
	public String divInmatter(String a) {
		
		int choice = Integer.parseInt(a); 
		
		switch (choice) {
		case 0:
			return "";
		case 1:
			return "MEAT";
		case 2:
			return "BEAF";
		case 3:
			return "CHICKEN";
		case 4:
			return "SEAFOOD";
		case 5:
			return "VEGETABLE";
		case 6:
			return "FRUIT";
		case 7:
			return "NUTS";
		case 8:
			return "ETC";
		default:
			return "";
		}		
	}
}