<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!-- delete.jsp -->
<%--
	1. �Ѿ�� ������ �ޱ�
	2. �Ѿ�� ������ ��ȿ�� �˻��ϱ�
	3. ����̹� �����ϱ�
	4. ����Ŭ�� �����Ͽ� ������ �����ϱ�
	5. ����� �޾� ó���ϱ�
	6. db���� �ݱ�
--%>

<%
	String id = request.getParameter("id");
	
	if(id==null||id.trim().equals("")){
		response.sendRedirect("student.jsp"); //��������  response�� ���� Ŭ���̾�Ʈ���� ����
		return;
	}%>

	<jsp:useBean id="stdao" class="my.student.StudentDAO" />

<%
	int res = stdao.deleteStudent(id);
	String msg = null, url = null;
	if (res>0){
		msg = "�л����� ����!! �л������������ �̵��մϴ�.";
		url = "list.jsp";
	}else {
		msg = "�л����� ����!! �л������������� �̵��մϴ�.";
		url = "student.jsp";
	}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>



%>