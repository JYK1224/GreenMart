package com.green.mart.vo.work;

public class SearchDisuseListVo {
	private String dis_date;
	private String d_name;
	private int p_id;
	private String p_name;
	private int p_sprice;
	private String st_num;
	private String dis_num;
	private String e_id;
	private int s_num;
	
	public SearchDisuseListVo() {}
	public SearchDisuseListVo(String dis_date, String d_name, int p_id, String p_name, int p_sprice, String st_num,
			String dis_num, String e_id, int s_num) {
		this.dis_date = dis_date;
		this.d_name = d_name;
		this.p_id = p_id;
		this.p_name = p_name;
		this.p_sprice = p_sprice;
		this.st_num = st_num;
		this.dis_num = dis_num;
		this.e_id = e_id;
		this.s_num = s_num;
	}
	public String getDis_date() {
		return dis_date;
	}
	public void setDis_date(String dis_date) {
		this.dis_date = dis_date;
	}
	public String getD_name() {
		return d_name;
	}
	public void setD_name(String d_name) {
		this.d_name = d_name;
	}
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_sprice() {
		return p_sprice;
	}
	public void setP_sprice(int p_sprice) {
		this.p_sprice = p_sprice;
	}
	public String getSt_num() {
		return st_num;
	}
	public void setSt_num(String st_num) {
		this.st_num = st_num;
	}
	public String getDis_num() {
		return dis_num;
	}
	public void setDis_num(String dis_num) {
		this.dis_num = dis_num;
	}
	public String getE_id() {
		return e_id;
	}
	public void setE_id(String e_id) {
		this.e_id = e_id;
	}
	public int getS_num() {
		return s_num;
	}
	public void setS_num(int s_num) {
		this.s_num = s_num;
	}
	
	
	@Override
	public String toString() {
		return "SearchDisuseListVo [dis_date=" + dis_date + ", d_name=" + d_name + ", p_id=" + p_id + ", p_name="
				+ p_name + ", p_sprice=" + p_sprice + ", st_num=" + st_num + ", dis_num=" + dis_num + ", e_id=" + e_id
				+ ", s_num=" + s_num + "]";
	}
	
	
	
}
