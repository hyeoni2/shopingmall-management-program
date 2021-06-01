<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="dbcon.jsp" %>
<%try{
	sql = "insert into MEMBER_TBL_02 values(?,?,?,?,?,?,?)";
	ps = con.prepareStatement(sql);
	ps.setString(1, request.getParameter("custno"));
	ps.setString(2, request.getParameter("custname"));
	ps.setString(3, request.getParameter("phone"));
	ps.setString(4, request.getParameter("address"));
	ps.setString(5, request.getParameter("joindate"));
	ps.setString(6, request.getParameter("grade"));
	ps.setString(7, request.getParameter("city"));

	ps.executeUpdate();
%>
	<script>
		alert("회원등록에 성공하였습니다.")
	</script>
<%
}catch(Exception e){
%>
	<script>
		alert("회원등록에 실패하였습니다.")
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