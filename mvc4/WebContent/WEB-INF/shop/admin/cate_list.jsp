<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, shop.dto.*" %>    
<!-- cate_list.jsp -->
<%@ include file="top.jsp"%>
<div align="center">
	<table border="1" width="500">
		<caption><font size="4"><b>ī�װ� ���</b></font></caption>
		<tr bgcolor="yellow">
			<th width="10%">��ȣ</th>
			<th width="30%">ī�װ��ڵ�</th>
			<th width="50%">ī�װ��̸�</th>
			<th width="10%">����</th>
		</tr>
<%
		List<CategoryDTO> list = (List)request.getAttribute("listCate");
		if (list == null || list.size() == 0){%>
		<tr>
			<td colspan="4">��ϵ� ī�װ��� �����ϴ�.</td>
		</tr>
<%	}else { 
			for(CategoryDTO dto : list){%>
		<tr>
			<td><%=dto.getCnum()%></td>
			<td><%=dto.getCode()%></td>
			<td><%=dto.getCname()%></td>
			<td><a href="cate_delete.mall?cnum=<%=dto.getCnum()%>">����</a></td>
		</tr>	
<%		} 
		}%>				
	</table>	
</div>
<%@ include file="bottom.jsp"%>







