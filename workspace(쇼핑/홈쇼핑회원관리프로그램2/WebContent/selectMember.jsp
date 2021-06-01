<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈으로</title>
</head>
<body>
<%@include file="header.jsp" %>
	<section>
			<h2>회원목록조회/수정</h2>
		<table border="1" width = "800" style="margin: 0 auto;">
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>가입일자</th>
				<th>고객등급</th>
				<th>거주지역</th>
			</tr>
<%try{
			sql += "select custno, custname, phone, address,";
			sql += "to_char(joindate, 'yyyy-mm-dd'),";
			sql += "decode(grade, 'A', 'VIP', 'B', '일반', 'C', '직원'),";
			sql += "city from member_tbl_02";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
%>
				<tr style="text-align: center;">
					<td><a href="update.jsp?custno=<%=rs.getString(1) %>"><%=rs.getString(1) %></a></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %></td>
					<td><%=rs.getString(5) %></td>
					<td><%=rs.getString(6) %></td>
					<td><%=rs.getString(7) %></td>
				
				</tr>

<%	
}
%>
<%}catch(Exception e){
	e.printStackTrace();
}%>	
		</table>
	</section>


<%@include file="footer.jsp" %>
</body>
</html>