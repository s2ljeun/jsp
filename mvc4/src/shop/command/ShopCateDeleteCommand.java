package shop.command;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.dao.CategoryDAO;
import shop.dto.CategoryDTO;

public class ShopCateDeleteCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		int cnum = Integer.parseInt(req.getParameter("cnum"));
		CategoryDAO dao = new CategoryDAO();
		try {
			int res = dao.deleteCate(cnum);
			if(res>0) {
				req.setAttribute("msg", "ī�װ� ��������! ī�װ� ������� �̵��մϴ�.");
				req.setAttribute("url", "cate_list.mall");
			}else {
				req.setAttribute("msg", "ī�װ� ��������! ī�װ� ������� �̵��մϴ�.");
				req.setAttribute("url", "cate_list.mall");
			}
		}catch(SQLException e) {
			req.setAttribute("msg", "db����! ������ ����");
			req.setAttribute("url", "index.do");
		}
		return "message.jsp";
	}
}
