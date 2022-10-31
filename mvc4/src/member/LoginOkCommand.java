package member;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginOkCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String id = req.getParameter("id");
		String passwd = req.getParameter("passwd");
		String saveId = req.getParameter("saveId");
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = null;
		try{
			dto = dao.getMember(id);
		}catch(SQLException e) {
			req.setAttribute("msg", "DB 서버 오류 발생!! 관리자에게 문의하세요");
			req.setAttribute("url", "index.mem");
			return "message.jsp";
		}
		if (dto == null){
			req.setAttribute("msg", "해당하는 아이디가 없습니다. 다시 확인하시고 입력해 주세요!!");
			req.setAttribute("url", "login.mem");
		}else {
			if (dto.getPasswd().equals(passwd)){
				req.setAttribute("msg", dto.getName()+"님, 환영합니다.");
				req.setAttribute("url", "index.do");
				//세션저장
				HttpSession session = req.getSession();
				session.setAttribute("mdto", dto);
				//쿠키전송
				Cookie ck = new Cookie("saveId", id);
				if (saveId == null) ck.setMaxAge(0);
				else ck.setMaxAge(24*60*60);
				resp.addCookie(ck);
			}else {
				req.setAttribute("msg", "비밀번호가 틀렸습니다. 다시 확인하시고 입력해 주세요!!");
				req.setAttribute("url", "login.mem");
			}
		}
		return "message.jsp";
	}

}
