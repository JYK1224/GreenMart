package com.green.mart.vo;

public class FilesVo {
	private int f_seq;
	private int idx;
	private String f_name;
	private String f_ext;
	private String f_sname;

	public FilesVo() {
	}
	public FilesVo(int f_seq, int idx, String f_name, String f_ext, String f_sname) {
		super();
		this.f_seq = f_seq;
		this.idx = idx;
		this.f_name = f_name;
		this.f_ext = f_ext;
		this.f_sname = f_sname;
	}
	public int getF_seq() {
		return f_seq;
	}
	public void setF_seq(int f_seq) {
		this.f_seq = f_seq;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getF_name() {
		return f_name;
	}
	public void setF_name(String f_name) {
		this.f_name = f_name;
	}
	public String getF_ext() {
		return f_ext;
	}
	public void setF_ext(String f_ext) {
		this.f_ext = f_ext;
	}
	public String getF_sname() {
		return f_sname;
	}
	public void setF_sname(String f_sname) {
		this.f_sname = f_sname;
	}
	@Override
	public String toString() {
		return "FilesVo [f_seq=" + f_seq + ", idx=" + idx + ", f_name=" + f_name + ", f_ext=" + f_ext + ", f_sname="
				+ f_sname + "]";
	}
	
	
	
}
