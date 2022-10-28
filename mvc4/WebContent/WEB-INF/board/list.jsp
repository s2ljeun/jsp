<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, board.dto.*" %>    
<!-- list.jsp -->
<html>
<head>
	<title>게시글보기</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>	
<body>
<div align="center"> 
	<b>글 목 록</b>
	<table border="0" width="50%">
		<tr bgcolor="yellow">
			<td align="right">
				<a href="index.do">메인으로</a>
				<a href="writeForm.board">글쓰기</a>
			</td>
		</tr>
	</table>
	<table border="1" width="50%">
		<tr bgcolor="green">
			<th>번호</th>
			<th width="30%">제 목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회</th>
			<th>IP</th>
		</tr>
<%
		List<BoardDTO> list = (List)request.getAttribute("listBoard");
		if (list == null || list.size() == 0){%>
		<tr>
			<td colspan="6">등록된 게시글이 없습니다.</td>
		</tr>
<%	}else { 
			int num = (Integer)request.getAttribute("num");
			for(BoardDTO dto : list){%>
		<tr>
			<td><%=num--%></td>
			<td>
				<a href="content.board?num=<%=dto.getNum()%>">
		<%	if(dto.getRe_level() > 0){ %>
					<img src="img/level.gif" width="<%=dto.getRe_level()*10%>">
					<img src="img/re.gif">
		<%	} %>				
					<%=dto.getSubject()%>
				</a>
		<% 	if (dto.getReadcount() > 10){%>
					<img src="img/hot.gif">
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
<%	if (list != null && list.size() != 0){ 
			int pageCount = (Integer)request.getAttribute("pageCount");
			int pageBlock = (Integer)request.getAttribute("pageBlock");
			int startPage = (Integer)request.getAttribute("startPage");
			int endPage = (Integer)request.getAttribute("endPage");
			if (startPage > pageBlock){%>
			[<a href="list.board?pageNum=<%=startPage-1%>">이전</a>]
<%		} %>
<%		for (int i=startPage; i<=endPage; ++i){ %>
			[<a href="list.board?pageNum=<%=i%>"><%=i%></a>]
<%		} %>
<%		if (pageCount > endPage){ %>
			[<a href="list.board?pageNum=<%=endPage+1%>">다음</a>]
<%		} %>
<%	} %>
</div>
</body>
</html>










