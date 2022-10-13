<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"%>
<%@ page import="my.book.*" %> 

<!-- list.jsp -->
<html>
<head>
<title>도서목록</title>
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2>도 서 목 록 페 이 지</h2>
		<hr color="green" width="300">
		<table border="1" width="500">
			<tr>
				<th>책 이름</th>
				<th>저자</th>
				<th>출판사</th>
				<th>가격</th>
				<th>입고일</th>
	</tr>
<jsp:useBean id="bdao" class="my.book.BookDAO" />			
<%
		List<BookDTO> list = bdao.listBook();
		if (list == null || list.size()==0){%>
			<tr>
				<td colspan="5">등록된 도서가 없습니다.</td>
			</tr>
<%	}else { 
			for(BookDTO dto : list){//list를 훑으면서 안에 들어있는 dto에 대하여...%>
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