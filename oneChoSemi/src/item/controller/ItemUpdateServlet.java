package item.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import item.model.vo.Item;

/**
 * Servlet implementation class ItemUpdateServlet
 */
@WebServlet("/update.it")
public class ItemUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		
		int maxSize=1024*1024*10;
		String root=request.getSession().getServletContext().getRealPath("/");
		String savePath=root+"items_uploadFiles/";
		MultipartRequest multiRequest=new MultipartRequest(request,savePath,maxSize,"UTF-8",new DefaultFileRenamePolicy());
		
		
		
		//수정값 받아오기
		String name=multiRequest.getParameter("modifyName");
		String exhibit=multiRequest.getParameter("modifyExhibit");
		int price=Integer.valueOf(multiRequest.getParameter("modifyPrice"));
		int discount=Integer.valueOf(multiRequest.getParameter("modifyDiscount"));
		int limit=Integer.valueOf(multiRequest.getParameter("modifyLimit"));
		String category=multiRequest.getParameter("modifyCategory");
		String keyword=multiRequest.getParameter("modifyKeyword");
		String info=multiRequest.getParameter("modifyInfo");
		
		Item item=new Item(name,category,keyword,price,discount,exhibit,info,limit);
		
		System.out.println(item);
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
