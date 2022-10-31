package shop.command;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.dao.ProductBean;

public class ProdDeleteCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String pnum = req.getParameter("pnum");
		String pimage = req.getParameter("pimage");
		ProductBean dao = new ProductBean();
		try {
			int res = dao.deleteProd(Integer.parseInt(pnum));
			if (res>0) {
				String upPath = req.getServletContext().getRealPath("/myshop/images");
				File file = new File(upPath, pimage);
				if (file.exists()) {
					file.delete();
					req.setAttribute("msg", "��ǰ ���� ����(�̹����� ���� ����)!! ��ǰ ��� �������� �̵��մϴ�.");
				}else {
					req.setAttribute("msg", "��ǰ ���� ����(�̹��� ���� ����)!! ��ǰ ����������� �̵��մϴ�.");
				}
			}else {
				req.setAttribute("msg", "��ǰ ���� ����!! ��ǰ ����������� �̵��մϴ�.");
			}
		}catch(SQLException e) {
			req.setAttribute("msg", "DB ���� �߻�!! �����ڿ��� �����ϼ���.");
			req.setAttribute("url", "shopAdminIndex.mall");
			return "message.jsp";
		}
		req.setAttribute("url", "prod_list.mall");
		return "message.jsp";
	}

}
