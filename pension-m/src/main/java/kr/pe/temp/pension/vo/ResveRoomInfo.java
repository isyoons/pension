package kr.pe.temp.pension.vo;

import java.util.Date;

public class ResveRoomInfo {
	private int resveCode;
	private String roomCode;
	private String roomName;
	private int resveNum;
	private int resvePd;
	private Date stayBeginDay;
	private Date stayEndDay;

	public int getResveCode() {
		return resveCode;
	}

	public void setResveCode(int resveCode) {
		this.resveCode = resveCode;
	}

	public String getRoomCode() {
		return roomCode;
	}

	public void setRoomCode(String roomCode) {
		this.roomCode = roomCode;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public int getResveNum() {
		return resveNum;
	}

	public void setResveNum(int resveNum) {
		this.resveNum = resveNum;
	}

	public int getResvePd() {
		return resvePd;
	}

	public void setResvePd(int resvePd) {
		this.resvePd = resvePd;
	}

	public Date getStayBeginDay() {
		return stayBeginDay;
	}

	public void setStayBeginDay(Date stayBeginDay) {
		this.stayBeginDay = stayBeginDay;
	}

	public Date getStayEndDay() {
		return stayEndDay;
	}

	public void setStayEndDay(Date stayEndDay) {
		this.stayEndDay = stayEndDay;
	}

	@Override
	public String toString() {
		return "ResveRoomInfo [resveCode=" + resveCode + ", roomCode="
				+ roomCode + ", roomName=" + roomName + ", resveNum="
				+ resveNum + ", resvePd=" + resvePd + ", stayBeginDay="
				+ stayBeginDay + ", stayEndDay=" + stayEndDay + "]";
	}

}
