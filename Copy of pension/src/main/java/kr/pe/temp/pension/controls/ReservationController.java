package kr.pe.temp.pension.controls;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.pe.temp.pension.dao.MySqlReservationDao;
import kr.pe.temp.pension.dao.ReservationDao;
import kr.pe.temp.pension.dao.RoomDao;
import kr.pe.temp.pension.vo.Reservation;
import kr.pe.temp.pension.vo.ResveRoomInfo;
import kr.pe.temp.pension.vo.ResveStatusInfo;
import kr.pe.temp.pension.vo.Room;
import kr.pe.temp.pension.vo.RoomImgInfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = { "/reservation" })
public class ReservationController {

	RoomDao roomDao;
	ReservationDao reservationDao;
	MySqlReservationDao mySqlReservationDao;

	@Autowired
	public ReservationController setReservationDao(ReservationDao reservationDao) {
		this.reservationDao = reservationDao;
		return this;
	}

	@Autowired
	public ReservationController setRoomDao(RoomDao roomDao) {
		this.roomDao = roomDao;
		return this;
	}

	@RequestMapping(value = "/guide/guide.temp", method = RequestMethod.GET)
	public String guide(Map<String, Object> model) throws Exception {
		List<Room> roomInfos = roomDao.selectList();
		model.put("roomInfos", roomInfos);

		return "guide.jsp";
	}

	@RequestMapping(value = "/realtime/status_reservation", method = RequestMethod.GET)
	public String statusReservation(Map<String, Object> model) throws Exception {
		Calendar startDay = Calendar.getInstance();
		Calendar endDay = Calendar.getInstance();
		Calendar today = Calendar.getInstance();
		today.set(today.get(Calendar.YEAR), today.get(Calendar.MONTH),
				today.get(Calendar.DATE), 0, 0, 0);
		startDay.set(today.get(Calendar.YEAR), today.get(Calendar.MONTH), 1, 0,
				0, 0);
		endDay.set(startDay.get(Calendar.YEAR),
				(startDay.get(Calendar.MONTH) + 1), 1, 0, 0, 0);
		endDay.add(Calendar.DATE, -1);
		List<ResveStatusInfo> resveStatusInfo = null;
		List<Map<String, Object>> resveStatusList = null;
		List<Room> roomList = roomDao.selectList();
		List<String[]> roomCodeList = new ArrayList<String[]>();
		for (Room room : roomList) {
			roomCodeList.add(new String[] { room.getRoomCode(),
					room.getRoomName() });
		}
		if (endDay.compareTo(today) < 0) {
			model.put("output", 100);
		} else if (today.compareTo(startDay) > 0) {
			model.put("output", today.get(Calendar.DATE));
			Map<String, Object> map = new HashMap();
			map.put("beginDate", today.getTime());
			map.put("endDate", endDay.getTime());
			resveStatusInfo = new ArrayList();
			resveStatusList = new ArrayList<Map<String, Object>>();
			for (Room room : roomList) {
				if (map.containsKey("roomCode")) {
					map.remove("roomCode");
				}
				map.put("roomCode", room.getRoomCode());
				resveStatusInfo = reservationDao.selectListResveStatus(map);
				System.out.println(resveStatusInfo);
				if (resveStatusInfo != null) {
					Map<String, Object> noMap = new HashMap<String, Object>();
					for (ResveStatusInfo rsi : resveStatusInfo) {
						noMap.put("a" + rsi.getResveDay().getDate(),
								rsi.getResveStatus());
					}

					resveStatusList.add(noMap);

				} else {
					resveStatusList.add(new HashMap<String, Object>());
				}
			}
		} else {
			model.put("output", 0);
			Map<String, Object> map = new HashMap();
			map.put("beginDate", startDay.getTime());
			map.put("endDate", endDay.getTime());
			resveStatusList = new ArrayList<Map<String, Object>>();
			for (Room room : roomList) {
				if (map.containsKey("roomCode")) {
					map.remove("roomCode");
				}
				map.put("roomCode", room.getRoomCode());
				resveStatusInfo = reservationDao.selectListResveStatus(map);
				if (resveStatusInfo != null) {
					Map<String, Object> noMap = new HashMap<String, Object>();
					for (ResveStatusInfo rsi : resveStatusInfo) {
						noMap.put("a" + rsi.getResveDay().getDate(),
								rsi.getResveStatus());
					}
					resveStatusList.add(noMap);
				} else {
					resveStatusList.add(new HashMap<String, Object>());
				}
			}
		}
		System.out.println("list : " + resveStatusList);
		model.put("index", startDay.get(Calendar.DAY_OF_WEEK));
		model.put("year", startDay.get(Calendar.YEAR));
		model.put("month", (startDay.get(Calendar.MONTH) + 1));
		model.put("maxdate", endDay.get(Calendar.DATE));
		model.put("resveStatusList", resveStatusList);
		model.put("roomCodeNum", roomCodeList.size());
		model.put("roomCodeList", roomCodeList);

		return "status_reservation.jsp";
	}

	@RequestMapping(value = "/realtime/status_reservation", method = RequestMethod.POST)
	public String statusReservation(@RequestParam Map<String, Object> param,
			Map<String, Object> model) throws Exception {
		Calendar startDay = Calendar.getInstance();
		Calendar endDay = Calendar.getInstance();
		Calendar today = Calendar.getInstance();
		if (param.get("sYear") != null) {
			today.set(today.get(Calendar.YEAR), today.get(Calendar.MONTH),
					today.get(Calendar.DATE), 0, 0, 0);
			startDay.set(Integer.parseInt((String) param.get("sYear")),
					Integer.parseInt((String) param.get("sMonth")) - 1, 1, 0,
					0, 0);
			endDay.set(Integer.parseInt((String) param.get("sYear")),
					Integer.parseInt((String) param.get("sMonth")), 1, 0, 0, 0);
			endDay.add(Calendar.DATE, -1);
		} else {
			startDay.set(today.get(Calendar.YEAR), today.get(Calendar.MONTH),
					1, 0, 0, 0);
			endDay.set(today.get(Calendar.YEAR), today.get(Calendar.MONTH) + 1,
					1, 0, 0, 0);
			endDay.add(Calendar.DATE, -1);

		}
		List<ResveStatusInfo> resveStatusInfo = null;
		List<Map<String, Object>> resveStatusList = null;
		List<Room> roomList = roomDao.selectList();
		List<String[]> roomCodeList = new ArrayList<String[]>();
		for (Room room : roomList) {
			roomCodeList.add(new String[] { room.getRoomCode(),
					room.getRoomName() });
		}
		if (endDay.compareTo(today) < 0) {
			model.put("output", 100);
		} else if (today.compareTo(startDay) > 0) {

			model.put("output", today.get(Calendar.DATE));
			Map<String, Object> map = new HashMap();

			map.put("beginDate", today.getTime());
			map.put("endDate", endDay.getTime());
			resveStatusList = new ArrayList<Map<String, Object>>();
			for (Room room : roomList) {
				if (map.containsKey("roomCode")) {
					map.remove("roomCode");
				}
				map.put("roomCode", room.getRoomCode());
				resveStatusInfo = reservationDao.selectListResveStatus(map);
				if (resveStatusInfo != null) {
					Map<String, Object> noMap = new HashMap<String, Object>();
					for (ResveStatusInfo rsi : resveStatusInfo) {
						noMap.put("a" + rsi.getResveDay().getDate(),
								rsi.getResveStatus());
					}

					resveStatusList.add(noMap);
				} else {
					resveStatusList.add(new HashMap<String, Object>());
				}
			}
		} else {
			model.put("output", 0);
			Map<String, Object> map = new HashMap();
			map.put("beginDate", startDay.getTime());
			map.put("endDate", endDay.getTime());

			resveStatusInfo = new ArrayList();

			resveStatusList = new ArrayList<Map<String, Object>>();
			for (Room room : roomList) {
				if (map.containsKey("roomCode")) {
					map.remove("roomCode");
				}
				map.put("roomCode", room.getRoomCode());
				resveStatusInfo = reservationDao.selectListResveStatus(map);
				if (resveStatusInfo != null) {
					Map<String, Object> noMap = new HashMap<String, Object>();
					for (ResveStatusInfo rsi : resveStatusInfo) {
						noMap.put("a" + new Long(rsi.getResveDay().getDate()),
								rsi.getResveStatus());
					}
					resveStatusList.add(noMap);
				} else {
					resveStatusList.add(new HashMap<String, Object>());
				}
			}
		}
		System.out.println("list : " + resveStatusList);
		model.put("index", startDay.get(Calendar.DAY_OF_WEEK));
		model.put("year", startDay.get(Calendar.YEAR));
		model.put("month", (startDay.get(Calendar.MONTH) + 1));
		model.put("maxdate", endDay.get(Calendar.DATE));
		model.put("resveStatusList", resveStatusList);
		model.put("roomCodeNum", roomCodeList.size());
		model.put("roomCodeList", roomCodeList);

		return "status_reservation.jsp";
	}

	@RequestMapping(value = "/realtime/make_reservation_1", method = RequestMethod.GET)
	public String makeReservation1(@RequestParam Map<String, Object> param,
			Map<String, Object> model, HttpSession session) throws Exception {
		Calendar cal = Calendar.getInstance();
		Calendar endDay = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		endDay.set(cal.get(Calendar.YEAR), (cal.get(Calendar.MONTH) + 1), 1);
		endDay.add(Calendar.DATE, -1);
		model.put("endDate", endDay.get(Calendar.DATE));
		Date date = cal.getTime();
		List<Room> roomInfos = roomDao.selectList();
		model.put("sDate", date);
		
		model.put("sPeriod", 1);
		for (int i = roomInfos.size() - 1; i >= 0; i--) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("roomCode", roomInfos.get(i).getRoomCode());
			map.put("oneDay", sdf.format(cal.getTime()));
			if (reservationDao.selectListResveStatusOneday(map) != null) {
				roomInfos.remove(i);
			}
		}
		model.put("roomInfos", roomInfos);

		return "make_reservation_1.jsp";
	}

	@RequestMapping(value = "/realtime/make_reservation_1", method = RequestMethod.POST)
	public String makeReservation1Post(@RequestParam Map<String, Object> param,
			Map<String, Object> model, HttpSession session) throws Exception {
		if (param.get("sRoomCode") != null) {
			model.put("checkedroomCode", param.get("sRoomCode"));
		}
		Calendar cal = Calendar.getInstance();
		Calendar endDay = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if (param.get("sYear") != null) {
			cal.set(Calendar.YEAR,
					Integer.parseInt((String) param.get("sYear")));
			cal.set(Calendar.MONTH,
					Integer.parseInt((String) param.get("sMonth")) - 1);
			cal.set(Calendar.DATE, Integer.parseInt((String) param.get("sDay")));
		}
		endDay.set(cal.get(Calendar.YEAR), (cal.get(Calendar.MONTH) + 1), 1);
		endDay.add(Calendar.DATE, -1);
		model.put("endDate", endDay.get(Calendar.DATE));

		Date date = cal.getTime();
		List<Room> roomInfos = roomDao.selectList();
		model.put("sDate", date);
		model.put("sPeriod", param.get("sPeriod"));

		Calendar cal2 = Calendar.getInstance();
		cal2.setTime(cal.getTime());

		if (sdf.format(date).compareTo(sdf.format(new Date())) < 0) {

		} else {
			if (param.get("sPeriod") == null) {
				for (int i = roomInfos.size() - 1; i >= 0; i--) {
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("oneDay", sdf.format(cal.getTime()));
					map.put("roomCode", roomInfos.get(i).getRoomCode());
					if (reservationDao.selectListResveStatusOneday(map) != null) {
						roomInfos.remove(i);
					}
				}
			} else {
				if (Integer.parseInt(String.valueOf(param.get("sPeriod"))) != 1) {
					for (int i = roomInfos.size() - 1; i >= 0; i--) {
						Map<String, Object> map = new HashMap();
						map.put("beginDate", sdf.format(cal.getTime()));

						cal2.add(Calendar.DATE,
								Integer.parseInt((String) param.get("sPeriod")));
						map.put("endDate", sdf.format(cal2.getTime()));

						map.put("roomCode", roomInfos.get(i).getRoomCode());
						if (reservationDao.selectListResveStatus(map).size() != 0) {
							roomInfos.remove(i);
						}
					}
				} else {
					for (int i = roomInfos.size() - 1; i >= 0; i--) {
						Map<String, Object> map = new HashMap<String, Object>();
						map.put("oneDay", sdf.format(cal.getTime()));
						map.put("roomCode", roomInfos.get(i).getRoomCode());
						if (reservationDao.selectListResveStatusOneday(map) != null) {
							roomInfos.remove(i);
						}
					}
				}
			}
			model.put("roomInfos", roomInfos);

		}

		return "make_reservation_1.jsp";
	}

	@RequestMapping(value = "/realtime/make_reservation_2", method = RequestMethod.POST)
	public String makeReservation2post(@RequestParam Map<String, Object> param,
			Map<String, Object> model, HttpSession session) throws Exception {

		int totalNum = 0; // 총 인원
		int totalCount = 0; // 총 추가인원
		int month = 0;
		int totalService = 0; // 총 부가서비스 가격
		int roomPrice = 0; // 방 가격
		int totalPrice = 0; // 총 결제액
		int day = 0;
		int date1 = 0;
		
		List<Room> roomInfos = roomDao.selectList();
		List<Map<String, Object>> resveInfo = new ArrayList<Map<String, Object>>();

		int sPeriod = Integer.parseInt((String) param.get("sPeriod"));
		session.setAttribute("sPeriod", param.get("sPeriod"));
		Calendar cal = Calendar.getInstance();
		cal.set(Integer.parseInt((String) param.get("sYear")),
				Integer.parseInt((String) param.get("sMonth")) - 1,
				Integer.parseInt((String) param.get("sDay")));
		session.setAttribute("beginDate", cal.getTime());
		cal.add(Calendar.DATE, sPeriod);
		session.setAttribute("endDate", cal.getTime());
		for (Room room : roomInfos) {
			if (param.get("roomCheck" + room.getRoomCode()) != null) {

				int roomTotalPrice = 0; // 방 요금 합계액

				List<Map<String, Object>> dayPrice = new ArrayList<Map<String, Object>>();

				Calendar cal1 = Calendar.getInstance();
				cal1.set(Integer.parseInt((String) param.get("sYear")),
						Integer.parseInt((String) param.get("sMonth")) - 1,
						Integer.parseInt((String) param.get("sDay")));

				Map<String, Object> map = new HashMap<String, Object>();

				map.put("roomCode", room.getRoomCode());
				map.put("roomName", room.getRoomName());
				map.put("count", param.get("count" + room.getRoomCode()));
				map.put("stdNum", room.getStdNum());

				month = Integer.parseInt((String) param.get("sMonth")) - 1;

				totalNum += room.getStdNum()
						+ Integer.parseInt((String) param.get("count"
								+ room.getRoomCode()));
				totalCount += Integer.parseInt((String) param.get("count"
						+ room.getRoomCode()));

				totalService = Integer.parseInt((String) param
						.get("addService")) * 15000;

				for (int i = 0; i < sPeriod; i++) {

					roomPrice = 0;

					Map<String, Object> map1 = new HashMap<String, Object>();

					date1 = cal1.get(Calendar.DAY_OF_WEEK);

					if (month < 7 || month > 8) {
						// 비수기
						map1.put("season", "비수기");

						if (date1 == 6) {
							// 비수기 금요일
							map1.put("date", "금요일");

							roomPrice += room.getLowSeasonFridayPrice();
							map1.put("roomPrice",
									room.getLowSeasonFridayPrice());

						} else if ((date1 == 1) || (date1 == 7)) {
							// 비수기 주말
							map1.put("date", "주말");

							roomPrice += room.getLowSeasonWeekendPrice();
							map1.put("roomPrice",
									room.getLowSeasonWeekendPrice());
						} else {
							// 비수기 주중
							map1.put("date", "평일");

							roomPrice += room.getLowSeasonWeekdayPrice();
							map1.put("roomPrice",
									room.getLowSeasonWeekdayPrice());
						}

					} else {
						if ((month == 7) && (15 <= day && day <= 31)) {
							// 성수기
							map1.put("season", "성수기");

							if ((date1 == 1) || (date1 == 7)) {
								// 성수기 주말
								map1.put("date", "주말");

								map1.put("roomPrice",
										room.getHighSeasonWeekendPrice());
								roomPrice += room.getHighSeasonWeekendPrice();
							} else {
								// 성수기 주중
								map1.put("date", "평일");

								map1.put("roomPrice",
										room.getHighSeasonWeekendPrice());
								roomPrice += room.getHighSeasonWeekendPrice();
							}

						} else {
							// 준성수기
							map1.put("season", "준성수기");

							if ((date1 == 1) || (date1 == 7)) {
								// 준성수기 주말
								map1.put("date", "주말");

								map1.put("roomPrice",
										room.getMiddleSeasonWeekendPrice());
								roomPrice += room.getMiddleSeasonWeekendPrice();
							} else {
								// 준성수기 주중
								map1.put("date", "평일");

								map1.put("roomPrice",
										room.getMiddleSeasonWeekdayPrice());
								roomPrice += room.getMiddleSeasonWeekdayPrice();
							}
						}

					}
					map1.put("ymd", cal1.getTime());
					dayPrice.add(map1);
					cal1.add(Calendar.DATE, 1);
					roomTotalPrice += roomPrice;
				}
				map.put("dayPrice", dayPrice);
				map.put("roomTotalPrice", roomTotalPrice);
				totalPrice += roomTotalPrice;
				resveInfo.add(map);
			}
		}
		totalPrice += totalService;

		model.put("totalNum", totalNum);
		model.put("totalCount", totalCount);
		model.put("totalService", totalService);
		model.put("roomPrice", roomPrice);
		model.put("totalPrice", totalPrice);

		model.put("resveInfo", resveInfo);

		model.put("sPeriod", param.get("s_period"));

		model.put("addService", param.get("addService"));

		session.setAttribute("sPeriod", param.get("sPeriod"));
		session.setAttribute("resveInfo", resveInfo);
		session.setAttribute("totalNum", totalNum);
		session.setAttribute("totalCount", totalCount);
		session.setAttribute("totalPrice", totalPrice);

		return "make_reservation_2.jsp";
	}

	@RequestMapping(value = "/realtime/make_reservation_3", method = RequestMethod.POST)
	public String makeReservation3post(@RequestParam Map<String, Object> param,
			Map<String, Object> model, HttpSession session) throws Exception {
		model.put("i_name", param.get("i_name"));
		model.put("i_phone", param.get("i_phone"));

		session.setAttribute("i_name", param.get("i_name"));
		session.setAttribute("i_phone", param.get("i_phone"));
		session.setAttribute("etc", param.get("etc"));

		return "make_reservation_3.jsp";
	}

	@RequestMapping(value = "/realtime/make_reservation_4", method = RequestMethod.POST)
	public String makeReservation4post(@RequestParam Map<String, Object> param,
			Map<String, Object> model, HttpSession session) throws Exception {
		model.put("pay_user", param.get("pay_user"));
		session.setAttribute("pay_user", param.get("pay_user"));

		return "make_reservation_4.jsp";
	}

	@RequestMapping(value = "/realtime/add", method = RequestMethod.POST)
	public String add(@RequestParam Map<String, Object> param,
			Map<String, Object> model, Reservation reservation,
			ResveRoomInfo resveRoomInfo, ResveStatusInfo resveStatusInfo,
			HttpSession session) throws Exception {

		List<Map<String, Object>> list = (List<Map<String, Object>>) session
				.getAttribute("resveInfo");

		// reservation 테이블 데이터
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		reservation.setTotalResveNum(Integer.parseInt((String.valueOf(session
				.getAttribute("totalNum")))));

		reservation.setResveCtm((String) session.getAttribute("i_name"));
		reservation.setPayCtm((String) session.getAttribute("pay_user"));
		reservation.setPhoneNumber((String) session.getAttribute("i_phone"));
		reservation.setResveDay(cal.getTime());
		reservation.setResvePd(Integer.parseInt((String.valueOf(session
				.getAttribute("sPeriod")))));

		reservation.setPayAmount(Integer.parseInt((String.valueOf(session
				.getAttribute("totalPrice")))));
		reservation.setIsDeposit(0);
		reservation.setEtc((String) session.getAttribute("etc"));

		reservationDao.insertResveInfo(reservation);

		for (Map<String, Object> map : list) {

			// resveRoomInfo 테이블 데이터
			int maxResveCode = reservationDao.selectMaxResveCode();

			resveRoomInfo.setResveCode(maxResveCode);
			resveRoomInfo.setRoomCode((String) map.get("roomCode"));
			resveRoomInfo.setRoomName((String) map.get("roomName"));
			resveRoomInfo.setResveNum(Integer.parseInt(String.valueOf(map
					.get("count")))
					+ Integer.parseInt(String.valueOf(map.get("stdNum"))));
			resveRoomInfo.setResvePd(Integer.parseInt((String) session
					.getAttribute("sPeriod")));

			resveRoomInfo.setStayBeginDay((Date) session
					.getAttribute("beginDate"));

			resveRoomInfo.setStayEndDay((Date) session.getAttribute("endDate"));

			reservationDao.insertResveRoomInfo(resveRoomInfo);

			int sPeriod = Integer.parseInt((String) session
					.getAttribute("sPeriod"));

			Calendar cal3 = Calendar.getInstance();
			Date date = (Date) session.getAttribute("beginDate");
			cal3.setTime(date);

			for (int i = 0; i < sPeriod; i++) {
				resveStatusInfo.setRoomcode((String) map.get("roomCode"));

				resveStatusInfo.setResveDay(cal3.getTime());
				cal3.add(Calendar.DATE, 1);

				resveStatusInfo.setResveStatus(1);
				reservationDao.insertResveStatusInfo(resveStatusInfo);
			}
		}

		return "redirect:status_reservation.temp";
	}

	@RequestMapping(value = "/guide/oneImg", method = RequestMethod.POST)
	public @ResponseBody RoomImgInfo one(@RequestBody RoomImgInfo roomImgInfo,
			Map<String, Object> model) throws Exception {
		RoomImgInfo imgInfo = new RoomImgInfo();
		imgInfo.setRoomCode(roomImgInfo.getRoomCode());
		imgInfo.setRoomImg(roomDao.selectRoomImg(roomImgInfo.getRoomCode())
				.get(0));
		// gal.setUploadImgPath(uploadFileUtils.getUploadImgPath(gal.getUploadImg()));
		return imgInfo;
	}

	@RequestMapping(value = "/realtime/oneRoomImgList", method = RequestMethod.POST)
	public @ResponseBody String oneRoomImgList(
			@RequestBody RoomImgInfo roomImgInfo, Map<String, Object> model)
			throws Exception {
		RoomImgInfo imgInfo = new RoomImgInfo();
		imgInfo.setRoomCode(roomImgInfo.getRoomCode());
		List<String> roomImgs = roomDao
				.selectRoomImg(roomImgInfo.getRoomCode());
		model.put("roomImgs", roomImgs);
		// gal.setUploadImgPath(uploadFileUtils.getUploadImgPath(gal.getUploadImg()));
		return "modalbody.jsp";
	}

	@RequestMapping(value = "/realtime/confirm_cancel", method = RequestMethod.POST)
	public @ResponseBody List<Reservation> confirm_cancel(
			@RequestBody Reservation reservation, Map<String, Object> model,
			HttpSession session) throws Exception {

		List<Reservation> resveList = reservationDao
				.selectResveInfo(reservation.getPhoneNumber());

		System.out.println(resveList);

		return resveList;
	}

	@RequestMapping(value = "/realtime/confirm_cancel2", method = RequestMethod.POST)
	public String confirm_cancel2(@RequestParam Map<String, Object> param,
			Reservation reservation, Map<String, Object> model,
			ResveRoomInfo resveRoomInfo, HttpSession session) throws Exception {

		Reservation resveInfoList = reservationDao.selectResveInfo2(Integer
				.parseInt((String) param.get("resveCode")));

		List<ResveRoomInfo> resveRoomList = reservationDao
				.selectResveRoomInfo(Integer.parseInt((String) param
						.get("resveCode")));

		model.put("resveRoomList", resveRoomList);
		model.put("resveInfoList", resveInfoList);

		session.setAttribute("resveCode", param.get("resveCode"));

		return "confirm_cancel.jsp";
	}

	@RequestMapping(value = "/realtime/delete", method = RequestMethod.POST)
	public String delete(@RequestParam Map<String, Object> param,
			Map<String, Object> model, Reservation reservation,
			ResveRoomInfo resveRoomInfo, ResveStatusInfo resveStatusInfo,
			HttpSession session) throws Exception {

		int resveCode = Integer.parseInt((String) session
				.getAttribute("resveCode"));

		reservationDao.deleteResveStatusInfo(resveCode);

		reservationDao.deleteResveRoomInfo(resveCode);

		reservationDao.deleteResveInfo(resveCode);

		return "status_reservation.temp";
	}
}