<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- sessionTest3.jsp -->
<%
	//session.removeAttribute("id"); //key�� id�� ����
	session.invalidate();//��ü���� -> �� ���� ���
%>
<script type="text/javascript">
	alert("�α׾ƿ� �Ǿ����ϴ�. �α��� �������� �̵��մϴ�.")
	location.href="sessionTest1.jsp"
</script>