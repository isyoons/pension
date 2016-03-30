package kr.pe.temp.pension.dao;

import kr.pe.temp.pension.vo.TMember;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MySqlTMemberDao implements TMemberDao {
	SqlSessionFactory sqlSessionFactory;
	
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}

	@Override
	public int exist(TMember tMember) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return sqlSession.selectOne("kr.pe.temp.pension.dao.TMemberDao.exist", tMember);
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public int update(TMember tMember) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			int result = sqlSession.update("kr.pe.temp.pension.dao.TMemberDao.update", tMember);
			if(result > 0)
				sqlSession.commit();
			return result;
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public int updatePw(String password) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			int result = sqlSession.update("kr.pe.temp.pension.dao.TMemberDao.updatePw", password);
			if(result > 0)
				sqlSession.commit();
			return result;
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public String getMd5Pw(String password) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return sqlSession.selectOne("kr.pe.temp.pension.dao.TMemberDao.getMd5Pw", password);
		} finally {
			sqlSession.close();
		}	
	}
	
	
}
