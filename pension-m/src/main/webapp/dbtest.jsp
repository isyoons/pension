<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%
	//===================================================
	//디비연결 변수
	//---------------------------------------------------
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	//===================================================
	//쿼리 생성
	String query = " SELECT 'RESULT'";

	try {
		//===================================================
		// Oracle Connection Start
		//---------------------------------------------------
		Context initCtx = new InitialContext();
		DataSource ds = (DataSource) initCtx.lookup("java:comp/env/jdbc/elunian");

		conn = ds.getConnection();
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
		//===================================================
		while (rs.next()) { // 쿼리 결과 보여주기
			String rs_str = rs.getString(1);
			out.println(rs_str);
		}
	} catch (SQLException se) {
		out.println("[CONTENT]쿼리 에러 : SQLException ");
		out.println(se);
	} catch (NullPointerException ne) {
		out.println("[CONTENT]널 에러 : NullPointerException ");
		out.println(ne);
	} catch (Exception e) {
		out.println("[CONTENT]에러 : Exception ");
		out.println(e);
	} finally {
		if (rs != null)
			try {
				rs.close();
			} catch (SQLException ex) {
			}
		if (stmt != null)
			try {
				stmt.close();
			} catch (SQLException ex) {
			}
		if (conn != null)
			try {
				conn.close();
			} catch (SQLException ex) {
			}
	}
%>