<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="my.shop.*"%>
<!-- prod_view.jsp -->
<%@ include file="top.jsp"%>

<%
	int pnum = Integer.parseInt(request.getParameter("pnum"));
%>
<jsp:useBean id="pdao" class="my.shop.ProductBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="pdao" value="<%=pool%>"/>

<%
	ProductDTO dto = pdao.viewProd(pnum);
%>

<div align="center" style="width:80%; height:100%">
	<table class="outline" width="600">
		<caption><font size="4"><b>상품상세보기</b></font></caption>
		<tr>
			<th class="m2" width="100">카테고리</th>
			<td width="200"></td>
			<th class="m2" width="100">상품번호</th>
			<td width="200"><%=dto.getPnum()%></td>
		</tr>
		<tr>
			<th class="m2">상품명</th>
			<td><%=dto.getPname()%></td>
			<th class="m2">제조회사</th>
			<td><%=dto.getPcompany()%></td>
		</tr>
		<tr>
			<th class="m2" height="100">상품이미지</th>
			<td colspan="3">
				<%	String filename = config.getServletContext().getRealPath("/myshop/images");
					filename += "/" + dto.getPimage();%>
				<img src="<%=filename%>" width="50" height="50">
			</td>
		</tr>
		<tr>
			<th class="m2">상품 수량</th>
			<td><%=dto.getPqty()%></td>
			<th class="m2">상품 가격</th>
			<td><%=dto.getPrice()%></td>
		</tr>
		<tr>
			<th class="m2">상품 스펙</th>
			<td><%=dto.getPspec()%></td>
			<th class="m2">상품 포인트</th>
			<td><%=dto.getPoint()%></td>
		</tr>
		<tr>
			<th class="m2" height="100">상품소개</th>
			<td colspan="3">
				<textarea rows="4" cols="60" readOnly>
					<%=dto.getPcontents()%>
				</textarea>
			</td>
		</tr>
		<tr align="center">
			<td colspan="4">
				<input type="button" value="돌아가기"/>
			</td>
		</tr>
	</table>
</div>
<%@ include file="bottom.jsp"%>