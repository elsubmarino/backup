package com.coresec.admin.domain;

public class SearchCriteria extends Criteria {
	private int f_bid;
	public int getF_bid() {
		return f_bid;
	}

	public void setF_bid(int f_bid) {
		this.f_bid = f_bid;
	}

	private String searchType;
	private String keyword;

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

}
