<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- mall_cgProdList.jsp -->
<%@ include file="mall_top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div align="center">
<c:if test="${empty pcode}">
		<b>${param.cname} 카테고리에 상품이 없습니다.</b>
	</c:if>
	<c:if test="${not empty pcode}">
		<hr color="green" width="80%">
		<font size="5">${param.cname}</font>	
		<hr color="green" width="80%">
		<table border="0" width="80%">
			<tr>
				<c:set var="count" value="0" />
				<c:forEach var="pdto" items="${pcode}">
					<td align="center">
						<a href="mall_prodView.mall?pnum=${pdto.pnum}&select=${param.code}">
							<img src="${upPath}/${pdto.pimage}" width="80" height="60">
						</a>
						<br>
						${pdto.pname}<br>
						<font color="red"><fmt:formatNumber value="${pdto.price}" pattern="000,000"/></font>원<br>
						<font color="green">[${pdto.point}]</font>point
					</td>
					<c:set var="count" value="${count+1}"/>
					<c:if test="${count%3==0}">
						</tr><tr>
					</c:if>
				</c:forEach>
			</tr>
		</table>
	</c:if>
</div>
<%@ include file="mall_bottom.jsp"%>














