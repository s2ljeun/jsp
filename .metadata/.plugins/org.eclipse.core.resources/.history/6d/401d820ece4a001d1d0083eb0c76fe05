<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- delete.jsp -->
<%
	request.setCharacterEncoding("EUC-KR");
	String bookname = request.getParameter("bookname");
	
	if(bookname==null||bookname.trim().equals("")){%>
			<script type="text/javascript">
				alert("책 이름을 입력해주세요!");
				history.back();
			</script>
<%			return;
		}%>
		
	<jsp:useBean id="bdao" class="my.book.BookDAO" />
	
<%
	int res = bdao.deleteBook(bookname);
	if (res>0){%>
		<script type="text/javascript">
			alert("도서삭제 성공!! 도서목록페이지로 이동합니다.")
			location.href="list.jsp"
		</script>			
<%	}else {%>
		<script type="text/javascript">
			alert("도서삭제 실패!! 도서관리페이지로 이동합니다.")
			location.href="book.jsp"
		</script>
<%	} %>