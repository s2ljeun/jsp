<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.text.*"%>
<!-- mall_prodView.jsp -->
<%
		String pnum = request.getParameter("pnum");
		String select = request.getParameter("select");
		if (pnum == null || pnum.trim().equals("") ||
				select == null || select.trim().equals("")){
			response.sendRedirect("mall.jsp");
			return;
		}
%>
<%@ include file="mall_top.jsp"%>
<script type="text/javascript">
	function goCart(){
		document.go.action="<%=request.getContextPath()%>/myshop/display/mall_cartAdd.jsp"
		document.go.submit()
	}
	function goOrder(){
		document.go.action="<%=request.getContextPath()%>/myshop/display/mall_order.jsp"
		document.go.submit()
	}
</script>
<jsp:useBean id="prodList" class="my.shop.mall.ProductList" scope="session"/>
<jsp:setProperty property="pool" name="prodList" value="<%=pool%>"/>
<%
		DecimalFormat df = new DecimalFormat("###,###");
		ProductDTO dto = prodList.getProduct(Integer.parseInt(pnum), select);
		String upPath = config.getServletContext().getRealPath("/myshop/images");
%>
<div align="center">
	<table class="outline" width="100%">
		<tr class="m1">
			<td colspan="2" align="center">
				<b>[<%=dto.getPname()%>] 상품 정보</b>
			</td>
		</tr>
		<tr>
			<td width="50%" align="center" class="m3">
				<img src="<%=upPath%>/<%=dto.getPimage()%>" width="200" height="180">
			</td>
			<td width="50%" class="m3">
				상품번호 : <%=dto.getPnum()%><br>
				상품이름 : <%=dto.getPname()%><br>
				상품가격 : <font color="red"><%=df.format(dto.getPrice())%></font>원<br>
				상품포인트 : <font color="green"><%=df.format(dto.getPoint())%></font>point<br>
				<form name="go" method="post">
				상품갯수 : <input type="text" name="pqty" value="1" size="2">개<br><br>
					<input type="hidden" name="pnum" value="<%=dto.getPnum()%>"/>
					<input type="hidden" name="select" value="<%=select%>"/>
				</form>
				<a href="javascript:goCart()">장바구니담기</a> | 
				<a href="javascript:goOrder()">즉시 구매하기</a>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<b>상품 상세 설명</b><br>
				<%=dto.getPcontents()%>
			</td>
		</tr>
	</table>
</div>
<%@ include file="mall_bottom.jsp"%>












