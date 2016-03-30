package kr.pe.temp.pension.controls;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import kr.pe.temp.pension.dao.RoomDao;
import kr.pe.temp.pension.vo.Room;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

//@SessionAttributes 적용
@Controller
@SessionAttributes("room")
@RequestMapping(value="/room")
public class RoomsController {

	private RoomDao roomDao;
	
	@Autowired
	public RoomsController setRoomDao(RoomDao roomDao) {
		this.roomDao = roomDao;
		return this;
	}

	@RequestMapping(value = "/rooms", method = RequestMethod.GET)
	public String roomform(String roomCode, Map<String, Object> model)
			throws Exception {
		Room room = roomDao.selectOne(roomCode);
		List<String> roomImg = roomDao.selectRoomImg(roomCode);
		// String[] imgs=(String[]) roomImg.toArray();
		
		if (roomImg.size() > 0) {
			model.put("imgNumber", roomImg.size());
		}else{
			model.put("imgNumber", roomImg.size());
		}
		List<Room> rooms=roomDao.selectList();
		List<String[]> roomNames=new ArrayList<String[]>();
		for(Room rm:rooms){
			roomNames.add(new String[]{rm.getRoomCode(),rm.getRoomName()});
		}
		model.put("roomCodes", roomNames);	
		model.put("roomImg", roomImg);
		model.put("roomInfo", room);
		model.put("roomCode", roomCode);
		return "rooms.jsp";
	}
}
