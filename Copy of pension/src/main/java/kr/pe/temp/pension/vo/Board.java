package kr.pe.temp.pension.vo;

import java.util.Date;

public class Board {
	int num;
	int dpwd;
	String bname;
	String title;
	String content;
	Date dob;
	String pic;
	String pictype;
	String bsection;
	int bcount;

	int cnum;
	String cname;
	int cpwd;
	String commant;
	Date cdob;

	
	
	public int getCnum() {
		return cnum;
	}

	public void setCnum(int cnum) {
		this.cnum = cnum;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public int getCpwd() {
		return cpwd;
	}

	public void setCpwd(int cpwd) {
		this.cpwd = cpwd;
	}

	public String getCommant() {
		return commant;
	}

	public void setCommant(String commant) {
		this.commant = commant;
	}

	public Date getCdob() {
		return cdob;
	}

	public void setCdob(Date cdob) {
		this.cdob = cdob;
	}

	public String getPictype() {
		return pictype;
	}

	public void setPictype(String pictype) {
		this.pictype = pictype;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getDpwd() {
		return dpwd;
	}

	public void setDpwd(int dpwd) {
		this.dpwd = dpwd;
	}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getBsection() {
		return bsection;
	}

	public void setBsection(String bsection) {
		this.bsection = bsection;
	}

	public int getBcount() {
		return bcount;
	}

	public void setBcount(int bcount) {
		this.bcount = bcount;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	
	
	@Override
	public String toString() {
		return "Board [num=" + num + ", dpwd=" + dpwd + ", bname=" + bname
				+ ", title=" + title + ", content=" + content + ", dob=" + dob
				+ ", pic=" + pic + ", pictype=" + pictype + ", bsection="
				+ bsection + ", bcount=" + bcount + ", cnum=" + cnum
				+ ", cname=" + cname + ", cpwd=" + cpwd + ", commant="
				+ commant + ", cdob=" + cdob + "]";
	}

}
