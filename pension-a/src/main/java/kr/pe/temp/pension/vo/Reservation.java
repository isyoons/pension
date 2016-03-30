package kr.pe.temp.pension.vo;

import java.util.Date;

public class Reservation {
	private int resveCode;
	private String resveCtm;
	private String payCtm;
	private String phoneNumber;
	private Date resveDay;
	private int resvePd;
	private int totalResveNum;
	private int payAmount;
	private int isDeposit;
	private String etc;

	public int getResveCode() {
		return resveCode;
	}

	public void setResveCode(int resveCode) {
		this.resveCode = resveCode;
	}

	public String getResveCtm() {
		return resveCtm;
	}

	public void setResveCtm(String resveCtm) {
		this.resveCtm = resveCtm;
	}

	public String getPayCtm() {
		return payCtm;
	}

	public void setPayCtm(String payCtm) {
		this.payCtm = payCtm;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public Date getResveDay() {
		return resveDay;
	}

	public void setResveDay(Date resveDay) {
		this.resveDay = resveDay;
	}

	public int getResvePd() {
		return resvePd;
	}

	public void setResvePd(int resvePd) {
		this.resvePd = resvePd;
	}

	public int getTotalResveNum() {
		return totalResveNum;
	}

	public void setTotalResveNum(int totalResveNum) {
		this.totalResveNum = totalResveNum;
	}

	public int getPayAmount() {
		return payAmount;
	}

	public void setPayAmount(int payAmount) {
		this.payAmount = payAmount;
	}

	public int getIsDeposit() {
		return isDeposit;
	}

	public void setIsDeposit(int isDeposit) {
		this.isDeposit = isDeposit;
	}

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}

	@Override
	public String toString() {
		return "Reservation [resveCode=" + resveCode + ", resveCtm=" + resveCtm
				+ ", payCtm=" + payCtm + ", phoneNumber=" + phoneNumber
				+ ", resveDay=" + resveDay + ", resvePd=" + resvePd
				+ ", totalResveNum=" + totalResveNum + ", payAmount="
				+ payAmount + ", isDeposit=" + isDeposit + ", etc=" + etc + "]";
	}

}
