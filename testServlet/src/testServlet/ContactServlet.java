// 서블릿 클래스 -> 서버에서 실행되는 자바클래그(프로그램)
package testServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ContactServlet extends HttpServlet {

//doGet doPost service의 메소드 형식은 똑같다. request의 방식에 따라 알맞게 사용.

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("EUC-KR"); // post방식에서의 한글처리
		resp.setContentType("text/html; charset=EUC-KR"); // 받는 곳(response)의 글꼴, 파일형식설정
		
		String name = req.getParameter("name");
		String addr = req.getParameter("addr");
		
		PrintWriter pw = resp.getWriter(); //줄 단위로 웹화면(reponse)에 텍스트출력을 위해 작성
		// 내장객체 X -> jsp가 자바코드로 변환할 때 끌어와서 생기는 것인데 / 내가 작성하고 있으므로... 
		pw.println("<h2>" + name + "님의 주소는 " + addr + "입니다.</h2>");
		
	}

}
