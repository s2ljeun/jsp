<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- result.jsp -->
<%
	request.setCharacterEncoding("EUC-KR"); //post��Ŀ����� �ѱ� ó�� ���
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String tel = request.getParameter("tel");
	String content = request.getParameter("content");
	String sub = request.getParameter("sub");
	if(pwd.equals("1234")){%>
		<h2><%=id%>���� ��ȭ��ȣ�� <%=tel%>���Դϴ�.</h2>
		<h3>�ϰ����� ��: <br>
		<%=content%></h3>
		<h3>�ϰ����� ����: <%=sub%> ���</h3>
<%	}%>
