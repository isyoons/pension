package kr.pe.temp.pension.dao;

import java.util.List;
import java.util.Map;

import kr.pe.temp.pension.vo.Board;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MySqlBoardDao implements BoardDao {
	SqlSessionFactory sqlSessionFactory;

	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}

	@Override
	public List<Board> selectList(Map<String, Object> map) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return sqlSession.selectList(
					"kr.pe.temp.pension.dao.BoardDao.selectList", map);
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public Board selectBoard(int num) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return sqlSession.selectOne(
					"kr.pe.temp.pension.dao.BoardDao.selectBoard", num);
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public int insertBoard(Board board) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			int result = sqlSession.insert("kr.pe.temp.pension.dao.BoardDao.insertBoard", board); 
			if(result > 0) sqlSession.commit();
			return result;
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public int deleteBoard(Board board) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			int result = sqlSession.delete("kr.pe.temp.pension.dao.BoardDao.deleteBoard", board); 
			if(result > 0) sqlSession.commit();
			return result;
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public int updateCount(int no) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			int result = sqlSession.update("kr.pe.temp.pension.dao.BoardDao.updateCount", no);
			if(result > 0) sqlSession.commit();
			return result;
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public int selectTotalCount(String bsection) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return sqlSession.selectOne("kr.pe.temp.pension.dao.BoardDao.selectTotalCount", bsection);
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public int updateBoard(Board board) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			int result = sqlSession.update("kr.pe.temp.pension.dao.BoardDao.updateBoard", board);
			if(result > 0) sqlSession.commit();
			return result;
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public Board udtselectBoard(Board board) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return sqlSession.selectOne(
					"kr.pe.temp.pension.dao.BoardDao.udtselectBoard", board);
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public List<Board> selectCoList(Map<String, Object> map) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return sqlSession.selectList(
					"kr.pe.temp.pension.dao.BoardDao.selectCoList", map);
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public int selectCoTotalCount(int num) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return sqlSession.selectOne("kr.pe.temp.pension.dao.BoardDao.selectCoTotalCount", num);
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public int insertComment(Board board) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			int result = sqlSession.insert("kr.pe.temp.pension.dao.BoardDao.insertComment", board); 
			if(result > 0) sqlSession.commit();
			return result;
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public int deleteComment(Board board) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			int result = sqlSession.delete("kr.pe.temp.pension.dao.BoardDao.deleteComment", board); 
			if(result > 0) sqlSession.commit();
			return result;
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public Board selectComment(String cdob) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return sqlSession.selectOne(
					"kr.pe.temp.pension.dao.BoardDao.selectComment", cdob);
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public Board udtCommentSelect(Board board) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return sqlSession.selectOne(
					"kr.pe.temp.pension.dao.BoardDao.udtCommentSelect", board);
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public int updateComment(Board board) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			System.out.println(board);
			return sqlSession.update(
					"kr.pe.temp.pension.dao.BoardDao.updateComment", board);
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public int currentNum(Board board) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return sqlSession.selectOne(
					"kr.pe.temp.pension.dao.BoardDao.currentNum", board);
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public Board threePageNum(Board board) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return sqlSession.selectOne(
					"kr.pe.temp.pension.dao.BoardDao.threePageNum", board);
		} finally {
			sqlSession.close();
		}
	}

}
