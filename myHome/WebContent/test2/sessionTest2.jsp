<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- sessionTest2.jsp -->
<%
	String id = (String)session.getAttribute("id");
	if(id==null){%>
		<script type="text/javascript">
			alert("�α����� �� �ּ���!!")
			location.href="sessionTest1.jsp"
		</script>
<%		return;

	}
%>

<h2>ȸ �� �� �� �� �� ��</h2>
<h3><%=id%>���� �α��� �Ǿ����ϴ�.</h3>
<h3>�α����� �ȵǾ� �ִٸ� �α��� �������� ������� �մϴ�.</h3>
<a href="sessionTest3.jsp">�α׾ƿ�</a>