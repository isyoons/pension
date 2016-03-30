package kr.pe.temp.pension.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import kr.pe.temp.pension.vo.Reservation;
import kr.pe.temp.pension.vo.ResveRoomInfo;
import kr.pe.temp.pension.vo.ResveStatusInfo;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MySqlReservationDao implements ReservationDao {
	SqlSessionFactory sqlSessionFactory;

	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}

	@Override
	public List<ResveStatusInfo> selectListResveStatus(Map<String, Object> map)
			throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {

			return sqlSession
					.selectList(
							"kr.pe.temp.pension.dao.ReservationDao.selectListResveStatus",
							map);
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public List<Reservation> selectTest(Map<String, Object> map)
			throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {

			return sqlSession.selectList(
					"kr.pe.temp.pension.dao.ReservationDao.selectTest", map);
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public ResveStatusInfo selectListResveStatusOneday(Map<String, Object> map)
			throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {

			return sqlSession
					.selectOne(
							"kr.pe.temp.pension.dao.ReservationDao.selectListResveStatusOneday",
							map);
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public List<Reservation> insertResveInfo(Reservation reservation)
			throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {

			return sqlSession.selectList(
					"kr.pe.temp.pension.dao.ReservationDao.insertResveInfo",
					reservation);
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public List<ResveRoomInfo> insertResveRoomInfo(ResveRoomInfo resveRoomInfo)
			throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {

			return sqlSession
					.selectList(
							"kr.pe.temp.pension.dao.ReservationDao.insertResveRoomInfo",
							resveRoomInfo);
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public int selectMaxResveCode() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return sqlSession
					.selectOne("kr.pe.temp.pension.dao.ReservationDao.selectMaxResveCode");
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public List<Reservation> selectResveInfo(String phoneNumber)
			throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return sqlSession.selectList(
					"kr.pe.temp.pension.dao.ReservationDao.selectResveInfo",
					phoneNumber);
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public List<ResveRoomInfo> selectResveRoomInfo(int resveCode)
			throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return sqlSession
					.selectList(
							"kr.pe.temp.pension.dao.ReservationDao.selectResveRoomInfo",
							resveCode);
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public Reservation selectResveInfo2(int resveCode) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return sqlSession.selectOne(
					"kr.pe.temp.pension.dao.ReservationDao.selectResveInfo2",
					resveCode);
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public int deleteResveInfo(int resveCode) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			int result = sqlSession.delete(
					"kr.pe.temp.pension.dao.ReservationDao.deleteResveInfo",
					resveCode);
			if (result > 0)
				sqlSession.commit();
			return result;
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public int deleteResveRoomInfo(int resveCode) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			int result = sqlSession
					.delete("kr.pe.temp.pension.dao.ReservationDao.deleteResveRoomInfo",
							resveCode);
			if (result > 0)
				sqlSession.commit();
			return result;
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public List<ResveStatusInfo> insertResveStatusInfo(
			ResveStatusInfo resveStatusInfo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {

			return sqlSession
					.selectList(
							"kr.pe.temp.pension.dao.ReservationDao.insertResveStatusInfo",
							resveStatusInfo);
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public int deleteResveStatusInfo(int resveCode) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			int result = sqlSession
					.delete("kr.pe.temp.pension.dao.ReservationDao.deleteResveStatusInfo",
							resveCode);
			if (result > 0)
				sqlSession.commit();
			return result;
		} finally {
			sqlSession.close();
		}
	}

}
