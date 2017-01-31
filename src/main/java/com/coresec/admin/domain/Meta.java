package com.coresec.admin.domain;

import java.util.Date;

public class Meta {
	private int f_id;
	private String f_title;
	private String f_description;
	private String f_keywords;
	private String f_keywords_e;
	private Date f_wdate;

	public int getF_id() {
		return f_id;
	}

	public void setF_id(int f_id) {
		this.f_id = f_id;
	}

	public String getF_title() {
		return f_title;
	}

	public void setF_title(String f_title) {
		this.f_title = f_title;
	}

	public String getF_description() {
		return f_description;
	}

	public void setF_description(String f_description) {
		this.f_description = f_description;
	}

	public String getF_keywords() {
		return f_keywords;
	}

	public void setF_keywords(String f_keywords) {
		this.f_keywords = f_keywords;
	}

	public String getF_keywords_e() {
		return f_keywords_e;
	}

	public void setF_keywords_e(String f_keywords_e) {
		this.f_keywords_e = f_keywords_e;
	}

	public Date getF_wdate() {
		return f_wdate;
	}

	public void setF_wdate(Date f_wdate) {
		this.f_wdate = f_wdate;
	}

}
