package com.green.mart.vo;

public class DeptVo {
	
	private String d_id;
	private String d_name;
	private String d_dam;
	private String d_phone;
	
	public DeptVo() {
	}
	public DeptVo(String d_id, String d_name, String d_dam, String d_phone) {
		super();
		this.d_id = d_id;
		this.d_name = d_name;
		this.d_dam = d_dam;
		this.d_phone = d_phone;
	}
	
	public String getD_id() {
		return d_id;
	}
	public void setD_id(String d_id) {
		this.d_id = d_id;
	}
	public String getD_name() {
		return d_name;
	}
	public void setD_name(String d_name) {
		this.d_name = d_name;
	}
	public String getD_dam() {
		return d_dam;
	}
	public void setD_dam(String d_dam) {
		this.d_dam = d_dam;
	}
	public String getD_phone() {
		return d_phone;
	}
	public void setD_phone(String d_phone) {
		this.d_phone = d_phone;
	}
	@Override
	public String toString() {
		return "CustomerVo [d_id=" + d_id + ", d_name=" + d_name + ", d_dam=" + d_dam + ", d_phone=" + d_phone + "]";
	}
	
}
