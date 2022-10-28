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
		session.invalidate(); //���ǿ� ����� �������� ��ü����~
		
		req.setAttribute("msg", "�α׾ƿ� �Ǿ����ϴ�. �α��� �������� �̵��մϴ�.");
		req.setAttribute("url", "login.mem");
		return "message.jsp";
	}

}
