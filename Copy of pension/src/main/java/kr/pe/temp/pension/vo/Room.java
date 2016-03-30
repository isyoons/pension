package kr.pe.temp.pension.vo;

public class Room {
	private String roomCode;
	private String roomName;
	private int stdNum;
	private int maxNum;
	private boolean coupleRoom;
	private boolean doubleLayer;
	private boolean spa;
	private int lowSeasonWeekdayPrice;
	private int lowSeasonFridayPrice;
	private int lowSeasonWeekendPrice; 
	private int middleSeasonWeekdayPrice; 
	private int middleSeasonWeekendPrice;
	private int highSeasonWeekdayPrice;
	private int highSeasonWeekendPrice;
	private String equipment;
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
	public int getStdNum() {
		return stdNum;
	}
	public void setStdNum(int stdNum) {
		this.stdNum = stdNum;
	}
	public int getMaxNum() {
		return maxNum;
	}
	public void setMaxNum(int maxNum) {
		this.maxNum = maxNum;
	}
	public boolean isCoupleRoom() {
		return coupleRoom;
	}
	public void setCoupleRoom(boolean coupleRoom) {
		this.coupleRoom = coupleRoom;
	}
	public boolean isDoubleLayer() {
		return doubleLayer;
	}
	public void setDoubleLayer(boolean doubleLayer) {
		this.doubleLayer = doubleLayer;
	}
	public boolean isSpa() {
		return spa;
	}
	public void setSpa(boolean spa) {
		this.spa = spa;
	}
	public int getLowSeasonWeekdayPrice() {
		return lowSeasonWeekdayPrice;
	}
	public void setLowSeasonWeekdayPrice(int lowSeasonWeekdayPrice) {
		this.lowSeasonWeekdayPrice = lowSeasonWeekdayPrice;
	}
	public int getLowSeasonFridayPrice() {
		return lowSeasonFridayPrice;
	}
	public void setLowSeasonFridayPrice(int lowSeasonFridayPrice) {
		this.lowSeasonFridayPrice = lowSeasonFridayPrice;
	}
	public int getLowSeasonWeekendPrice() {
		return lowSeasonWeekendPrice;
	}
	public void setLowSeasonWeekendPrice(int lowSeasonWeekendPrice) {
		this.lowSeasonWeekendPrice = lowSeasonWeekendPrice;
	}
	public int getMiddleSeasonWeekdayPrice() {
		return middleSeasonWeekdayPrice;
	}
	public void setMiddleSeasonWeekdayPrice(int middleSeasonWeekdayPrice) {
		this.middleSeasonWeekdayPrice = middleSeasonWeekdayPrice;
	}
	public int getMiddleSeasonWeekendPrice() {
		return middleSeasonWeekendPrice;
	}
	public void setMiddleSeasonWeekendPrice(int middleSeasonWeekendPrice) {
		this.middleSeasonWeekendPrice = middleSeasonWeekendPrice;
	}
	public int getHighSeasonWeekdayPrice() {
		return highSeasonWeekdayPrice;
	}
	public void setHighSeasonWeekdayPrice(int highSeasonWeekdayPrice) {
		this.highSeasonWeekdayPrice = highSeasonWeekdayPrice;
	}
	public int getHighSeasonWeekendPrice() {
		return highSeasonWeekendPrice;
	}
	public void setHighSeasonWeekendPrice(int highSeasonWeekendPrice) {
		this.highSeasonWeekendPrice = highSeasonWeekendPrice;
	}
	public String getEquipment() {
		return equipment;
	}
	public void setEquipment(String equipment) {
		this.equipment = equipment;
	}
	@Override
	public String toString() {
		return roomCode + ", " + roomName + ", " + stdNum + ", " + maxNum
				+ ", " + coupleRoom + ", " + doubleLayer + ", " + spa + ", "
				+ lowSeasonWeekdayPrice + ", " + lowSeasonFridayPrice + ", "
				+ lowSeasonWeekendPrice + ", " + middleSeasonWeekdayPrice
				+ ", " + middleSeasonWeekendPrice + ", "
				+ highSeasonWeekdayPrice + ", " + highSeasonWeekendPrice + ", "
				+ equipment;
	}
}
