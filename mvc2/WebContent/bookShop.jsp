<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- bookShop.jsp -->
<html>
<head>
	<title>도서구매</title>
</head>
<body>
	<h1>도서 구매 페이지</h1>
	<form name="f" action="book.do" method="post">
		<input type="hidden" name="command" value="ADD" />
		<b>도서 선택 : </b>
		<select name="book">
			<option>자바의 정석 / 남궁성 / 31000</option>
			<option>이것이 자바다 / 신용권 / 35000</option>
			<option>Servlet&JSP / 오영명 / 26000</option>
			<option>스프링 애클리 케이션 개발 / 최광민 / 35000</option>
		</select>
		<b>수량 : </b>
		<input type="text" name="qty" size="2" value="1">
		<input type="submit" value="주문하기">
	</form>
	<jsp:include page="cart.jsp"/>	
</body>
</html>









