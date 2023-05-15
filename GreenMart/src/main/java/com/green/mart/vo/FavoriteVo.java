package com.green.mart.vo;

public class FavoriteVo {
	// Fields
	private String e_id;
	private String ft_id;
	private String ft_name;
	private String ft_atag;
	// Constructor
	public FavoriteVo() {}
	public FavoriteVo(String e_id, String ft_id, String ft_name, String ft_atag) {
		this.e_id = e_id;
		this.ft_id = ft_id;
		this.ft_name = ft_name;
		this.ft_atag = ft_atag;
	}
	// Getter, Setter
	public String getE_id() {
		return e_id;
	}
	public void setE_id(String e_id) {
		this.e_id = e_id;
	}
	public String getFt_id() {
		return ft_id;
	}
	public void setFt_id(String ft_id) {
		this.ft_id = ft_id;
	}
	public String getFt_name() {
		return ft_name;
	}
	public void setFt_name(String ft_name) {
		this.ft_name = ft_name;
	}
	public String getFt_atag() {
		return ft_atag;
	}
	public void setFt_atag(String ft_atag) {
		this.ft_atag = ft_atag;
	}
	// toString
	@Override
	public String toString() {
		return "FavoriteVo [e_id=" + e_id + ", ft_id=" + ft_id + ", ft_name=" + ft_name + ", ft_atag=" + ft_atag + "]";
	}
	
}
