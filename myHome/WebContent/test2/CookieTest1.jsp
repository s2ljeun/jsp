<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- CookieTest1.jsp -->
<%
	//��Ű�� �����ؼ� ������ ��, Ŭ���̾�Ʈ�� ���������� ����...
	//1. ��Ű����
	Cookie ck = new Cookie("insa", "HelloJSP");//���� ����, �����ݷ�, �޸�, ���� ���Ұ�
	//2. ��Ű�� �����ֱ�
	ck.setMaxAge(24*60*60); //�ʴ����� �����ش�
	//����: ��Ű ����: �����ֱⰪ�� 0���� �ؼ� �ش� ��Ű�� �����ش�. ���� ���� ���� X ��ŷ

	//3. Ŭ���̾�Ʈ�� ����������
	response.addCookie(ck);
	
%>
<h2>��Ű ���� ��!!</h2>