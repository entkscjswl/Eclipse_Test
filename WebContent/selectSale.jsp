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
	ArrayList<MemberVO> svo = dao.saleList();
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
				<td>매출</td>

			</tr>
			<%for(MemberVO s : svo){ %>
			<tr>
				<td><%=s.getCustno() %></td>
				<td><%=s.getCustname() %></td>
				<td>
					<%if(s.getGrade().equals("A")){
						out.print("VIP");
					}else if(s.getGrade().equals("B")){
						out.print("일반");
					}else if(s.getGrade().equals("C")){
						out.print("직원");
					}
					%>
				</td>
				<td><%=s.getPrice() %></td>
			</tr>
			<%} %>
		</table>
	</section>
	
	<footer>
		HRDKOREA Copyright &copy; 2016 All rights reserved. Human Resources Development Service of Korea.
	</footer>
</body>
</html>