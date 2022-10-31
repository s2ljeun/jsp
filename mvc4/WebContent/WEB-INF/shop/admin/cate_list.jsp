<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, shop.dto.*" %>    
<!-- cate_list.jsp -->
<%@ include file="top.jsp"%>
<div align="center">
	<table border="1" width="500">
		<caption><font size="4"><b>카테고리 목록</b></font></caption>
		<tr bgcolor="yellow">
			<th width="10%">번호</th>
			<th width="30%">카테고리코드</th>
			<th width="50%">카테고리이름</th>
			<th width="10%">삭제</th>
		</tr>
<%
		List<CategoryDTO> list = (List)request.getAttribute("listCate");
		if (list == null || list.size() == 0){%>
		<tr>
			<td colspan="4">등록된 카테고리가 없습니다.</td>
		</tr>
<%	}else { 
			for(CategoryDTO dto : list){%>
		<tr>
			<td><%=dto.getCnum()%></td>
			<td><%=dto.getCode()%></td>
			<td><%=dto.getCname()%></td>
			<td><a href="cate_delete.mall?cnum=<%=dto.getCnum()%>">삭제</a></td>
		</tr>	
<%		} 
		}%>				
	</table>	
</div>
<%@ include file="bottom.jsp"%>







