package com.green.mart.vo;

public class DisuseVo {
	private String dis_id;
	private String dis_date;
	private int dis_num;
	private String e_id;
	private int p_seq;
	
	public DisuseVo() {
	}

	public DisuseVo(String dis_id, String dis_date, int dis_num, String e_id, int p_seq) {
		super();
		this.dis_id = dis_id;
		this.dis_date = dis_date;
		this.dis_num = dis_num;
		this.e_id = e_id;
		this.p_seq = p_seq;
	}

	public String getDis_id() {
		return dis_id;
	}

	public void setDis_id(String dis_id) {
		this.dis_id = dis_id;
	}

	public String getDis_date() {
		return dis_date;
	}

	public void setDis_date(String dis_date) {
		this.dis_date = dis_date;
	}

	public int getDis_num() {
		return dis_num;
	}

	public void setDis_num(int dis_num) {
		this.dis_num = dis_num;
	}

	public String getE_id() {
		return e_id;
	}

	public void setE_id(String e_id) {
		this.e_id = e_id;
	}

	public int getP_seq() {
		return p_seq;
	}

	public void setP_seq(int p_seq) {
		this.p_seq = p_seq;
	}

	
	@Override
	public String toString() {
		return "DisuseVo [dis_id=" + dis_id + ", dis_date=" + dis_date + ", dis_num=" + dis_num + ", e_id=" + e_id
				+ ", p_seq=" + p_seq + "]";
	}
	
	
	
	
}
