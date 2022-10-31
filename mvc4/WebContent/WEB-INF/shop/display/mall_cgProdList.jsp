<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.text.*"%>
<!-- mall_cgProdList.jsp -->
<%@ include file="mall_top.jsp"%>
<%
		DecimalFormat df = new DecimalFormat("###,###");
		String code = (String)request.getAttribute("code");
		String cname = (String)request.getAttribute("cname");
%>
<div align="center">
<%	List<ProductDTO> plist = (List)request.getAttribute("pcode");
		if (plist == null || plist.size() == 0){
			out.println("<b>"+cname+" 카테고리에 상품이 없습니다.</b>");
		}else {%>
		<hr color="green" width="80%">
		<font size="5"><%=cname%></font>	
		<hr color="green" width="80%">
		<table border="0" width="80%">
			<tr>
<%			String upPath = config.getServletContext().getRealPath("images");	
				int count = 0;
				for(ProductDTO pdto : plist){ %>
				<td align="center">
					<a href="mall_prodView.mall?pnum=<%=pdto.getPnum()%>&select=<%=code%>">
						<img src="<%=upPath%>/<%=pdto.getPimage()%>" width="80" height="60">
					</a>	
					<br>
					<%=pdto.getPname()%><br>
					<font color="red"><%=df.format(pdto.getPrice())%></font>원<br>
					<font color="green">[<%=pdto.getPoint()%>]</font>point
				</td>
<%				count++;
					if (count%3==0){%>
						</tr><tr>					
<%				}
				}%>				
			</tr>
		</table>
<%	} %>	
</div>
<%@ include file="mall_bottom.jsp"%>














