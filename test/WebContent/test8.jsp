<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- test8.html -->
<form name="f" action="result.jsp" method="post">
	아이디: <input type="text" name="id" value="아이디"><br>
	비밀번호: <input type="password" name="pwd"><br>
	<input type="hidden" name="tel" value="123-1234">
	
	내용:
	<textarea name="content" rows="5" cols="50"></textarea><br>
	하고싶은 공부:
	<select name="sub">
		<option value="C">C언어</option>
		<option value="java">java언어</option>
		<option value="python">python언어</option>
		<option value="go">go언어</option>
	</select><br>
	
	<input type="submit" value="로그인">
	<input type="reset" value="다시입력">
</form>

<!-- 
request <= http통신 <= 주소(get방식)+header+body(post방식)
get방식으로 보내든 post방식으로 보내든 request에서는 getParamater로 끄집어냄
 -->