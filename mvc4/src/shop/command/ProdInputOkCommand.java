package shop.command;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import shop.dao.ProductBean;

public class ProdInputOkCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		MultipartRequest mr = null;
		String upPath = req.getServletContext().getRealPath("images");
		int len = 10*1024*1024;
		ProductBean dao = new ProductBean();
		try{
			mr = new MultipartRequest(req, upPath, len, "EUC-KR");
			int res = dao.insertProd(mr);
			if (res>0) {
				req.setAttribute("msg", "상품 등록 성공!! 상품 목록페이지로 이동합니다.");
				req.setAttribute("url", "prod_list.mall");
			}else {
				req.setAttribute("msg", "상품 등록 실패!! 상품 등록페이지로 이동합니다.");
				req.setAttribute("url", "prod_input.mall");
			}
		}catch(IOException e){
			req.setAttribute("msg", "상품등록시 오류 발생!! 관리자에게 문의하세요");
			req.setAttribute("url", "shopAdminIndex.mall");
			e.printStackTrace();
		}catch(SQLException e) {
			req.setAttribute("msg", "DB 오류 발생!! 관리자에게 문의하세요.");
			req.setAttribute("url", "shopAdminIndex.mall");
		}
		return "message.jsp";		
	}

}
