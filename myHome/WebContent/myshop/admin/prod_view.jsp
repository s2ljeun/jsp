<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="my.shop.*"%>
<!-- prod_view.jsp -->
<%
		String pnum = request.getParameter("pnum");
		if (pnum == null || pnum.trim().equals("")){
			response.sendRedirect("main.jsp");
			return;
		}
%>
<jsp:useBean id="pdao" class="my.shop.ProductBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="pdao" value="<%=pool%>"/>
<%
		ProductDTO dto = pdao.getProduct(Integer.parseInt(pnum));
%>
<%@ include file="top.jsp"%>
<div align="center">
	<form name="f" action="prod_list.jsp" method="post">
		<table class="outline" width="80%">
			<caption><font size="4"><b>상품상세보기</b></font></caption>
			<tr>
				<th class="m2" width="15%">카테고리</th>
				<td width="35%"><%=dto.getPcategory_fk()%></td>
				<th class="m2" width="15%">상품번호</th>
				<td width="35%"><%=dto.getPnum()%></td>
			</tr>
			<tr>
				<th class="m2" width="15%">상품명</th>
				<td width="35%"><%=dto.getPname()%></td>
				<th class="m2" width="15%">제조회사</th>
				<td width="35%"><%=dto.getPcompany()%></td>
			</tr>
			<tr>
				<th class="m2" width="15%">상품이미지</th>
				<td width="85%" colspan="3">
				<%	String filename = config.getServletContext().getRealPath("/myshop/images");
					filename += "/" + dto.getPimage();%>
					<img src="<%=filename%>" width="200" height="150">
				</td>
			</tr>
			<tr>
				<th class="m2" width="15%">상품수량</th>
				<td width="35%"><%=dto.getPqty()%></td>
				<th class="m2" width="15%">상품가격</th>
				<td width="35%"><%=dto.getPrice()%></td>
			</tr>
			<tr>
				<th class="m2" width="15%">상품스팩</th>
				<td width="35%"><%=dto.getPspec()%></td>
				<th class="m2" width="15%">상품포인트</th>
				<td width="35%"><%=dto.getPoint()%></td>
			</tr>
			<tr>
				<th class="m2" width="15%">상품소개</th>
				<td width="85%" colspan="3">
					<textarea name="contents" rows="5" cols="50" disabled><%=dto.getPcontents()%></textarea>
				</td>
			</tr>
			<tr>
				<td class="m1" align="center" colspan="4">
					<input type="submit" value="돌아가기">
				</td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="bottom.jsp"%>














