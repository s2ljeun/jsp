<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- result.jsp -->
<jsp:useBean id="obj" class="my.scope.Counter" scope="application"/>
<h2>result ������ �Դϴ�.</h2>
<b>obj�� getCount �� : </b>
<jsp:getProperty property="count" name="obj"/>
<br>
<a href="test1.html">ó������</a>