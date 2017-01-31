package com.coresec.admin.domain;

import java.util.Date;

public class Service {
	private int f_id;
	private String f_subject;
	private int f_sort;
	private Date f_wdate;
	private String f_temp1;
	private String f_temp2;

	public int getF_id() {
		return f_id;
	}

	public void setF_id(int f_id) {
		this.f_id = f_id;
	}

	public String getF_subject() {
		return f_subject;
	}

	public void setF_subject(String f_subject) {
		this.f_subject = f_subject;
	}

	public int getF_sort() {
		return f_sort;
	}

	public void setF_sort(int f_sort) {
		this.f_sort = f_sort;
	}

	public Date getF_wdate() {
		return f_wdate;
	}

	public void setF_wdate(Date f_wdate) {
		this.f_wdate = f_wdate;
	}

	public String getF_temp1() {
		return f_temp1;
	}

	public void setF_temp1(String f_temp1) {
		this.f_temp1 = f_temp1;
	}

	public String getF_temp2() {
		return f_temp2;
	}

	public void setF_temp2(String f_temp2) {
		this.f_temp2 = f_temp2;
	}

}
