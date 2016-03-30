package kr.pe.temp.pension.vo;

public class RoomImgInfo {
	private String roomCode;
	private String roomImg;
	public String getRoomCode() {
		return roomCode;
	}
	public void setRoomCode(String roomCode) {
		this.roomCode = roomCode;
	}
	public String getRoomImg() {
		return roomImg;
	}
	public void setRoomImg(String roomImg) {
		this.roomImg = roomImg;
	}
	@Override
	public String toString() {
		return "RoomImgInfo [roomCode=" + roomCode + ", roomImg=" + roomImg
				+ "]";
	}
}
