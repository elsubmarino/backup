package com.coresec.admin.domain;

import java.util.List;

//tbl_popup
public class Canonical {
	private int f_id;
	private String f_year;
	private List<Canonical> list;

	public List<Canonical> getList() {
		return list;
	}

	public void setList(List<Canonical> list) {
		this.list = list;
	}

	public int getF_id() {
		return f_id;
	}

	public void setF_id(int f_id) {
		this.f_id = f_id;
	}

	public String getF_year() {
		return f_year;
	}

	public void setF_year(String f_year) {
		this.f_year = f_year;
	}

	private int f_id_s;
	private int f_hid;
	private String f_ko;
	private String f_en;
	private String f_month;

	public int getF_id_s() {
		return f_id_s;
	}

	public void setF_id_s(int f_id_s) {
		this.f_id_s = f_id_s;
	}

	public int getF_hid() {
		return f_hid;
	}

	public void setF_hid(int f_hid) {
		this.f_hid = f_hid;
	}

	public String getF_ko() {
		return f_ko;
	}

	public void setF_ko(String f_ko) {
		this.f_ko = f_ko;
	}

	public String getF_en() {
		return f_en;
	}

	public void setF_en(String f_en) {
		this.f_en = f_en;
	}

	public String getF_month() {
		return f_month;
	}

	public void setF_month(String f_month) {
		this.f_month = f_month;
	}

}
