<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- test7.jsp -->
<div align="center">
	<table border="1">
		<% for(int i=2; i<=9; ++i){ %>
			<th><%=i%>??</th>
		<%
		}
		%>
		
		
		<%
		for(int i=1; i<10; ++i){%>
			<tr>
			<%
			for(int j=2; j<10; ++j){
			%>
				<td><%=j%> X <%=i%>= <%=j*i%></td>
			<%
			}
			 %>
			</tr>
			<%
		}
		 %>
	</table>
</div>