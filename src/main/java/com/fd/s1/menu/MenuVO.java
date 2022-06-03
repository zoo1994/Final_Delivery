package com.fd.s1.menu;

import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class MenuVO {

	private Integer menuNum;
	@NotBlank(message = "이름을 입력해주세요.")
	private String menuName;
	@NotBlank(message = "영문 이름을 입력해주세요.")
	private String menuEng;
	@NotNull(message = "가격을 입력해주세요.")
	private Long price;
	@NotBlank(message = "메뉴 설명을 기입해주세요.")
	private String menuDetail;
	private Integer menuSale;
	private Integer category;
	private String id;
	
	private MenuFileVO menuFileVO;
	private IngredientVO ingredientVO;
}
