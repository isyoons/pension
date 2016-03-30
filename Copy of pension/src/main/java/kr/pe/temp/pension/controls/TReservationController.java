package kr.pe.temp.pension.controls;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.pe.temp.pension.dao.ReservationDao;
import kr.pe.temp.pension.dao.RoomDao;
import kr.pe.temp.pension.util.DetectDeviceUtils;
import kr.pe.temp.pension.util.PagingUtils;
import kr.pe.temp.pension.util.UploadFileUtils;
import kr.pe.temp.pension.vo.Room;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

//@SessionAttributes 적용
@Controller
@SessionAttributes("reservation")
@RequestMapping(value = "/Temp/TReservation")
public class TReservationController {

	private ReservationDao reservationDao;

	@Resource(name = "detectDeviceUtils")
	DetectDeviceUtils detectDeviceUtils;

	@Resource(name = "uploadFileUtils")
	UploadFileUtils uploadFileUtils;

	@Resource(name = "pagingUtils")
	PagingUtils pagingUtils;

	@Autowired
	public TReservationController setReservationDao(
			ReservationDao reservationDao) {
		this.reservationDao = reservationDao;
		return this;
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String roomform(Map<String, Object> model) throws Exception {

		return "list.jsp";
	}
}
