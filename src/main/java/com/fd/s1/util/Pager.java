package com.fd.s1.util;

import lombok.Data;

@Data
public class Pager {
	
	private Integer category;
	private Long userType;
	private Integer perPage;
	private Integer startRow;
	private Integer pn;
	private String kind;
	private String search;
	private Long startNum;
	private Long lastNum;
	private boolean pre;
	private boolean next;

	public void makeNum(Long totalCount) {
		
		Long totalPage = totalCount / this.getPerPage();
		
		if (totalCount % this.getPerPage() != 0) {
			totalPage++;
		}

		Long perBlock = 10L;

		Long totalBlock = totalPage / perBlock;
		if (totalPage % perBlock != 0) {
			totalBlock++;
		}

		Long curBlock = this.getPn() / perBlock;

		if (this.getPn() % perBlock != 0) {
			curBlock++;
		}

		this.startNum = (curBlock - 1) * perBlock + 1;
		this.lastNum = curBlock * perBlock;

		if (curBlock > 1) {
			this.pre = true;
		}

		if (totalBlock > curBlock) {
			this.next = true;
		}

		if (curBlock == totalBlock) {
			this.lastNum = totalPage;
		}

		if (totalCount == 0) {
			this.lastNum = 0L;
		}

	}

	public void makeRow() {
		this.startRow = (this.getPn() - 1) * this.getPerPage();
	}

	public Integer getPn() {
		if (this.pn == null || this.pn < 1) {
			this.pn = 1;
		}
		return this.pn;
	}

	public Integer getPerPage() {
		if (this.perPage == null || this.perPage < 1) {
			this.perPage = 10;
		}
		return this.perPage;
	}

	public String getSearch() {
		if (this.search == null) {
			this.search = "";
		}
		return this.search;
	}

}
