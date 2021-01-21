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
 * Servlet implementation class TimelineServlet
 */
@WebServlet("/TimelineServlet")
public class TimelineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TimelineServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		//タグIDを受け取る
		String tag=null;
		tag=request.getParameter("tag");
		switch(tag) {
			case "台風":
				tag="1";
				break;
			case "東日本大震災":
				tag="2";
				break;
			case "津波":
				tag="3";
				break;
			case "洪水":
				tag="4";
				break;
		}
		System.out.print(tag);
		//受け取ったタグIDが付与されている投稿を全件検索かける
		ArrayList<post> result = PostDao.tags_post(tag);
		//daoから受け取ったresultをtimelinejspにおくる
		request.setAttribute("list", result);
		//timeline.jspへの遷移を書く
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
