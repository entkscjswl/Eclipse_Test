<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBPKG.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css.css?ver=1">
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	MemberDAO dao = MemberDAO.getinstance();
	ArrayList<MemberVO> mvo = dao.memberList();
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
		<h3>회원목록조회/수정</h3>
		<table border="1">
			<tr>
				<td>회원번호</td>
				<td>회원성명</td>
				<td>전화번호</td>
				<td>주소</td>
				<td>가입일자</td>
				<td>고객등급</td>
				<td>거주지역</td>
			</tr>
			<%for(MemberVO m : mvo){ %>
			<tr>
				<td><a href="update.jsp?upd=<%=m.getCustno()%>"><%=m.getCustno() %></a></td>
				<td><%=m.getCustname() %></td>
				<td><%=m.getPhone() %></td>
				<td><%=m.getAddress() %></td>
				<td><%=m.getJoindate() %></td>
				<td>
					<%if(m.getGrade().equals("A")){
						out.print("VIP");
					}else if(m.getGrade().equals("B")){
						out.print("일반");
					}else if(m.getGrade().equals("C")){
						out.print("직원");
					}
					%>
				</td>
				<td><%=m.getCity() %></td>
			</tr>
			<%} %>
		</table>
	</section>
	
	<footer>
		HRDKOREA Copyright &copy; 2016 All rights reserved. Human Resources Development Service of Korea.
	</footer>
</body>
</html>