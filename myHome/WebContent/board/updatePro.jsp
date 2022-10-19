<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- updatePro.jsp -->
<%
		request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="bdto" class="my.board.BoardDTO" />
<jsp:setProperty property="*" name="bdto"/>
<jsp:useBean id="bdao" class="my.board.BoardDAO" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="bdao" value="<%=pool%>"/>		

<%
		if (bdto.getWriter() == null || bdto.getWriter().trim().equals("")){
			response.sendRedirect("list.jsp");
			return;
		}
		bdto.setIp(request.getRemoteAddr());
		int res = bdao.updateBoard(bdto);
		String msg = null, url = null;
		if (res>0){
			msg = "�Խñ� ���� ����!! �Խñ� ��� �������� �̵��մϴ�.";
			url = "list.jsp";
		}else if (res<0){
			msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�. �ٽ� �Է��� �ּ���.";
			url = "updateForm.jsp?num=" + bdto.getNum();
		}else {
			msg = "�Խñ� ���� ����!! �Խñ� �󼼺��� �������� �̵��մϴ�.";
			url = "content.jsp?num=" + bdto.getNum();
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>