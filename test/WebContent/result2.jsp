<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR"); //post방식에서의 한글 처리 방식
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String addr = request.getParameter("addr");
	
	if(name!="" && tel !="" && addr !=""){
		%>
		<div align="center">
			<h2>
				<%=name%>님 환영합니다.<br>
				전화번호: <%=tel%><br>
				주소: <%=addr%><br>
			</h2>
		</div>
<%	}%>
	