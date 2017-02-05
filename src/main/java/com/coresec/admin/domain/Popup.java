package com.coresec.admin.domain;

import java.util.Date;

//tbl_popup
public class Popup {
	private int f_id;
	private String f_subject;
	private String f_link;
	private int f_w_left;
	private int f_w_top;
	private int f_width;
	private int f_height;
	private String f_use;
	private String f_target;
	private String f_start;
	private String f_end;
	private String f_comment;
	private Date f_wdate;
	private String f_position;
	
	

	public String getF_position() {
		return f_position;
	}

	public void setF_position(String f_position) {
		this.f_position = f_position;
	}

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

	public int getF_w_left() {
		return f_w_left;
	}

	public void setF_w_left(int f_w_left) {
		this.f_w_left = f_w_left;
	}

	public int getF_w_top() {
		return f_w_top;
	}

	public void setF_w_top(int f_w_top) {
		this.f_w_top = f_w_top;
	}

	public int getF_width() {
		return f_width;
	}

	public void setF_width(int f_width) {
		this.f_width = f_width;
	}

	public int getF_height() {
		return f_height;
	}

	public void setF_height(int f_height) {
		this.f_height = f_height;
	}

	public String getF_use() {
		return f_use;
	}

	public void setF_use(String f_use) {
		this.f_use = f_use;
	}

	public String getF_target() {
		return f_target;
	}

	public void setF_target(String f_target) {
		this.f_target = f_target;
	}

	public String getF_start() {
		return f_start;
	}

	public void setF_start(String f_start) {
		this.f_start = f_start;
	}

	public String getF_end() {
		return f_end;
	}

	public void setF_end(String f_end) {
		this.f_end = f_end;
	}

	public String getF_comment() {
		return f_comment;
	}

	public void setF_comment(String f_comment) {
		this.f_comment = f_comment;
	}

	public Date getF_wdate() {
		return f_wdate;
	}

	public void setF_wdate(Date f_wdate) {
		this.f_wdate = f_wdate;
	}

}
