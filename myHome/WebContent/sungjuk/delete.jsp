<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- delete.jsp -->
<%
		String num = request.getParameter("num");
		if (num == null || num.trim().equals("")){
			response.sendRedirect("list.jsp");
			return;
		}
%>
<jsp:useBean id="sdao" class="my.sungjuk.SungjukDAO" />
<%
		int res = sdao.deleteSungjuk(Integer.parseInt(num));
		String msg = null, url = null;
		if (res>0){
			msg = "������������!! ��������Ʈ �������� �̵��մϴ�.";
			url = "list.jsp";
		}else {
			msg = "������������!! ��������Ʈ �������� �̵��մϴ�.";
			url = "list.jsp";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>



