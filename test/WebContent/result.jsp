<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- result.jsp -->
<%
	request.setCharacterEncoding("EUC-KR"); //post방식에서의 한글 처리 방식
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String tel = request.getParameter("tel");
	String content = request.getParameter("content");
	String sub = request.getParameter("sub");
	if(pwd.equals("1234")){%>
		<h2><%=id%>님의 전화번호는 <%=tel%>번입니다.</h2>
		<h3>하고싶은 말: <br>
		<%=content%></h3>
		<h3>하고싶은 공부: <%=sub%> 언어</h3>
<%	}%>

