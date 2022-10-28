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
			if (dto == null){ // ���̵� ������
				req.setAttribute("msg", "�ش��ϴ� ���̵� �����ϴ�. �ٽ� Ȯ���Ͻð� �Է��� �ּ���!!");
				req.setAttribute("url", "login.mem");
				return "message.jsp";
			}else { // ���̵� ������
				if(dto.getPasswd().equals(passwd)) { // ��й�ȣ���� ��ġ�ϸ�
					req.setAttribute("msg", dto.getName() + "��, ȯ���մϴ�.");
					req.setAttribute("url", "index.mem");
					
					HttpSession session = req.getSession(); // ���ǿ� �������� ����
					session.setAttribute("mdto", dto);
					
					Cookie ck = new Cookie("saveId", id); // ��Ű�����
					if(saveId == null){ // '���̵� ���'�� üũ �� �Ǿ��־��ٸ�
						ck.setMaxAge(0); // ��Ű ���� 0
					}else{
						ck.setMaxAge(24*60*60); // üũ �ƴٸ� 1��
					}
					resp.addCookie(ck); //��Ű �߰� - ���ǿ� �� �ְ� �� resp�� ������ => ���ʿ� response�� ���尴ü(�޼���)��~!
					
				}else { // ��й�ȣ�� Ʋ����
					req.setAttribute("msg", "��й�ȣ�� Ʋ�Ƚ��ϴ�. �ٽ� Ȯ���Ͻð� �Է��� �ּ���!!");
					req.setAttribute("url", "login.mem");
					
				}
				return "message.jsp";
			}
			
		} catch (SQLException e) {
			req.setAttribute("msg", "DB ���� ���� �߻�!! �����ڿ��� �����ϼ���");
			req.setAttribute("url", "login.mem");
			return "message.jsp";
		}
		
		
	}

}
