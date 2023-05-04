package com.green.mart.vo;

public class InputVo {
	private String in_id;
	private String in_date;
	private int in_num;
	private String e_id;
	private int p_seq;

	public InputVo() {
	}

	public InputVo(String in_id, String in_date, int in_num, String e_id, int p_seq) {
		super();
		this.in_id = in_id;
		this.in_date = in_date;
		this.in_num = in_num;
		this.e_id = e_id;
		this.p_seq = p_seq;
	}

	public String getIn_id() {
		return in_id;
	}

	public void setIn_id(String in_id) {
		this.in_id = in_id;
	}

	public String getIn_date() {
		return in_date;
	}

	public void setIn_date(String in_date) {
		this.in_date = in_date;
	}

	public int getIn_num() {
		return in_num;
	}

	public void setIn_num(int in_num) {
		this.in_num = in_num;
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
		return "InputVo [in_id=" + in_id + ", in_date=" + in_date + ", in_num=" + in_num + ", e_id=" + e_id + ", p_seq="
				+ p_seq + "]";
	}
	
	
}
