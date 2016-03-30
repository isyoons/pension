package kr.pe.temp.pension.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import kr.pe.temp.pension.vo.Reservation;
import kr.pe.temp.pension.vo.ResveRoomInfo;
import kr.pe.temp.pension.vo.ResveStatusInfo;

public interface ReservationDao {
	List<ResveStatusInfo> selectListResveStatus(Map<String, Object> map)
			throws Exception;

	ResveStatusInfo selectListResveStatusOneday(Map<String, Object> map)
			throws Exception;

	List<Reservation> selectTest(Map<String, Object> map) throws Exception;

	List<Reservation> insertResveInfo(Reservation reservation) throws Exception;

	List<ResveRoomInfo> insertResveRoomInfo(ResveRoomInfo resveRoomInfo)
			throws Exception;

	int selectMaxResveCode() throws Exception;

	List<Reservation> selectResveInfo(String phoneNumber) throws Exception;

	List<ResveRoomInfo> selectResveRoomInfo(int resveCode) throws Exception;

	Reservation selectResveInfo2(int resveCode) throws Exception;

	int deleteResveInfo(int resveCode) throws Exception;

	int deleteResveRoomInfo(int resveCode) throws Exception;

	List<ResveStatusInfo> insertResveStatusInfo(ResveStatusInfo resveStatusInfo)
			throws Exception;
	
	int deleteResveStatusInfo(int resveCode) throws Exception;
}
