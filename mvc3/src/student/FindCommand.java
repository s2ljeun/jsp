package student;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FindCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String name = req.getParameter("name");
		StudentDAO dao = new StudentDAO();
		try {
			List<StudentDTO> list = dao.findStudent(name);
			req.setAttribute("listStudent", list);
			return "list.jsp";
		}catch(SQLException e) {
			req.setAttribute("msg", "DB오류 발생!! 관리자에게 문의해 주세요.");
			req.setAttribute("url", "student.do?command=start");
			e.printStackTrace();
			return "message.jsp";
		}		
	}

}
