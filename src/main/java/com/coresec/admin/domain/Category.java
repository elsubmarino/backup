package com.coresec.admin.domain;

//tbl_category
public class Category {
	private int f_id;
	private String f_ca_id;
	private String f_ca_name;
	private String f_upfile_name;
	private String f_comment;

	public int getF_id() {
		return f_id;
	}

	public void setF_id(int f_id) {
		this.f_id = f_id;
	}

	public String getF_ca_id() {
		return f_ca_id;
	}

	public void setF_ca_id(String f_ca_id) {
		this.f_ca_id = f_ca_id;
	}

	public String getF_ca_name() {
		return f_ca_name;
	}

	public void setF_ca_name(String f_ca_name) {
		this.f_ca_name = f_ca_name;
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

}
