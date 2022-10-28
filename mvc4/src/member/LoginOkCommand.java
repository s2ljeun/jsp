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
		String msg = null, url = null;
		try {
			MemberDTO dto = dao.getMember(id);
			if (dto == null){ // 아이디가 없으면
				req.setAttribute("msg", "해당하는 아이디가 없습니다. 다시 확인하시고 입력해 주세요!!");
				req.setAttribute("url", "login.mem");
				return "message.jsp";
			}else { // 아이디가 있으면
				if(dto.getPasswd().equals(passwd)) { // 비밀번호까지 일치하면
					req.setAttribute("msg", dto.getName() + "님, 환영합니다.");
					req.setAttribute("url", "index.mem");
					
					HttpSession session = req.getSession(); // 세션에 계정정보 저장
					session.setAttribute("mdto", dto);
					
					Cookie ck = new Cookie("saveId", id); // 쿠키만들기
					if(saveId == null){ // '아이디 기억'이 체크 안 되어있었다면
						ck.setMaxAge(0); // 쿠키 생명 0
					}else{
						ck.setMaxAge(24*60*60); // 체크 됐다면 1일
					}
					resp.addCookie(ck); //쿠키 추가 - 세션에 안 넣고 왜 resp에 넣을까 => 애초에 response의 내장객체(메서드)임~!
					
				}else { // 비밀번호만 틀리면
					req.setAttribute("msg", "비밀번호가 틀렸습니다. 다시 확인하시고 입력해 주세요!!");
					req.setAttribute("url", "login.mem");
					
				}
				return "message.jsp";
			}
			
		} catch (SQLException e) {
			req.setAttribute("msg", "DB 서버 오류 발생!! 관리자에게 문의하세요");
			req.setAttribute("url", "login.mem");
			return "message.jsp";
		}
		
		
	}

}
