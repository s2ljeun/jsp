<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- delete.jsp -->
<%
	request.setCharacterEncoding("EUC-KR");
	String bookname = request.getParameter("bookname");
	
	if(bookname==null||bookname.trim().equals("")){%>
			<script type="text/javascript">
				alert("å �̸��� �Է����ּ���!");
				history.back();
			</script>
<%			return;
		}%>
		
	<jsp:useBean id="bdao" class="my.book.BookDAO" />
	
<%
	int res = bdao.deleteBook(bookname);
	if (res>0){%>
		<script type="text/javascript">
			alert("�������� ����!! ��������������� �̵��մϴ�.")
			location.href="list.jsp"
		</script>			
<%	}else {%>
		<script type="text/javascript">
			alert("�������� ����!! ���������������� �̵��մϴ�.")
			location.href="book.jsp"
		</script>
<%	} %>