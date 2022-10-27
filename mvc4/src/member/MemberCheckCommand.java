package member;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberCheckCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String name = req.getParameter("name");
		String ssn1 = req.getParameter("ssn1");
		String ssn2 = req.getParameter("ssn2");
		
		MemberDAO dao = new MemberDAO();
		String msg = null, url = null;
		try {
			boolean isMember = dao.checkMember(name, ssn1, ssn2);
			if (isMember) {
				msg = "���� ȸ���̽ʴϴ�. �α����� �� �ּ���!!";
				req.setAttribute("msg", msg);
				return "closeWindow.jsp";
			}else {
				msg = "ȸ�������������� �̵��մϴ�.";
				url = "member_input.mem";
				HttpSession session = req.getSession();
				session.setAttribute("name", name);
				session.setAttribute("ssn1", ssn1);
				session.setAttribute("ssn2", ssn2);
				req.setAttribute("msg", msg);
				req.setAttribute("url", url);
				return "message.jsp";
			}
		}catch(SQLException e) {
			msg = "DB ���� ���� �߻�!! �����ڿ��� �����ϼ���";
			req.setAttribute("msg", msg);
			return "closeWindow.jsp";
		}
	}

}
