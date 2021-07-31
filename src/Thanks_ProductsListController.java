package shop;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Thanks_ProductsListController
 */
@WebServlet("/Thanks_ProductsListController")
public class Thanks_ProductsListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Thanks_ProductsListController() {
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
			String Login = (String)session.getAttribute("Login");
			ArrayList<ProductTableModel> list = (ArrayList<ProductTableModel>)session.getAttribute("cartlist");
			if(list!=null) {
				list.removeIf(bean -> bean.getLogin_id().equals(Login));
				session.setAttribute("cartlist", list);
			}
			ArrayList<ProductTableModel>List = ProductTableModel.selectAllList();
			session.setAttribute("product_list", List);
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
