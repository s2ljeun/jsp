package shop.command;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import shop.dao.ProductBean;

public class ProdUpdateOkCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		MultipartRequest mr = null;
		String upPath = req.getServletContext().getRealPath("images");
		int len = 10*1024*1024;
		ProductBean dao = new ProductBean();
		try{
			mr = new MultipartRequest(req, upPath, len, "EUC-KR");
			int res = dao.updateProd(mr);
			if (res>0) {
				req.setAttribute("msg", "��ǰ ���� ����!! ��ǰ ��� �������� �̵��մϴ�.");
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
