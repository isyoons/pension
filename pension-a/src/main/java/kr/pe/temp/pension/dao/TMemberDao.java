package kr.pe.temp.pension.dao;

import kr.pe.temp.pension.vo.TMember;

public interface TMemberDao {
	int exist(TMember tMember) throws Exception;
	int update(TMember tMember) throws Exception;
	int updatePw(String password) throws Exception;
	String getMd5Pw(String password) throws Exception;
}
