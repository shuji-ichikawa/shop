package shop;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class Page1Filter
 */
@WebFilter("/jsp/ProductsList.jsp")
public class ProductFilter implements Filter {

    /**
     * Default constructor.
     */
    public ProductFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		System.out.println("ProductFilter");
		request.setCharacterEncoding("UTF-8");
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		HttpServletResponse httpResponse = (HttpServletResponse)response;
		HttpSession session = httpRequest.getSession();

		int maxpage;
		int pagesize = 10;
		int currentPage = 1;

		String Login = (String)session.getAttribute("Login");
		String Login_id = request.getParameter("Login_id");
		if(!(Login.equals(Login_id))) {
			session.setAttribute("Login", Login_id);
		}else {
			session.setAttribute("Login", Login);
		}

		try {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			System.out.println(currentPage);
		}catch(Exception e) {
			System.out.println("1回目");
			ArrayList<ProductTableModel>list = ProductTableModel.selectAllList();
			session.setAttribute("product_list", list);

			//最大のページ数を取得
			maxpage = list.size() / pagesize;
			if (list.size() % pagesize != 0
					|| list.size() == 0) {
				++maxpage;
			}
			session.setAttribute("maxpage", maxpage);

		}
		System.out.println("2回目以降");
		//何番目のレコードから表示するか
		int offset = (currentPage - 1) * pagesize;

		int num = pagesize-1;

		request.setAttribute("currentPage", currentPage);
		session.setAttribute("offset", offset);
		session.setAttribute("num", num);
		chain.doFilter(httpRequest, httpResponse);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
