package com.green.mart.vo.work;

public class SearchProductVo {
	private int p_seq;
	private String p_id;
	private String p_name;
	private int p_iprice;
	private int p_sprice;
	private int p_del;
	private String d_id;
	private String a_id;
	private String j_id;
	private String s_id;
	private int s_num;
	private String d_name;
	private int st_num;
	private String a_name;
 
 public SearchProductVo() {}

public SearchProductVo(int p_seq, String p_id, String p_name, int p_iprice, int p_sprice, int p_del, String d_id,
		String a_id, String j_id, String s_id, int s_num, String d_name, int st_num, String a_name) {
	super();
	this.p_seq = p_seq;
	this.p_id = p_id;
	this.p_name = p_name;
	this.p_iprice = p_iprice;
	this.p_sprice = p_sprice;
	this.p_del = p_del;
	this.d_id = d_id;
	this.a_id = a_id;
	this.j_id = j_id;
	this.s_id = s_id;
	this.s_num = s_num;
	this.d_name = d_name;
	this.st_num = st_num;
	this.a_name = a_name;
}

public int getP_seq() {
	return p_seq;
}

public void setP_seq(int p_seq) {
	this.p_seq = p_seq;
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

public int getP_del() {
	return p_del;
}

public void setP_del(int p_del) {
	this.p_del = p_del;
}

public String getD_id() {
	return d_id;
}

public void setD_id(String d_id) {
	this.d_id = d_id;
}

public String getA_id() {
	return a_id;
}

public void setA_id(String a_id) {
	this.a_id = a_id;
}

public String getJ_id() {
	return j_id;
}

public void setJ_id(String j_id) {
	this.j_id = j_id;
}

public String getS_id() {
	return s_id;
}

public void setS_id(String s_id) {
	this.s_id = s_id;
}

public int getS_num() {
	return s_num;
}

public void setS_num(int s_num) {
	this.s_num = s_num;
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
	return "SearchProductVo [p_seq=" + p_seq + ", p_id=" + p_id + ", p_name=" + p_name + ", p_iprice=" + p_iprice
			+ ", p_sprice=" + p_sprice + ", p_del=" + p_del + ", d_id=" + d_id + ", a_id=" + a_id + ", j_id=" + j_id
			+ ", s_id=" + s_id + ", s_num=" + s_num + ", d_name=" + d_name + ", st_num=" + st_num + ", a_name=" + a_name
			+ "]";
}
 
}