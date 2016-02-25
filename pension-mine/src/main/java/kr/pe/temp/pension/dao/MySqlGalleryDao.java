package kr.pe.temp.pension.dao;

import java.util.List;
import java.util.Map;

import kr.pe.temp.pension.vo.Gallery;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MySqlGalleryDao implements GalleryDao {
	SqlSessionFactory sqlSessionFactory;
	
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}

	@Override
	public List<Gallery> selectList(Map<String, Object> paramMap)
			throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return sqlSession.selectList("kr.pe.temp.pension.dao.GalleryDao.selectList", paramMap);
		} finally {
			sqlSession.close();
		}
		
	}

	@Override
	public Gallery selectOne(int no) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return sqlSession.selectOne("kr.pe.temp.pension.dao.GalleryDao.selectOne", no);
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public int insert(Gallery gallery) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			int result = sqlSession.insert("kr.pe.temp.pension.dao.GalleryDao.insert", gallery); 
			if(result > 0) sqlSession.commit();
			return result;
		} finally {
			sqlSession.close();
		}

	}

	@Override
	public int delete(int no) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			int result = sqlSession.delete("kr.pe.temp.pension.dao.GalleryDao.delete", no); 
			if(result > 0) sqlSession.commit();
			return result;
		} finally {
			sqlSession.close();
		}
	}

	@Override
	public int update(Gallery gallery) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			int result = sqlSession.update("kr.pe.temp.pension.dao.GalleryDao.update", gallery); 
			if(result > 0) sqlSession.commit();
			return result;
		} finally {
			sqlSession.close();
		}
	}

}
