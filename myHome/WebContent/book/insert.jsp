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
				alert("책 이름, 저자, 출판사, 가격을 모두 입력해주세요!");
				history.back();
			</script>
<%			return;
		}%>
		
<jsp:useBean id="bdao" class="my.book.BookDAO"/> 
<%
		int res = bdao.insertBook(bookname, writer, publisher, price);
		String msg = null, url = null;
		if (res>0){
			msg = "도서등록성공!! 도서목록페이지로 이동합니다.";
			url = "list.jsp";
		}else {
			msg = "도서등록실패!! 도서관리페이지로 이동합니다.";
			url = "book.jsp";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>