<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- scope.jsp -->
<jsp:useBean id="obj" class="my.scope.Counter" scope="request"/>
<jsp:setProperty property="*" name="obj"/>
<%//property="*" => �Ķ���� �̸��� setter�޼ҵ带  ã�´�%>

<h1>application scope</h1>
<b>obj�� getCount() ��:</b>
<jsp:getProperty property="count" name="obj" />
<br>
<a href="result.jsp">����������</a>