package kr.pe.temp.pension.dao;

import java.util.List;
import java.util.Map;

import kr.pe.temp.pension.vo.Gallery;

public interface GalleryDao {
	
	List<Gallery> selectList(Map<String, Object> paramMap) throws Exception;
	Gallery selectOne(int no) throws Exception;
	int insert(Gallery gallery) throws Exception;
	int delete(int no) throws Exception;
	int update(Gallery gallery) throws Exception;
	
}
