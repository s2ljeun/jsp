<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- insert.jsp -->
<%
	request.setCharacterEncoding("EUC-KR");
	String bookname = request.getParameter("bookname");
	String writer = request.getParameter("writer");
	String publisher = request.getParameter("publisher");
	String price = request.getParameter("price");
	
	if(bookname==null||writer==null||publisher==null||price==null
			||bookname.trim().equals("")||writer.trim().equals("")
			||publisher.trim().equals("")||price.trim().equals("")){%>
			<script type="text/javascript">
				alert("å �̸�, ����, ���ǻ�, ������ ��� �Է����ּ���!");
				history.back();
			</script>
<%			return;
		}%>
		
<jsp:useBean id="bdao" class="my.book.BookDAO"/> 
<%
		int res = bdao.insertBook(bookname, writer, publisher, price);
		String msg = null, url = null;
		if (res>0){
			msg = "������ϼ���!! ��������������� �̵��մϴ�.";
			url = "list.jsp";
		}else {
			msg = "������Ͻ���!! ���������������� �̵��մϴ�.";
			url = "book.jsp";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>