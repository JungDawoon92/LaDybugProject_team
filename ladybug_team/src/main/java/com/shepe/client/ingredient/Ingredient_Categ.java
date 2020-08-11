package com.shepe.client.ingredient;

public enum Ingredient_Categ {
	MEAT("육류"),
	BEEF("소고기"),
	CHICKEN("닭고기"),
	SEAFOOD("해산물"),
	VEGETABLE("야채"),
	FRUIT("과일"),
	NUTS("견과류"),
	ETC("기타");

	private String title;

	private Ingredient_Categ(String title) {
		this.title = title;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	
	
}
