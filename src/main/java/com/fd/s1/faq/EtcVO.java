package com.fd.s1.faq;

import lombok.Data;

@Data
public class EtcVO {

	private Long category;
	
	public Long getCategory() {	
		if(this.category==null) {
			return 1L;
		}
		return category;
	}
	
	private Integer perPage;
	private Integer startRow;
	private String search;
	
}
