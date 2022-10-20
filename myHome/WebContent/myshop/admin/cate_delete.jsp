<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- cate_delete.jsp -->
<%
		String cnum = request.getParameter("cnum");
		if (cnum == null || cnum.trim().equals("")){
			response.sendRedirect("main.jsp");
			return;
		}
%>
<jsp:useBean id="cdao" class="my.shop.CategoryBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="cdao" value="<%=pool%>"/>
<%
		int res = cdao.deleteCate(Integer.parseInt(cnum));
		String msg = null, url = null;
		if (res>0){
			msg = "카테고리 삭제 성공!! 카테고리 목록페이지로 이동합니다.";
			url = "cate_list.jsp";
		}else {
			msg = "카테고리 삭제 실패!! 카테고리 목록페이지로 이동합니다.";
			url = "cate_list.jsp";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>




