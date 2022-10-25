// 웹에서는 java파일을 실행할 방법이 없다 -> useBean을 사용했음
// 마찬가지로 이 파일을 실행하기 위해서는 web.xml에 등록해준다.

// web.xml
// <servlet> 서블릿 <servlet-mapping> url-pattern
// <servlet-name>이 같은 것끼리 연결됨

/*
서블릿 클래스 만들기
1. extends HttpServlet
2. doGet, doPost, service 메소드 중 하나 이상을 오버라이드 한다 //get방식 post방식 둘다포함방식
3. web.xml에 서블릿 클래스를 등록한다

---

예외클래스 만들기
1. extends Exception
2. getMessage()메소드를 오버라이드 한다

멀티스레드 만들기
1. extends Thread / implements Runnable
2. run()메소드를 오버라이드 한다
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
