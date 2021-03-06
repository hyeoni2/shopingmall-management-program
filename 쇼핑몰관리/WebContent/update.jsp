<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 관리</title>
</head>
<!-- 자바스크립트 -->
<script type="text/javascript">
	//함수 = 메소드
	function check() {
		if(f.memno.value == "") { // == 같다, != 다르다 f.회원번호의 값이 없다면
			//경고창 띄우기
			alert("회원번호를 입력해주세요.");	
			//커서를 올린 후 끝낸다
			return f.memno.focus(); 
		}
		if(f.name.value == "") { // == 같다, != 다르다 f.회원번호의 값이 없다면
			//경고창 띄우기
			alert("이름을 입력해주세요.");	
			//커서를 올린 후 끝낸다
			return f.name.focus(); 
		}
		if(f.address.value == "") { // == 같다, != 다르다 f.회원번호의 값이 없다면
			//경고창 띄우기
			alert("주소를 입력해주세요.");	
			//커서를 올린 후 끝낸다
			return f.address.focus(); 
		}
		if(f.hiredate.value == "") { // == 같다, != 다르다 f.회원번호의 값이 없다면
			//경고창 띄우기
			alert("가입일을 입력해주세요.");	
			//커서를 올린 후 끝낸다
			return f.hiredate.focus(); 
		}
		//true && true => true 
		if(f.gender[0].checked == false && f.gender[1].checked == false ) { // == 같다, != 다르다 f.회원번호의 값이 없다면
			//경고창 띄우기
			alert("성별을 입력해주세요.");	
			return; 
		}
		if(f.tel1.value == "") { // == 같다, != 다르다 f.회원번호의 값이 없다면
			//경고창 띄우기
			alert("전화번호 앞자리를 입력해주세요.");	
			//커서를 올린 후 끝낸다
			return f.tel1.focus(); 
		}
		if(f.tel2.value == "") { // == 같다, != 다르다 f.회원번호의 값이 없다면
			//경고창 띄우기
			alert("전화번호 중간자리를 입력해주세요.");	
			//커서를 올린 후 끝낸다
			return f.tel2.focus(); 
		}
		if(f.tel3.value == "") { // == 같다, != 다르다 f.회원번호의 값이 없다면
			//경고창 띄우기
			alert("전화번호 끝자리를 입력해주세요.");	
			//커서를 올린 후 끝낸다
			return f.tel3.focus(); 
		}
		//모든 조건이 통과가 된다고 하면은 submit으로 넘어감
		f.submit();
	}
	
	function rewrite() {
		f.reset();
		f.name.focus();
	}

</script>

<body>
	<%@ include file = "header.jsp" %>
	<!-- header.jsp안에 dbcon.jsp가 포함 되어있음 그 아래에 자바 넣어야 함 -->
	<%
	
/* 	String memno = request.getParameter("memno");
	sql += "select memno, name, address,";
	sql += " to_char(hiredate, 'yyyy-mm-dd'),";
	sql += " gender, tel1, tel2, tel3";
	sql += " from member";
	sql += " where memno = '"+ memno +"'";
	
	rs = stmt.executeQuery(sql); */
	sql += "select memno, name, address,";
	sql += " to_char(hiredate, 'yyyy-mm-dd'),";
	sql += " gender, tel1, tel2, tel3";
	sql += " from member";
	sql += " where memno = ?";
	ps = con.prepareStatement(sql);
	ps.setString(1, request.getParameter("memno"));
	rs = ps.executeQuery();
	rs.next();
	String gender = rs.getString("gender");
	

	%>
	<section>
		<div>
			<h2>회원수정</h2><!-- 진하게 , 자동 줄바꿈 =p의기능을 가짐 -->
		</div>
		
		<!-- submit을 하면 action에 있는 파일로 보내겠다. -->
		<form action="updatePro.jsp" method="post" name="f">
		<!-- style = "margin : 0 auto > 크롬에서도 표 가운데 정렬을 실행하기 위해서 실시 -->
			<table border = "1" width = "400" style = "margin: 0 auto">
			<tr>
				<th>회원번호</th> <!-- 진하게, 가운데 정렬 -->
				     <!-- 글자로 입력,  이름(쇼핑몰관리 sql과 동일한 이름으로, 값, 크기, 최대길이    -->
				<td><input type="text" name="memno" value="<%=rs.getString(1) %>" size="10" maxlength="4" readonly></td>
			</tr>
			<tr>
				<th>회원이름</th> <!-- 진하게, 가운데 정렬 -->
				     <!-- 글자로 입력,  이름(쇼핑몰관리 sql과 동일한 이름으로, 값, 크기, 최대길이    -->
				<td><input type="text" name="name" value="<%=rs.getString(2) %>" size="15" maxlength="30"></td>
			</tr>
			<tr>
				<th>주소</th> <!-- 진하게, 가운데 정렬 -->
				     <!-- 글자로 입력,  이름(쇼핑몰관리 sql과 동일한 이름으로, 값, 크기, 최대길이    -->
				<td><input type="text" name="address" value="<%=rs.getString(3) %>" size="40" maxlength="100"></td>
			</tr>
			<tr>
				<th>가입일</th> <!-- 진하게, 가운데 정렬 -->
				     <!-- 글자로 입력,  이름(쇼핑몰관리 sql과 동일한 이름으로, 값, 크기, 최대길이    -->
				<td><input type="text" name="hiredate" value="<%=rs.getString(4) %>" size="15" maxlength="4" ></td>
			</tr>
			<tr>
				<th>성별</th> <!-- 진하게, 가운데 정렬 -->
				     <!-- 글자로 입력,  이름 같아야(쇼핑몰관리 sql과 동일한 이름으로, 값, 사이즈나 길이 없애야, radio버튼의 이름은 같은 걸로 해야함 (둘 중 하나만 가능하게)   -->
				<td>
				&nbsp;&nbsp;<input type="radio" name="gender" value="M" <%if(gender != null && gender.equals("M")){out.print("checked= 'checked'");}%>>남자
				&nbsp;&nbsp;<input type="radio" name="gender" value="F" <%if(gender != null && gender.equals("F")){out.print("checked= 'checked'");}%>>여자
				</td>
			</tr>
			<tr>
				<th>전화번호</th> <!-- 진하게, 가운데 정렬 -->
				     <!-- 글자로 입력,  이름(쇼핑몰관리 sql과 동일한 이름으로, 값, 크기, 최대길이    -->
				<td>
				<input type="text" name="tel1" value="<%=rs.getString(6) %>" size="5" maxlength="3">
				- <input type="text" name="tel2" value="<%=rs.getString(7) %>" size="5" maxlength="4">
				- <input type="text" name="tel3" value="<%=rs.getString(8) %>" size="5" maxlength="4">
				</td>
			</tr>
			<!-- 버튼만들어야함 -->
			<tr>
				<th colspan="2"> <!-- 두행을 하나로 합쳐주는 기능 --> <!-- check를 먼저 하고 넘어가겠다는 의미로 ; -->
				<input type="submit" value="회원수정" onclick="check(); return false">
														<!-- 위치 설정 후 회원조회화면이 보이도록해야함 / "가 있다면 '를 쓰기 -->
				<input type="reset" value="다시쓰기" ">
				<!-- onclick="rewrite(); return false 함수처리도 있음 -->
				</th> <!-- 진하게, 가운데 정렬, td로 하게 되면 따로 align 설정해야함 -->
				    
			</tr>
			
			</table>
		</form>
		
	</section>
	<!-- DB연결을 해제하기 위해 footer에다가 해제코드를 연결해야함 -->
	<%@ include file = "footer.jsp" %>
</body>
</html>