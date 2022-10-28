package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		session.invalidate(); //세션에 저장된 계정정보 전체삭제~
		
		req.setAttribute("msg", "로그아웃 되었습니다. 로그인 페이지로 이동합니다.");
		req.setAttribute("url", "login.mem");
		return "message.jsp";
	}

}
