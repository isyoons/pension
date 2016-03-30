package kr.pe.temp.pension.dao;

import java.util.List;
import java.util.Map;

import kr.pe.temp.pension.vo.Room;
import kr.pe.temp.pension.vo.RoomImgInfo;

public interface RoomDao {
	
	List<Room> selectList() throws Exception;
	Room selectOne(String roomCode) throws Exception;
	List<String> selectRoomImg(String roomCode) throws Exception;
	int updateRoomInfo(Room room) throws Exception;
	int insertRoomImg(RoomImgInfo roomImgInfo) throws Exception;
	int deleteRoomImg(RoomImgInfo roomImgInfo) throws Exception;
	int insertRoom(Room room) throws Exception;
	int deleteRoom(String roomCode);
	int deleteRoomImgforRoomCode(String roomCode);
}
