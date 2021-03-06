<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 관리</title>
</head>
<body>
	<%@ include file = "header.jsp" %>
	<section>
		<div>
			<h2>매출조회</h2>
		</div>
		<!-- table을 감싼 div에 height을 주고 넘쳐 흐를시 자동으로 스크롤바로 지정 -->
		<div style = "height: 400px; overflow: auto; ">
			<table border = "1" width = "500" style = "margin: 0 auto">
				<tr>
					<th>등급</th>
					<th>회원번호</th>
					<th>이름</th>
					<th>구입액</th> 
				</tr>
				<%
				//한줄일 경우는 더하기 필요 없음, 여러줄일 시 앞부분 띄우고 값 연결을 위해 +=으로 표시
				//sql += "" > sql = sql + ""
				
				sql += "select decode(memgrade, '1', 'VIP', '2', 'Gold', '3', 'Silver', '4','Normal') as memgrade,";
				sql += " memno, name, to_char(totalprice, 'L999,999,999,999')";
				sql += " from grade join";
				sql += " (select memno, name, sum(price*bno) as totalprice";
				sql += " from member natural join buy";
				sql += " group by memno, name)";
				sql += " on totalprice between loprice and hiprice";
				sql += " order by totalprice desc";
			
				//★앞부분에 띄어쓰기 - 나중에 긴 sql이 있을때 덜 힘듬★
				
				rs = stmt.executeQuery(sql);
				
				//반복문 while로 해야함(rs.next가 true일시 = 값이 있을때 작동)
				while(rs.next()){
					%>
					<!-- while이 도는 만큼 6개에 대한 데이터표가 생성  -->
					<tr align="center">
						<td><%=rs.getString(1) %></td>
						<td><%=rs.getString(2) %></td>
						<td><%=rs.getString(3) %></td>
						<td><%=rs.getString(4) %></td>
				</tr>
				<%}
				%>
			</table>
		</div>
	</section>
	
	<%@ include file = "footer.jsp" %>
</body>
</html>