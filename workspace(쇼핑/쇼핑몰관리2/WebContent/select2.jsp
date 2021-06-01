<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="header.jsp" %>
<title>쇼핑몰관리 프로그램</title>
</head>
<body>
<%
//조회를 누르면 나오는 표를 작성하는 것임
try{
%>	<section>
		<h2>매출조회</h2>
		<table border="1" width = "500" style="margin: 0 auto;">
			<tr>
				<th>등급</th>
				<th>회원번호</th>
				<th>이름</th>
				<th>구입액</th>
			</tr>
			
<%
	sql += "select ";
	sql += " decode(memgrade, '1', 'VIP', '2', 'Gold', '3', 'Silver', '4', 'Normal'),";
	sql += " memno, name, amount";
	sql += " from grade join (select memno, name,";
	sql += " sum(price*bno) as amount";
	sql += " from member natural join buy";
	sql += " group by memno, name)";
	sql += " on amount between loprice and hiprice";
	sql += " order by amount desc";
	
	rs = stmt.executeQuery(sql);
	
	while(rs.next()){
%>
	<tr style="text-align: center;">
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
<%	
	}
%>
		</table>
	
	</section>
<%}catch(Exception e){
	e.printStackTrace();
}
%>
	<%@include file="footer.jsp" %>

</body>
</html>