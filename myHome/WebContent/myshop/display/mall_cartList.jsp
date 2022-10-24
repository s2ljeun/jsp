<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.text.*"%>    
<%@ include file="mall_top.jsp"%>
<div algin="center" style="overflow:auto; width:100%; height:500">
	<table width="100%" border="1">
		<tr class="m2">
			<td colspan="6" align="center">
				<h4>장바구니 보기</h4>
			</td>
		</tr>
		<tr class="m1">
			<th width="10%">번호</th>
			<th width="25%">상품명</th>
			<th width="15%">수량</th>
			<th width="20%">단가</th>
			<th width="20%">금액</th>
			<th width="10%">삭제</th>
		</tr>
<jsp:useBean id="prodList" class="my.shop.mall.ProductList" scope="session"/>
<jsp:setProperty property="pool" name="prodList" value="<%=pool%>"/>		
<jsp:useBean id="cart" class="my.shop.mall.CartBean" scope="session"/>
<jsp:setProperty property="plist" name="cart" value="<%=prodList%>"/>
<%
		List<ProductDTO> cartList = cart.listCart();
		DecimalFormat df = new DecimalFormat("###,###");
		String upPath = config.getServletContext().getRealPath("/myshop/images");
		if (cartList == null || cartList.size() == 0){%>
		<tr>
			<td colspan="6">장바구니에 등록된 상품이 없습니다.</td>
		</tr>
<%	}else { 
			int totalCartPrice = 0;
			int totalCartPoint = 0;
			for(ProductDTO dto : cartList){%>
		<tr>
			<td align="right"><%=dto.getPnum()%></td>
			<td align="center">
				<img src="<%=upPath%>/<%=dto.getPimage()%>" width="50" height="40"><br>
				<%=dto.getPname()%>
			</td>
			<td>
				<form action="mall_cartEdit.jsp" method="post">
					<input type="text" name="pqty" value="<%=dto.getPqty()%>" size="2">개
					<input type="hidden" name="pnum" value="<%=dto.getPnum()%>">
					<input type="submit" value="수정">
				</form>	
			</td>	
			<td align="right">
				<%=df.format(dto.getPrice())%>원<br>
				<%=dto.getPoint()%>point
			</td>
			<td align="right">
				<%=df.format(dto.getPrice()*dto.getPqty())%>원<br>
				<%=dto.getPoint()*dto.getPqty()%>point
			</td>
			<td align="center"><a href="mall_cartDel.jsp?pnum=<%=dto.getPnum()%>">삭제</a></td>
		</tr>			
<%		totalCartPrice += dto.getPrice() * dto.getPqty();
			totalCartPoint += dto.getPoint() * dto.getPqty();
			} %>
		<tr class="m1">
			<td colspan="4">
				<b>장바구니총액 : </b>
				<font color="red"><%=df.format(totalCartPrice)%></font>원<br>
				총 적립 포인트 :
				<font color="green"><%=totalCartPoint%></font>point
			</td>
			<td colspan="2">
				[<a href="mall_order.jsp?mode=cart">주문하기</a>]
				[<a href="javascript:history.go(-2)">계속쇼핑</a>]
			</td>
		</tr>		
<%	}%>			
	</table>
</div>
<%@ include file="mall_bottom.jsp"%>













