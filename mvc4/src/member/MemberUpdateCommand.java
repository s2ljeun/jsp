package member;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberUpdateCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String no = req.getParameter("no");
		MemberDAO dao = new MemberDAO();
		try {
			MemberDTO dto = dao.getMember(Integer.parseInt(no));
			req.setAttribute("getMember", dto);
			return "WEB-INF/member/member_update.jsp";
		}catch(SQLException e) {
			req.setAttribute("msg", "DB 서버 오류 발생!! 관리자에게 문의하세요");
			req.setAttribute("url", "index.mem");
			return "message.jsp";
		}
	}

}
