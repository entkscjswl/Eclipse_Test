<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBPKG.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	MemberDAO dao = MemberDAO.getinstance();
	
	String custno = request.getParameter("custno");
	String custname = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String joindate = request.getParameter("joindate");
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");
	
	MemberVO vo = new MemberVO();
	vo.setCustno(custno);
	vo.setCustname(custname);
	vo.setPhone(phone);
	vo.setAddress(address);
	vo.setJoindate(joindate);
	vo.setGrade(grade);
	vo.setCity(city);
	dao.insert(vo);
%>
<script>
	alert("회원등록에 완료 되었습니다.");
	location.href="select.jsp";
</script>
</body>
</html>