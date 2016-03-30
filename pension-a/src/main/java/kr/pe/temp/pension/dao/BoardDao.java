package kr.pe.temp.pension.dao;

import java.util.List;
import java.util.Map;

import kr.pe.temp.pension.vo.Board;
import kr.pe.temp.pension.vo.Gallery;

public interface BoardDao {
	List<Board> selectList(Map<String, Object> map) throws Exception;
	Board selectBoard(int num) throws Exception;
	int insertBoard(Board board) throws Exception;
	int deleteBoard(Board board) throws Exception;
	int updateCount(int no) throws Exception;
	int selectTotalCount(String bsection) throws Exception;
	int updateBoard(Board board) throws Exception;
	Board udtselectBoard(Board board) throws Exception;
	int currentNum(Board board) throws Exception;
	Board threePageNum(Board board) throws Exception;
	
	//댓글
	List<Board> selectCoList(Map<String, Object> map) throws Exception;
	int selectCoTotalCount(int num) throws Exception;
	int insertComment(Board board) throws Exception;
	int deleteComment(Board board) throws Exception;
	Board selectComment(String cdob) throws Exception;
	Board udtCommentSelect(Board board) throws Exception;
	int updateComment(Board board) throws Exception;
}
