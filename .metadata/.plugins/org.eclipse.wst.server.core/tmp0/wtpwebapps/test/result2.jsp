<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR"); //post��Ŀ����� �ѱ� ó�� ���
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String addr = request.getParameter("addr");
	
	if(name!="" && tel !="" && addr !=""){
		%>
		<div align="center">
			<h2>
				<%=name%>�� ȯ���մϴ�.<br>
				��ȭ��ȣ: <%=tel%><br>
				�ּ�: <%=addr%><br>
			</h2>
		</div>
<%	}%>
	