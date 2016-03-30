package kr.pe.temp.pension.controls;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import kr.pe.temp.pension.dao.GalleryDao;
import kr.pe.temp.pension.dao.RoomDao;
import kr.pe.temp.pension.util.PagingUtils;
import kr.pe.temp.pension.util.UploadFileUtils;
import kr.pe.temp.pension.vo.Gallery;
import kr.pe.temp.pension.vo.Room;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

	GalleryDao galleryDao;
	RoomDao roomDao;
	@Resource(name = "uploadFileUtils")
	UploadFileUtils uploadFileUtils;

	@Resource(name = "pagingUtils")
	PagingUtils pagingUtils;

	@Autowired
	public MainController setGalleryDao(GalleryDao galleryDao) {
		this.galleryDao = galleryDao;
		return this;
	}

	@Autowired
	public MainController setRoomDao(RoomDao roomDao) {
		this.roomDao = roomDao;
		return this;
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String goMain(Map<String, Object> paramMap,
			Map<String, Object> model, HttpServletRequest req) throws Exception {
		// board data
		// reservation data
		// etc ..
		ServletContext sc = req.getServletContext();
		if (sc.getAttribute("roomCodeList") == null) {
			List<Room> roomList = roomDao.selectList();
			List<String[]> roomCodeList = new ArrayList<String[]>();
			for (Room room : roomList) {
				roomCodeList.add(new String[] { room.getRoomCode(),
						room.getRoomName() });
			}
			sc.setAttribute("roomCodeList", roomCodeList);
		}
		int totalCount = galleryDao.selectTotalCount();
		List<Gallery> galList = new ArrayList<>();
		if (totalCount > 0) {
			paramMap.put("beginIndex", 0);
			paramMap.put("endIndex", 3);
			galList = galleryDao.selectList(paramMap);
			galList = uploadFileUtils
					.settingUploadImgPathForGalleryList(galList);
		}
		model.put("galList", galList);

		return "main.jsp";
	}
	@RequestMapping(value = "/App/main", method = RequestMethod.GET)
	public String goAppMain(Map<String, Object> paramMap,
			Map<String, Object> model, HttpServletRequest req) throws Exception {
		// board data
		// reservation data
		// etc ..
		ServletContext sc = req.getServletContext();
		if (sc.getAttribute("roomCodeList") == null) {
			List<Room> roomList = roomDao.selectList();
			List<String[]> roomCodeList = new ArrayList<String[]>();
			for (Room room : roomList) {
				roomCodeList.add(new String[] { room.getRoomCode(),
						room.getRoomName() });
			}
			sc.setAttribute("roomCodeList", roomCodeList);
		}
		int totalCount = galleryDao.selectTotalCount();
		List<Gallery> galList = new ArrayList<>();
		if (totalCount > 0) {
			paramMap.put("beginIndex", 0);
			paramMap.put("endIndex", 3);
			galList = galleryDao.selectList(paramMap);
			galList = uploadFileUtils
					.settingUploadImgPathForGalleryList(galList);
		}
		model.put("galList", galList);

		return "mMain.jsp";
	}
}
