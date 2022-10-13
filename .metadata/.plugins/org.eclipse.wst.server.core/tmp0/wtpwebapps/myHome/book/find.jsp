<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, my.book.*" %>
<!-- find.jsp -->
<%
		request.setCharacterEncoding("EUC-KR");
		//select의 파라미터, input의 파라미터 받아오기
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
<title>도서찾기</title>
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2>도 서 찾 기 페 이 지</h2>
		<hr color="green" width="300">
		<table border="1" width="500">
			<tr>
				<th>책 이름</th>
				<th>저자</th>
				<th>출판사</th>
				<th>가격</th>
				<th>입고일</th>
	</tr>

<%
		List<BookDTO> list = bdao.findBook(search, searchString);
		if (list == null || list.size()==0){%>
			<tr>
				<td colspan="5">찾으시는 도서가 없습니다.</td>
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
			<tr>
				<td>찾으시는 도서는 <%=list.size()%>권 있습니다.</td>
			</tr>
<%	} %>					
		</table>
	</div>
	
</body>
</html>