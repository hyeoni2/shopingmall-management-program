<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="dbcon.jsp" %>
<!DOCTYPE html>
<%
try{	
	//멤버테이블의 열만큼 넣어라
	sql = "update member set name=?, address=?, hiredate=?, gender=?, tel1=?, tel2=?, tel3=? where memno = ?";
	//con객체가 있어야지 prepareStatement를 이용할 수 있음
	ps = con.prepareStatement(sql);
	//insert에 있는 표의 이름들을 요청해서 첫행에 저장하겠다

	ps.setString(1, request.getParameter("name"));
	ps.setString(2, request.getParameter("address"));
	ps.setString(3, request.getParameter("hiredate"));
	ps.setString(4, request.getParameter("gender"));
	ps.setString(5, request.getParameter("tel1"));
	ps.setString(6, request.getParameter("tel2"));
	ps.setString(7, request.getParameter("tel3"));
	ps.setString(8, request.getParameter("memno"));
	/*이미 ppst를 할 때 컴파일이 되어있기 때문에 괄호는 비어있다.
	resultSet의 결과는 없음
	성공시 1, 실패시 0을 띄움
	*/
	ps.executeUpdate();
	/* out.print("성공"); -테스트할시에 띄어보는 느낌?*/
	//성공알림창
%>
	<script>//자바 끝 스크립트 시작
		alert("회원수정이 완료되었습니다.");
		location = "select.jsp";
	</script>
<%
}
//성공하면 catch까지 안감
//모든 Exception의 부모(모든 자식객체를 다 받을 수 있다.)객체
catch(Exception e){//예외객체를 잡아 처리,회원등록 실패
	//실패 알림창
%>
	<script>//자바 끝 스크립트 시작
	alert("회원수정이 완료되지 않았습니다.");
	location = "select.jsp";//insert.jsp로 돌아가라
	/*
	history.back(그전으로 돌아가라)
	history.go(-1)<한단계전으로 돌아가라, -2일경우 두단계 전으로 돌아가라
	*/
	</script>
<%
}finally{//예외발생여부에 관계없이 무조건 실행
//모든 db를 해제하는 코드	
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
	}
	catch(Exception e){
		//모든 예외를 다 처리해줌
		e.printStackTrace();
		
	}
	
}
%>	


