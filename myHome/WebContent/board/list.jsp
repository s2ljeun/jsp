<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, my.board.*" %>    
<!-- list.jsp -->
<%@ include file="../top.jsp"%>
<link rel="stylesheet" type="text/css" href="../style.css">
<jsp:useBean id="bdao" class="my.board.BoardDAO" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="bdao" value="<%=pool%>"/>		
<%
		int pageSize = 5;
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null){
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		int rowCount = bdao.getCount(); 
		if (endRow > rowCount) endRow = rowCount;
		List<BoardDTO> list = null;
		if (rowCount>0){
			list = bdao.listBoard(startRow, endRow); 
		}
		int num = rowCount - (startRow - 1);
%>
<div align="center"> 
	<b>글 목 록</b>
	<table border="0" width="100%">
		<tr bgcolor="yellow">
			<td align="right"><a href="writeForm.jsp">글쓰기</a></td>
		</tr>
	</table>
	<table border="1" width="100%">
		<tr bgcolor="green">
			<th>번호</th>
			<th width="30%">제 목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회</th>
			<th>IP</th>
		</tr>
<%
		
		if (list == null || list.size() == 0){%>
		<tr>
			<td colspan="6">등록된 게시글이 없습니다.</td>
		</tr>
<%	}else { 
			for(BoardDTO dto : list){%>
		<tr>
			<td><%=num--%></td>
			<td>
				<a href="content.jsp?num=<%=dto.getNum()%>">
		<%	if(dto.getRe_level() > 0){ %>
					<img src="../img/level.gif" width="<%=dto.getRe_level()*10%>">
					<img src="../img/re.gif">
		<%	} %>				
					<%=dto.getSubject()%>
				</a>
		<% 	if (dto.getReadcount() > 10){%>
					<img src="../img/hot.gif">
		<%	} %>		
			</td>
			<td><%=dto.getWriter()%></td>
			<td><%=dto.getReg_date()%></td>
			<td><%=dto.getReadcount()%></td>
			<td><%=dto.getIp()%></td>
		</tr>	
<%		}	
		} %>				
	</table>
<%	if (rowCount>0){ 
			int pageCount = rowCount / pageSize + (rowCount%pageSize==0 ? 0 : 1);
			int pageBlock = 3;
			int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;
			if (endPage > pageCount) endPage = pageCount;
			
			if (startPage > pageBlock){%>
			[<a href="list.jsp?pageNum=<%=startPage-1%>">이전</a>]
<%		} %>
<%		for (int i=startPage; i<=endPage; ++i){ %>
			[<a href="list.jsp?pageNum=<%=i%>"><%=i%></a>]
<%		} %>
<%		if (pageCount > endPage){ %>
			[<a href="list.jsp?pageNum=<%=endPage+1%>">다음</a>]
<%		} %>
<%	} %>	
</div>

<%@ include file="../bottom.jsp"%>









