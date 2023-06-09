package com.green.mart.vo;

public class EmployeeVo {
	private String e_id;
	private String e_name;
	private String e_passwd;
	private String e_intro;
	private String e_indate;
	private String j_id;
	private String e_phone;
	private String j_name;
	
	
	public EmployeeVo() {
	}
	public EmployeeVo(String e_id, String e_name, String e_passwd, String e_intro, String e_indate, String j_id,
			String e_phone, String j_name) {
		super();
		this.e_id = e_id;
		this.e_name = e_name;
		this.e_passwd = e_passwd;
		this.e_intro = e_intro;
		this.e_indate = e_indate;
		this.j_id = j_id;
		this.e_phone = e_phone;
		this.j_name = j_name;
	}
	public String getE_id() {
		return e_id;
	}
	public void setE_id(String e_id) {
		this.e_id = e_id;
	}
	public String getE_name() {
		return e_name;
	}
	public void setE_name(String e_name) {
		this.e_name = e_name;
	}
	public String getE_passwd() {
		return e_passwd;
	}
	public void setE_passwd(String e_passwd) {
		this.e_passwd = e_passwd;
	}
	public String getE_intro() {
		return e_intro;
	}
	public void setE_intro(String e_intro) {
		this.e_intro = e_intro;
	}
	public String getE_indate() {
		return e_indate;
	}
	public void setE_indate(String e_indate) {
		this.e_indate = e_indate;
	}
	public String getJ_id() {
		return j_id;
	}
	public void setJ_id(String j_id) {
		this.j_id = j_id;
	}
	public String getE_phone() {
		return e_phone;
	}
	public void setE_phone(String e_phone) {
		this.e_phone = e_phone;
	}
	public String getJ_name() {
		return j_name;
	}
	public void setJ_name(String j_name) {
		this.j_name = j_name;
	}
	
	@Override
	public String toString() {
		return "EmployeeVo [e_id=" + e_id + ", e_name=" + e_name + ", e_passwd=" + e_passwd + ", e_intro=" + e_intro
				+ ", e_indate=" + e_indate + ", j_id=" + j_id + ", e_phone=" + e_phone + ", j_name=" + j_name + "]";
	}
	
	
}	