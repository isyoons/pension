package kr.pe.temp.pension.vo;

import java.util.Date;

public class ResveStatusInfo {
	private String roomCode;
	private Date resveDay;
	private int resveStatus;
	
	public String getRoomcode() {
		return roomCode;
	}
	public void setRoomcode(String roomcode) {
		this.roomCode = roomcode;
	}
	public Date getResveDay() {
		return resveDay;
	}
	public void setResveDay(Date resveDay) {
		this.resveDay = resveDay;
	}
	public int getResveStatus() {
		return resveStatus;
	}
	public void setResveStatus(int resveStatus) {
		this.resveStatus = resveStatus;
	}
	@Override
	public String toString() {
		return "ResveStatusInfo [roomCode=" + roomCode + ", resveDay="
				+ resveDay + ", resveStatus=" + resveStatus + "]";
	}
}
