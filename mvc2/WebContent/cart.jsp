<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, book.*"%>
<!--  cart.jsp -->
<%
		List<BookDTO> bookList = (List)session.getAttribute("cart");
		if (bookList != null && bookList.size() != 0){
%>
<hr color="red">
<b>���� �ֹ��� ���� ���</b>
<table border="1">
	<tr>
		<th>������</th>	<th>�۰�</th><th>����</th><th>����</th><th>����</th>
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
				<input type="submit" value="����"/>
			</form>				
		</td>
	</tr>
<%	} %>	
</table>
<form name="f" action="book.do" method="post">
	<input type="hidden" name="command" value="CHK" />
	<input type="submit" value="�ֹ��������� �̵��ϱ�">
</form>
<%} %>





