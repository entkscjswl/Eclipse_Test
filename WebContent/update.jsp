<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBPKG.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function checkInfo(){
		if(document.getElementById("custno").value==0){
			alert("회원번호가 입력되지 않았습니다.");
			document.getElementById("custno").focus();
		}else if(document.getElementById("custname").value==0){
			alert("회원이름이 입력되지 않았습니다.");
			document.getElementById("custname").focus();
		}else if(document.getElementById("phone").value==0){
			alert("전화번호가 입력되지 않았습니다.");
			document.getElementById("phone").focus();
		}else if(document.getElementById("address").value==0){
			alert("주소가 입력되지 않았습니다.");
			document.getElementById("address").focus();
		}else if(document.getElementById("joindate").value==0){
			alert("가입일자가 입력되지 않았습니다.");
			document.getElementById("joindate").focus();
		}else if(document.getElementById("grade").value==0){
			alert("등급이 입력되지 않았습니다.");
			document.getElementById("grade").focus();
		}else if(document.getElementById("city").value==0){
			alert("도시코드가 입력되지 않았습니다.");
			document.getElementById("city").focus();
		}else{
			document.insert.method="post";
			document.insert.action="updatePro.jsp";
			document.insert.submit();
		}
	}
</script>
<link rel="stylesheet" href="css.css?ver=1">
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	MemberDAO dao = MemberDAO.getinstance();
	String upd = request.getParameter("upd"); 
	MemberVO vo = dao.readOne(upd);
%>
	<header>
		<h2>쇼핑몰 회원관리 ver 1.0</h2>
	</header>
	
	<menu>
		<a href="insert.jsp">회원등록</a>
		<a href="select.jsp">회원목록 조회/수정</a>
		<a href="selectSale.jsp">회원매출조회</a>
		<a href="index.jsp">홈으로</a>
	</menu>
	
	<section>
		<h3>홈쇼핑 회원 등록</h3>
		<form name="insert">
			<table border="1">
				<tr>
					<td>회원번호(자동발생)</td>
					<td><input type="text" id="custno" name="custno" value="<%=vo.getCustno() %>" readonly></td>
				</tr>
				<tr>
					<td>회원성명</td>
					<td><input type="text" id="custname" name="custname" value="<%=vo.getCustname() %>"></td>
				</tr>
				<tr>
					<td>회원전화</td>
					<td><input type="text" id="phone" name="phone" value="<%=vo.getPhone() %>"></td>
				</tr>
				<tr>
					<td>회원주소</td>
					<td><input type="text" id="address" name="address" value="<%=vo.getAddress() %>"></td>
				</tr>
				<tr>
					<td>가입일자</td>
					<td><input type="text" id="joindate" name="joindate" value="<%=vo.getJoindate() %>"></td>
				</tr>
				<tr>
					<td>고객등급[A:VIP,B:일반,C:직원]</td>
					<td><input type="text" id="grade" name="grade" value="<%=vo.getGrade() %>"></td>
				</tr>
				<tr>
					<td>도시코드</td>
					<td><input type="text" id="city" name="city" value="<%=vo.getCity() %>"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="수정" onclick="checkInfo()">
						<input type="button" value="조회" onclick="location.href='select.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</section>
	
	<footer>
		HRDKOREA Copyright &copy; 2016 All rights reserved. Human Resources Development Service of Korea.
	</footer>
</body>
</html>