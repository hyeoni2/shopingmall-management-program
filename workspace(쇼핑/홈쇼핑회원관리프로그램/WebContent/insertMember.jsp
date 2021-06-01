<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록</title>
</head>
<script type="text/javascript">
	function check() {
		if (f.custno.value == "") {
			alert("회원번호가 입력되지 않았습니다.")
			return f.custno.focus;
		}
		if (f.custname.value == "") {
			alert("회원성명이 입력되지 않았습니다.")
			return f.custname.focus;
		}
		if (f.phone.value == "") {
			alert("회원전화가 입력되지 않았습니다.")
			return f.phone.focus;
		}
		if (f.address.value == "") {
			alert("회원주소가 입력되지 않았습니다.")
			return f.address.focus;
		}
		if (f.joindate.value == "") {
			alert("가입일자가 입력되지 않았습니다.")
			return f.joindate.focus;
		}
		if (f.grade.value == "") {
			alert("고객등급이 입력되지 않았습니다.")
			return f.grade.focus;
		}
		if (f.city.value == "") {
			alert("도시코드가 입력되지 않았습니다.")
			return f.city.focus;
		}
		f.submit();
	}
</script>
<body>
<%@include file="header.jsp" %>
<%try{
	sql = "select nvl(max(custno), 0)+1 from MEMBER_TBL_02";
	rs = stmt.executeQuery(sql);
	rs.next();
	String custno = rs.getString(1);
	
	sql = "select to_char(sysdate, 'yyyymmdd') from dual";
	rs = stmt.executeQuery(sql);
	rs.next();
	String joindate = rs.getString(1);
%>

<section>
	
	<h2>홈쇼핑 회원 등록</h2>
	
	<form action="insertMemberPro.jsp" method="post" name="f">
		<table border="1" width = "650" style="margin: 0 auto;">
			<tr>
				<th>회원번호(자동발생)</th>
				<td><input type="text" name="custno" value="<%=custno %>" size="20" maxlength="6" readonly></td>
			</tr>
			<tr>
				<th>회원성명</th>
				<td><input type="text" name="custname" value="" size="20" maxlength="20"></td>
			</tr>
			<tr>
				<th>회원전화</th>
				<td><input type="text" name="phone" value="" size="35" maxlength="13"></td>
			</tr>
			<tr>
				<th>회원주소</th>
				<td><input type="text" name="address" value="" size="50" maxlength="60"></td>
			</tr>
			<tr>
				<th>가입일자</th>
				<td><input type="text" name="joindate" value="<%=joindate%>" size="20" maxlength="6" readonly></td>
			</tr>
			<tr>
				<th>고객등급[A:VIP,B:일반,C:직원]</th>
				<td><input type="text" name="grade" value="" size="20" maxlength="6"></td>
			</tr>
			<tr>
				<th>도시코드</th>
				<td><input type="text" name="city" value="" size="20" maxlength="6"></td>
			</tr>
			<tr>
				<th colspan="2">
				<input type="submit" value="&nbsp;&nbsp;등록&nbsp;&nbsp;" onclick="check(); return false">
				<input type="button" value="&nbsp;&nbsp;조회&nbsp;&nbsp;" onclick="location = 'insertMember.jsp'">
				</th>
			</tr>
			
		
		
		</table>
	
	</form>
	<%
}catch(Exception e){
	e.printStackTrace();
}
	%>

</section>

<%@include file="footer.jsp" %>

</body>
</html>