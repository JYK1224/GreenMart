package com.green.mart.vo;

public class CustomerVo {

	private String c_id;
	private String c_name;
	private String c_phone;
	private String c_mile;
	
	public CustomerVo() {
	}
	public CustomerVo(String c_id, String c_name, String c_phone, String c_mile) {
		super();
		this.c_id = c_id;
		this.c_name = c_name;
		this.c_phone = c_phone;
		this.c_mile = c_mile;
	}
	public String getC_id() {
	
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_phone() {
		return c_phone;
	}
	public void setC_phone(String c_phone) {
		this.c_phone = c_phone;
	}
	public String getC_mile() {
		return c_mile;
	}
	public void setC_mile(String c_mile) {
		this.c_mile = c_mile;
	}
	
	@Override
	public String toString() {
		return "CustomerVo [c_id=" + c_id + ", c_name=" + c_name + ", c_phone=" + c_phone + ", c_mile=" + c_mile + "]";
	}
	
	
}
