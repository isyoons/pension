package kr.pe.temp.pension.dao;

import java.util.List;
import java.util.Map;

import kr.pe.temp.pension.vo.Room;
import kr.pe.temp.pension.vo.RoomImgInfo;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MySqlRoomDao implements RoomDao {
	SqlSessionFactory sqlSessionFactory;

	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}

	@Override
	public List<Room> selectList() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return sqlSession
					.selectList("kr.pe.temp.pension.dao.RoomDao.selectList");
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public Room selectOne(String roomCode) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return sqlSession.selectOne(
					"kr.pe.temp.pension.dao.RoomDao.selectOne", roomCode);
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public List<String> selectRoomImg(String roomCode) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return sqlSession.selectList(
					"kr.pe.temp.pension.dao.RoomDao.selectRoomImg", roomCode);
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public int updateRoomInfo(Room room) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return sqlSession.update(
					"kr.pe.temp.pension.dao.RoomDao.updateRoomInfo", room);
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public int insertRoomImg(RoomImgInfo roomImgInfo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return sqlSession
					.update("kr.pe.temp.pension.dao.RoomDao.insertRoomImg",
							roomImgInfo);
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public int deleteRoomImg(RoomImgInfo roomImgInfo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			int result = sqlSession
					.delete("kr.pe.temp.pension.dao.RoomDao.deleteRoomImg",
							roomImgInfo);
			if (result > 0)
				sqlSession.commit();
			return result;
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public int insertRoom(Room room) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return sqlSession.update(
					"kr.pe.temp.pension.dao.RoomDao.insertRoom", room);
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public int deleteRoom(String roomCode) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return sqlSession.update(
					"kr.pe.temp.pension.dao.RoomDao.deleteRoom", roomCode);
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public int deleteRoomImgforRoomCode(String roomCode) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return sqlSession.update(
					"kr.pe.temp.pension.dao.RoomDao.deleteRoomImgforRoomCode", roomCode);
		} finally {
			sqlSession.close();
		}
	}

}
