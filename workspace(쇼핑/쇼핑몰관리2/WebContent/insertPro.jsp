<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="dbcon.jsp" %> 
<%
//회원등록이 되면 표에 등록되는 과정을 pro에 작성
try{
	sql = "insert into member values(?,?,?,?,?,?,?,?)"; 
	ps = con.prepareStatement(sql);
	ps.setString(1, request.getParameter("memno"));
	ps.setString(2, request.getParameter("name"));
	ps.setString(3, request.getParameter("address"));
	ps.setString(4, request.getParameter("hiredate"));
	ps.setString(5, request.getParameter("gender"));
	ps.setString(6, request.getParameter("tel1"));
	ps.setString(7, request.getParameter("tel2"));
	ps.setString(8, request.getParameter("tel3"));
	ps.executeUpdate();
%>
	<script>
		alert("회원등록에 성공하였습니다.");
	</script>
<%
}catch(Exception e){
%>
	<script>
		alert("회원등록에 다시 시도해주세요.");
	</script>
<%
}finally{
	try{
		if(con != null){
			con.close();
		}
		if(stmt != null){
			stmt.close();
		}
		if(ps != null){
			ps.close();
		}
		if(rs != null){
			rs.close();
		}
	}catch(Exception e){
		e.printStackTrace();
	}
}
%>
