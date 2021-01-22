package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FollowDao;

/**
 * Servlet implementation class FollowServlet
 */
@WebServlet("/FollowServlet")
public class FollowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public FollowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub


		 // ログインユーザの取得
         //loginUser = getLoginUser(request);


        // リクエストパラメータの取得
        request.setCharacterEncoding("UTF-8");

        String Account_Id = request.getParameter("accountid");
        int account_Id = Integer.parseInt(Account_Id);

        String sFollowId = request.getParameter("followId");
        int followId = Integer.parseInt(sFollowId);
        // フォロー処理 FOLLOWテーブルに追加
        FollowDao a = new FollowDao();
        a.Follow(account_Id, followId);

        // フォロー完了画面にフォワード
        //forward("WEB-INF/jsp/followConfirm.jsp", request, response);



	}

}
