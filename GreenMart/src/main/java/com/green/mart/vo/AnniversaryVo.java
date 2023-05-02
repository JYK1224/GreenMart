package com.green.mart.vo;

public class AnniversaryVo {
	private int ann_num;
	private String ann_date;
	private String ann_name;
	public AnniversaryVo() {
		super();
	}
	public AnniversaryVo(int ann_num, String ann_date, String ann_name) {
		super();
		this.ann_num = ann_num;
		this.ann_date = ann_date;
		this.ann_name = ann_name;
	}
	public int getAnn_num() {
		return ann_num;
	}
	public void setAnn_num(int ann_num) {
		this.ann_num = ann_num;
	}
	public String getAnn_date() {
		return ann_date;
	}
	public void setAnn_date(String ann_date) {
		this.ann_date = ann_date;
	}
	public String getAnn_name() {
		return ann_name;
	}
	public void setAnn_name(String ann_name) {
		this.ann_name = ann_name;
	}
	@Override
	public String toString() {
		return "AnniversaryVo [ann_num=" + ann_num + ", ann_date=" + ann_date + ", ann_name=" + ann_name + "]";
	}
	
}
