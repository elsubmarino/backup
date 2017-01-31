package com.coresec.admin.domain;

import java.util.Date;

public class Banner {
	private int f_id;
	private String f_subject;
	private String f_link;
	private int f_sort;
	private String f_upfile_name;
	private String f_comment;
	private String f_ip;
	private Date f_wdate;

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

	public String getF_link() {
		return f_link;
	}

	public void setF_link(String f_link) {
		this.f_link = f_link;
	}

	public int getF_sort() {
		return f_sort;
	}

	public void setF_sort(int f_sort) {
		this.f_sort = f_sort;
	}

	public String getF_upfile_name() {
		return f_upfile_name;
	}

	public void setF_upfile_name(String f_upfile_name) {
		this.f_upfile_name = f_upfile_name;
	}

	public String getF_comment() {
		return f_comment;
	}

	public void setF_comment(String f_comment) {
		this.f_comment = f_comment;
	}

	public String getF_ip() {
		return f_ip;
	}

	public void setF_ip(String f_ip) {
		this.f_ip = f_ip;
	}

	public Date getF_wdate() {
		return f_wdate;
	}

	public void setF_wdate(Date f_wdate) {
		this.f_wdate = f_wdate;
	}

}
