package kr.pe.temp.pension.controls;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.pe.temp.pension.dao.RoomDao;
import kr.pe.temp.pension.util.DetectDeviceUtils;
import kr.pe.temp.pension.util.PagingUtils;
import kr.pe.temp.pension.util.UploadFileUtils;
import kr.pe.temp.pension.vo.Room;
import kr.pe.temp.pension.vo.RoomImgInfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

//@SessionAttributes 적용
@Controller
@SessionAttributes("room")
@RequestMapping(value = "/Temp/TRoom")
public class TRoomController {

	private RoomDao roomDao;

	@Resource(name = "detectDeviceUtils")
	DetectDeviceUtils detectDeviceUtils;

	@Resource(name = "uploadFileUtils")
	UploadFileUtils uploadFileUtils;

	@Resource(name = "pagingUtils")
	PagingUtils pagingUtils;

	@Autowired
	public TRoomController setRoomDao(RoomDao roomDao) {
		this.roomDao = roomDao;
		return this;
	}

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(Room room, Map<String, Object> model) throws Exception {
		room = roomDao.selectOne(room.getRoomCode());
		roomDao.selectRoomImg(room.getRoomCode());
		List<String> roomImgs = roomDao.selectRoomImg(room.getRoomCode());

		model.put("room", room);
		model.put("roomImgs", roomImgs);
		return "detail.jsp";
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String roomform(Map<String, Object> model) throws Exception {
		List<Room> rooms = roomDao.selectList();
		List<List<String>> roomImgs = new ArrayList<List<String>>();
		for (Room room : rooms) {
			List<String> roomImg = roomDao.selectRoomImg(room.getRoomCode());
			roomImgs.add(roomImg);
		}

		// String[] imgs=(String[]) roomImg.toArray();
		model.put("roomsize", rooms.size() == 0 ? 0 : (rooms.size() - 1));
		model.put("roomlist", rooms);
		model.put("roomImgs", roomImgs);
		model.put("roomImgsize", roomImgs.size());

		return "list.jsp";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(Room room, Map<String, Object> model) throws Exception {
		System.out.println(room);
		System.out.println(roomDao.updateRoomInfo(room));
		System.out.println(roomDao.selectOne(room.getRoomCode()));
		model.put("roomCode", room.getRoomCode());
		return "redirect:detail.temp";
	}

	@RequestMapping(value = "/oneRoom", method = RequestMethod.POST)
	public @ResponseBody Room oneRoom(@RequestBody Room room) throws Exception {
		Room rm = roomDao.selectOne(room.getRoomCode());
		return rm;
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(RoomImgInfo roomImgInfo, @RequestParam MultipartFile img,
			Device device, Map<String, Object> model) throws Exception {
		// 첨부파일만 따로 저장, 나머지는 해당 bean setter에 자동 바인드됨
		roomImgInfo.setRoomImg(uploadFileUtils.saveUploadFile(img));

		roomDao.insertRoomImg(roomImgInfo);
		model.put("roomCode", roomImgInfo.getRoomCode());
		return "redirect:detail.temp";
	}

	@RequestMapping(value = "/del", method = RequestMethod.POST)
	public String del(RoomImgInfo roomImgInfo, Map<String, Object> model)
			throws Exception {
		// 첨부파일만 따로 저장, 나머지는 해당 bean setter에 자동 바인드됨

		roomDao.deleteRoomImg(roomImgInfo);
		model.put("roomCode", roomImgInfo.getRoomCode());
		return "redirect:detail.temp";
	}

	@RequestMapping(value = "/delRoom", method = RequestMethod.POST)
	public String delRoom(Room room, Map<String, Object> model)
			throws Exception {
		// 첨부파일만 따로 저장, 나머지는 해당 bean setter에 자동 바인드됨

		roomDao.deleteRoom(room.getRoomCode());
		roomDao.deleteRoomImgforRoomCode(room.getRoomCode());
		
		return "redirect:list.temp";
	}

	@RequestMapping(value = "/addRoom", method = RequestMethod.POST)
	public String addRoom(Room room) throws Exception {
		// 첨부파일만 따로 저장, 나머지는 해당 bean setter에 자동 바인드됨
		roomDao.insertRoom(room);

		return "redirect:list.temp";
	}
}
