package com.green.mart.vo.work;

public class SearchMobileProductVo {
	private String p_name;
	private String p_id;
	private int p_sprice;
	private int st_num;
	
	public SearchMobileProductVo() {
	}
	
	public SearchMobileProductVo(String p_name, String p_id, int p_sprice, int st_num) {
		this.p_name = p_name;
		this.p_id = p_id;
		this.p_sprice = p_sprice;
		this.st_num = st_num;
	}
	
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_id() {
		return p_id;
	}
	public void setP_id(String p_id) {
		this.p_id = p_id;
	}
	public int getP_sprice() {
		return p_sprice;
	}
	public void setP_sprice(int p_sprice) {
		this.p_sprice = p_sprice;
	}
	public int getSt_num() {
		return st_num;
	}
	public void setSt_num(int st_num) {
		this.st_num = st_num;
	}
	
	@Override
	public String toString() {
		return "SearchMobileProductVo [p_name=" + p_name + ", p_id=" + p_id + ", p_sprice=" + p_sprice + ", st_num="
				+ st_num + "]";
	}
	
	

}
