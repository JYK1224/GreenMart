package com.green.mart.vo.work;

public class SearchProductVo {
 private String p_id;
 private String p_name;
 private int p_iprice;
 private int p_sprice;
 private String d_id;
 private String d_name;
 private int st_num;
 private String a_name;
 public SearchProductVo() {}
 public SearchProductVo(String p_id, String p_name, int p_iprice, int p_sprice, String d_id, String d_name, int st_num,
		String a_name) {
	this.p_id = p_id;
	this.p_name = p_name;
	this.p_iprice = p_iprice;
	this.p_sprice = p_sprice;
	this.d_id = d_id;
	this.d_name = d_name;
	this.st_num = st_num;
	this.a_name = a_name;
}
public String getP_id() {
	return p_id;
}
public void setP_id(String p_id) {
	this.p_id = p_id;
}
public String getP_name() {
	return p_name;
}
public void setP_name(String p_name) {
	this.p_name = p_name;
}
public int getP_iprice() {
	return p_iprice;
}
public void setP_iprice(int p_iprice) {
	this.p_iprice = p_iprice;
}
public int getP_sprice() {
	return p_sprice;
}
public void setP_sprice(int p_sprice) {
	this.p_sprice = p_sprice;
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
public int getSt_num() {
	return st_num;
}
public void setSt_num(int st_num) {
	this.st_num = st_num;
}
public String getA_name() {
	return a_name;
}
public void setA_name(String a_name) {
	this.a_name = a_name;
}
@Override
public String toString() {
	return "SearchProductVo [p_id=" + p_id + ", p_name=" + p_name + ", p_iprice=" + p_iprice + ", p_sprice=" + p_sprice
			+ ", d_id=" + d_id + ", d_name=" + d_name + ", st_num=" + st_num + ", a_name=" + a_name + "]";
}
 
}
