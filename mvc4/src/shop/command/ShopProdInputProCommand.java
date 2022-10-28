package shop.command;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import shop.dao.ProductDAO;
import shop.dto.ProductDTO;

public class ShopProdInputProCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		MultipartRequest mr = null;
		String upPath = req.getServletContext().getRealPath("images");
		int len = 10*1024*1024;
		mr = new MultipartRequest(req, upPath, len, "EUC-KR");
		ProductDAO dao = new ProductDAO();
		
		try {
			int res = dao.insertProd(mr);
			if (res>0){
				req.setAttribute("msg", "상품 등록성공! 상품 목록으로 이동합니다.");
				req.setAttribute("url", "prod_list.mall");
			}else {
				req.setAttribute("msg", "상품 등록실패! 상품 목록으로 이동합니다.");
				req.setAttribute("url", "prod_list.mall");
			}
		} catch (SQLException e) {
			req.setAttribute("msg", "db에러! 관리자 문의");
			req.setAttribute("url", "index.do");
		}
		
		return "message.jsp";
	}

}
