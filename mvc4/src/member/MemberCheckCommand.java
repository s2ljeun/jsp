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
				msg = "저희 회원이십니다. 로그인을 해 주세요!!";
				req.setAttribute("msg", msg);
				return "closeWindow.jsp";
			}else {
				msg = "회원가입페이지로 이동합니다.";
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
			msg = "DB 서버 오류 발생!! 관리자에게 문의하세요";
			req.setAttribute("msg", msg);
			return "closeWindow.jsp";
		}
	}

}
