package com.semi.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.product.model.service.BookService;

/**
 * Servlet implementation class ProductEditCommentServlet
 */
@WebServlet("/product/productEditCom")
public class ProductEditCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductEditCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int mNo = Integer.parseInt(request.getParameter("mNo"));
		int bNo = Integer.parseInt(request.getParameter("bNo"));
		int score = Integer.parseInt(request.getParameter("score"));
		String com = request.getParameter("com");
		
		int result = new BookService().updateStarAndCom(mNo,bNo,score,com);
		
		if(result>0) {
			response.sendRedirect(request.getContextPath()+"/product/productDetail?no="+bNo);
		}else {
			request.setAttribute("msg", "한줄평 수정에 실패하였습니다");
			request.setAttribute("loc", "/product/productDetail?no="+bNo);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
