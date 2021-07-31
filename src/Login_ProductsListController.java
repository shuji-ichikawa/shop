package shop;

import java.io.IOException;
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
 * Servlet implementation class Page1to2Controller
 */
@WebServlet("/Login_ProductsListController")
public class Login_ProductsListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login_ProductsListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		try{
			HttpSession session = request.getSession();
			String Login_id = request.getParameter("Login_id");
			if(!(session.getAttribute("Login").equals(Login_id))) {
				session.setAttribute("Login", Login_id);
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		ServletContext context = getServletContext();
		RequestDispatcher rd = context.getRequestDispatcher("/jsp/ProductsList.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String Path = null;

		try{
			String ki = request.getParameter("ki");
			String ps = request.getParameter("ps");
			Pattern p1 = Pattern.compile("^([A-Za-z0-9]{1,8})$");
			Matcher m1 = p1.matcher(ki);
			boolean check = false;

			if(ki.length() == 0) {
				String msgki1 = "・ユーザーIDが入力されていません。";
				request.setAttribute("msgki1", msgki1);
				check = true;
			}else if(!(m1.find())){
				String msgki2 = "・半角英数字1～8文字で入力してください。";
				request.setAttribute("msgki2", msgki2);
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
				Path = "/jsp/Login.jsp";
			}else {
				HttpSession session = request.getSession();
				session.setAttribute("Login", ki);
				int checks = CustomerTableModel.LoginCheck(ki, ps);
				if(checks == CustomerTableModel.match) {
					Path = "/jsp/LoginDone.jsp";
				}else if(checks == CustomerTableModel.difference) {
					Path = "/jsp/LoginFail.jsp";
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
