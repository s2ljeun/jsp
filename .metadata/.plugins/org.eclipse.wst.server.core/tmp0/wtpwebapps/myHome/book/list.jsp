<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"%>
<%@ page import="my.book.*" %> 

<!-- list.jsp -->
<html>
<head>
<title>�������</title>
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2>�� �� �� �� �� �� ��</h2>
		<hr color="green" width="300">
		<table border="1" width="500">
			<tr>
				<th>å �̸�</th>
				<th>����</th>
				<th>���ǻ�</th>
				<th>����</th>
				<th>�԰���</th>
	</tr>
<jsp:useBean id="bdao" class="my.book.BookDAO" />			
<%
		List<BookDTO> list = bdao.listBook();
		if (list == null || list.size()==0){%>
			<tr>
				<td colspan="5">��ϵ� ������ �����ϴ�.</td>
			</tr>
<%	}else { 
			for(BookDTO dto : list){//list�� �����鼭 �ȿ� ����ִ� dto�� ���Ͽ�...%>
			<tr>
				<td><%=dto.getBookname()%></td>
				<td><%=dto.getWriter()%></td>
				<td><%=dto.getPublisher()%></td>
				<td align="right"><%=dto.getPrice()%></td>
				<td><%=dto.getIndate()%></td>
			</tr>					
<%		} %>
<%	} %>					
		</table>
	</div>
	
</body>
</html>