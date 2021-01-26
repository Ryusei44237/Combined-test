package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Bridge
 */
@WebServlet("/Bridge")
public class Bridge extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String id;
	private String name;
	private String View;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Bridge() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		id = request.getParameter("accountid");
		name = request.getParameter("getname");

		request.setAttribute("getname",name);
		request.setAttribute("accountid", id);
		if(true){
			View = "/WEB-INF/view/hinagata.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(View);
			dispatcher.forward(request, response);
		}

	}

}
