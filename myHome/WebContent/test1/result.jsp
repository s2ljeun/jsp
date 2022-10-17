<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- result.jsp -->
<jsp:useBean id="obj" class="my.scope.Counter" scope="application"/>
<h2>result 페이지 입니다.</h2>
<b>obj의 getCount 값 : </b>
<jsp:getProperty property="count" name="obj"/>
<br>
<a href="test1.html">처음으로</a>