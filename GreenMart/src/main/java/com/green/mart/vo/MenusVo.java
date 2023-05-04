package com.green.mart.vo;

public class MenusVo {
	private String m_id;
	private String m_name;
	private int m_seq;
	
	public MenusVo() {
	}

	public MenusVo(String m_id, String m_name, int m_seq) {
		super();
		this.m_id = m_id;
		this.m_name = m_name;
		this.m_seq = m_seq;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public int getM_seq() {
		return m_seq;
	}

	public void setM_seq(int m_seq) {
		this.m_seq = m_seq;
	}

	@Override
	public String toString() {
		return "MenusVo [m_id=" + m_id + ", m_name=" + m_name + ", m_seq=" + m_seq + "]";
	}
	
}
