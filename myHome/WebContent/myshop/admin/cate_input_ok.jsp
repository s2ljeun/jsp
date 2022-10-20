<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- cate_input_ok.jsp -->
<%
		request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="cdto" class="my.shop.CategoryDTO"/>
<jsp:setProperty property="*" name="cdto"/>
<%
		if (cdto.getCode() == null || cdto.getCname() == null || 
				cdto.getCode().trim().equals("") || cdto.getCname().trim().equals("")){
			response.sendRedirect("main.jsp");
			return;
		}
%>
<jsp:useBean id="cdao" class="my.shop.CategoryBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="cdao" value="<%=pool%>"/>
<%
		int res = cdao.insertCate(cdto);
		String msg = null, url = null;
		if (res>0){
			msg = "카테고리 등록 성공!! 카테고리 목록페이지로 이동합니다.";
			url = "cate_list.jsp";
		}else {
			msg = "카테고리 등록 실패!! 카테고리 등록페이지로 이동합니다.";
			url = "cate_input.jsp";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>








