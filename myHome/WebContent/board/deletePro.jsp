<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- deletePro.jsp -->
<%
		String num = request.getParameter("num");
		String passwd = request.getParameter("passwd");
		if (num==null || num.trim().equals("")){
			response.sendRedirect("list.jsp");
			return;			
		}
		if (passwd==null || passwd.trim().equals("")){%>
			<script type="text/javascript">
				alert("��й�ȣ�� �Է��ϼž� �մϴ�.")
				history.back()
			</script>	
<%		return;
		}%>
<jsp:useBean id="bdao" class="my.board.BoardDAO"/>
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="bdao" value="<%=pool%>"/>		
<%
		int res = bdao.deleteBoard(Integer.parseInt(num), passwd);
		String msg = null, url = null;
		if (res>0){
			msg = "�Խñ� ���� ����!! �Խñ� ��� �������� �̵��մϴ�.";
			url = "list.jsp";
		}else if (res<0){
			msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�. �ٽ� �Է��� �ּ���.";
			url = "deleteForm.jsp?num=" + num;
		}else {
			msg = "�Խñ� ���� ����!! �Խñ� �󼼺��� �������� �̵��մϴ�.";
			url = "content.jsp?num=" + num;
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>















		