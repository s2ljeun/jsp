<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, my.book.*" %>
<!-- find.jsp -->
<%
		request.setCharacterEncoding("EUC-KR");
		//select�� �Ķ����, input�� �Ķ���� �޾ƿ���
		String search = request.getParameter("search");
		String searchString = request.getParameter("searchString");

		if (search==null || search.trim().equals("") || 
				searchString==null || searchString.trim().equals("")){
			response.sendRedirect("book.jsp");
			return;
		}
%>
<jsp:useBean id="bdao" class="my.book.BookDAO" />

<html>
<head>
<title>����ã��</title>
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2>�� �� ã �� �� �� ��</h2>
		<hr color="green" width="300">
		<table border="1" width="500">
			<tr>
				<th>å �̸�</th>
				<th>����</th>
				<th>���ǻ�</th>
				<th>����</th>
				<th>�԰���</th>
	</tr>

<%
		List<BookDTO> list = bdao.findBook(search, searchString);
		if (list == null || list.size()==0){%>
			<tr>
				<td colspan="5">ã���ô� ������ �����ϴ�.</td>
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
			<tr>
				<td>ã���ô� ������ <%=list.size()%>�� �ֽ��ϴ�.</td>
			</tr>
<%	} %>					
		</table>
	</div>
	
</body>
</html>