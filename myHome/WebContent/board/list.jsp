<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, my.board.*" %>    
<!-- list.jsp -->
<%@ include file="../top.jsp"%>
<link rel="stylesheet" type="text/css" href="../style.css">
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
<jsp:useBean id="bdao" class="my.board.BoardDAO" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="bdao" value="<%=pool%>"/>		
<%
		List<BoardDTO> list = bdao.listBoard(); 
		if (list == null || list.size() == 0){%>
		<tr>
			<td colspan="6">등록된 게시글이 없습니다.</td>
		</tr>
<%	}else { 
			for(BoardDTO dto : list){%>
		<tr>
			<td><%=dto.getNum()%></td>
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
</div>

<%@ include file="../bottom.jsp"%>









