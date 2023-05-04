package com.green.mart.vo;

public class JumpoVo {
	private String j_id;
	private String j_name;
	
	public JumpoVo() {
	}
	public JumpoVo(String j_id, String j_name) {
		super();
		this.j_id = j_id;
		this.j_name = j_name;
	}
	
	public String getJ_id() {
		return j_id;
	}
	public void setJ_id(String j_id) {
		this.j_id = j_id;
	}
	public String getJ_name() {
		return j_name;
	}
	public void setJ_name(String j_name) {
		this.j_name = j_name;
	}
	
	@Override
	public String toString() {
		return "JumpoVo [j_id=" + j_id + ", j_name=" + j_name + "]";
	}
	
}
