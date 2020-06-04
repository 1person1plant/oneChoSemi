package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.me")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      String id = request.getParameter("memberId");
	      String pwd = request.getParameter("memberPwd");
	      
	      Member member = new Member(id, pwd);
	      
	      System.out.println("로그인 서블릿 아이디,비번 : " + id + "," + pwd);
     
	      Member loginUser = new MemberService().loginMember(member);
	      
	      if(loginUser != null) {	// 로그인 할 수 있는 사용자이면
	    	  HttpSession session = request.getSession();
	    	  
	    	  String adminChk = loginUser.getMemberAdmin();
	    	  System.out.println("serv "+ adminChk);
	    	  
	    	  session.setAttribute("loginUser", loginUser);
	    	  session.setAttribute("admin", adminChk);
	    	  
	    	  response.sendRedirect("index.jsp");
	      }else {					// 로그인을 할 수 없는 id와 pwd이면
	    	  request.setAttribute("msg", "로그인 실패");
	    	  // 페이지에 전달하고자 하는 객체를 request의 attribute에 넣었다
	    	  
	    	  RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
	    	  // 사용자에게 보여질 페이지를 RequestDispatcher 객체로 만든다.
	    	  
	    	  view.forward(request, response);
	    	  
	      }
//	      response.sendRedirect("index.jsp");
	   }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
