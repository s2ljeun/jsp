<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, book.*"%>
<!--  cart.jsp -->
<%
		List<BookDTO> bookList = (List)session.getAttribute("cart");
		if (bookList != null && bookList.size() != 0){
%>
<hr color="red">
<b>현재 주문한 도서 목록</b>
<table border="1">
	<tr>
		<th>도서명</th>	<th>작가</th><th>가격</th><th>수량</th><th>삭제</th>
	</tr>
<%	for(int i=0; i<bookList.size(); ++i){ 
			BookDTO dto = bookList.get(i);%>
	<tr>
		<td><%=dto.getTitle()%></td><td><%=dto.getAuthor()%></td>
		<td><%=dto.getPrice()%></td><td><%=dto.getQty()%></td>
		<td>
			<form name="f" action="book.do" method="post">
				<input type="hidden" name="command" value="DEL" />
				<input type="hidden" name="idx" value="<%=i%>">
				<input type="submit" value="삭제"/>
			</form>				
		</td>
	</tr>
<%	} %>	
</table>
<form name="f" action="book.do" method="post">
	<input type="hidden" name="command" value="CHK" />
	<input type="submit" value="주문페이지로 이동하기">
</form>
<%} %>





