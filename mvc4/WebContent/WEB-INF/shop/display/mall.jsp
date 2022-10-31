<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.text.*"%>
<!-- mall.jsp -->
<%@ include file="mall_top.jsp"%>
<%
		DecimalFormat df = new DecimalFormat("###,###");
%>
<div align="center"  style="overflow:scroll; width:100%; height:500">
	<h3>Welcome to My Mall</h3>
<%	List<ProductDTO> plist1 = (List)request.getAttribute("hitList"); 
		if (plist1 == null || plist1.size() == 0){
			out.println("<b>HIT 상품이 없습니다.</b>");
		}else {%>
		<hr color="green" width="80%">
		<font size="5">HIT</font>	
		<hr color="green" width="80%">
		<table border="0" width="80%">
			<tr>
<%			String upPath = config.getServletContext().getRealPath("images");	
				int count = 0;
				for(ProductDTO pdto : plist1){ %>
				<td align="center">
					<a href="mall_prodView.mall?pnum=<%=pdto.getPnum()%>&select=HIT">
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
<%	List<ProductDTO> plist2 = (List)request.getAttribute("bestList"); 
		if (plist2 == null || plist2.size() == 0){
			out.println("<b>BEST 상품이 없습니다.</b>");
		}else {%>
		<hr color="green" width="80%">
		<font size="5">BEST</font>	
		<hr color="green" width="80%">
		<table border="0" width="80%">
			<tr>
<%			String upPath = config.getServletContext().getRealPath("images");	
				int count = 0;
				for(ProductDTO pdto : plist2){ %>
				<td align="center">
					<a href="mall_prodView.mall?pnum=<%=pdto.getPnum()%>&select=BEST">
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
<%	List<ProductDTO> plist3 = (List)request.getAttribute("newList"); 
		if (plist3 == null || plist3.size() == 0){
			out.println("<b>NEW 상품이 없습니다.</b>");
		}else {%>
		<hr color="green" width="80%">
		<font size="5">NEW</font>	
		<hr color="green" width="80%">
		<table border="0" width="80%">
			<tr>
<%			String upPath = config.getServletContext().getRealPath("images");	
				int count = 0;
				for(ProductDTO pdto : plist3){ %>
				<td align="center">
					<a href="mall_prodView.mall?pnum=<%=pdto.getPnum()%>&select=NEW">
						<img src="<%=upPath%>/<%=pdto.getPimage()%>" width="80" height="60">
					</a>
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











	