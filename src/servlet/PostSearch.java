package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.post;
import dao.PostDao;

/**
 * Servlet implementation class PostSearch
 */
@WebServlet("/PostSearch")
public class PostSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static ArrayList<post> Searchresult = new ArrayList<post>();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF8");
		// TODO Auto-generated method stub
		String SearchText=request.getParameter("Search");
		System.out.println(SearchText);
		Searchresult = PostDao.searchPost(SearchText);
		System.out.println(PostDao.contents+"検索結果");
		request.setAttribute("ID",PostDao.account_id)
		request.setAttribute("list",Searchresult);
		String view = "/WEB-INF/view/timeline.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
