<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- scope.jsp -->
<jsp:useBean id="obj" class="my.scope.Counter" scope="request"/>
<jsp:setProperty property="*" name="obj"/>
<%//property="*" => 파라메터 이름의 setter메소드를  찾는다%>

<h1>application scope</h1>
<b>obj의 getCount() 값:</b>
<jsp:getProperty property="count" name="obj" />
<br>
<a href="result.jsp">다음페이지</a>