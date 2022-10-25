// �������� java������ ������ ����� ���� -> useBean�� �������
// ���������� �� ������ �����ϱ� ���ؼ��� web.xml�� ������ش�.

// web.xml
// <servlet> ���� <servlet-mapping> url-pattern
// <servlet-name>�� ���� �ͳ��� �����

/*
���� Ŭ���� �����
1. extends HttpServlet
2. doGet, doPost, service �޼ҵ� �� �ϳ� �̻��� �������̵� �Ѵ� //get��� post��� �Ѵ����Թ��
3. web.xml�� ���� Ŭ������ ����Ѵ�

---

����Ŭ���� �����
1. extends Exception
2. getMessage()�޼ҵ带 �������̵� �Ѵ�

��Ƽ������ �����
1. extends Thread / implements Runnable
2. run()�޼ҵ带 �������̵� �Ѵ�
 */
package testServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html charset=EUC-KR");
		PrintWriter pw = resp.getWriter();
		pw.println("Hello, Servlet!!");
	}

}
