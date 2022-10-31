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
					req.setAttribute("msg", "상품 삭제 성공(이미지도 삭제 성공)!! 상품 목록 페이지로 이동합니다.");
				}else {
					req.setAttribute("msg", "상품 삭제 성공(이미지 삭제 실패)!! 상품 목록페이지로 이동합니다.");
				}
			}else {
				req.setAttribute("msg", "상품 삭제 실패!! 상품 목록페이지로 이동합니다.");
			}
		}catch(SQLException e) {
			req.setAttribute("msg", "DB 오류 발생!! 관리자에게 문의하세요.");
			req.setAttribute("url", "shopAdminIndex.mall");
			return "message.jsp";
		}
		req.setAttribute("url", "prod_list.mall");
		return "message.jsp";
	}

}
