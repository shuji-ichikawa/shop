package shop;

import java.io.IOException;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Administrator_Login_ProductsListController
 */
@WebServlet("/Administrator_Login_ProductsListController")
public class Administrator_Login_ProductsListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Administrator_Login_ProductsListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");

		ServletContext context = getServletContext();
		RequestDispatcher rd = context.getRequestDispatcher("/jsp/Administrator_Login.jsp");
		rd.forward(request, response);

	  }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");

		String Path = null;

		try{
			request.setCharacterEncoding("UTF-8");
			String ai = request.getParameter("ai");
			String ps = request.getParameter("ps");
			Pattern p1 = Pattern.compile("^([A-Za-z0-9]{1,8})$");
			Matcher m1 = p1.matcher(ai);
			boolean check = false;

			if(ai.length() == 0) {
				String msgai1 = "・ユーザーIDが入力されていません。";
				request.setAttribute("msgai1", msgai1);
				check = true;
			}else if(!(m1.find())){
				String msgai2 = "・半角英数字1～8文字で入力してください。";
				request.setAttribute("msgai2", msgai2);
				check = true;
			}

			if(ps.length() == 0) {
				String msgps1 = "・パスワードが入力されていません。";
				request.setAttribute("msgps1", msgps1);
				check = true;
			}else if(ps.length() > 16){
				String msgps2 = "・16文字以内で入力してください。";
				request.setAttribute("msgps2", msgps2);
				check = true;
			}

			if(check) {
				Path = "/jsp/Administrator_Login.jsp";
			}else {
				HttpSession session = request.getSession();
				session.setAttribute("Login", ai);
				int checks = AdministratorTableModel.LoginCheck(ai, ps);
				if(checks == AdministratorTableModel.match) {
					Path = "/jsp/Administrator_ProductsList.jsp";
		        	   ArrayList<ProductTableModel> List = ProductTableModel.selectAllList();
		        	   session.setAttribute("product_list", List);
				}else if(checks == AdministratorTableModel.difference) {
					Path = "/jsp/Administrator_LoginFail.jsp";
				}
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}

		ServletContext context = getServletContext();
		RequestDispatcher dispatcher = context.getRequestDispatcher(Path);
		dispatcher.forward(request, response);

	  }

}
