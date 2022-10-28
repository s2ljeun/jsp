import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FrontAppServlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) 
															throws ServletException, IOException {
		req.setCharacterEncoding("EUC-KR");
		resp.setContentType("text/html; charset=EUC-KR");
		//주소로 command값을 구하기
		String reqUri = req.getRequestURI();
		String path = req.getContextPath();
		String cmd = reqUri.substring(path.length());
		
		String nextPage = null;
		if (cmd.equals("/member_index.do")) {
			nextPage = "index.mem";
		}else if (cmd.equals("/board_list.do")) {
			nextPage = "list.board";
		}else if (cmd.equals("/shop_mall.do")) {
			nextPage = "mall.mall";
		}else if (cmd.equals("/index.do")) {
			nextPage = "index.jsp";
		}else if (cmd.equals("/shop_admin.do")) {
			nextPage = "shopAdmin.mall";
		}
		
		RequestDispatcher view = req.getRequestDispatcher(nextPage);
		view.forward(req, resp);
	}
}














