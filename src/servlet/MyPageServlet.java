package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.account;
import Bean.post;
import dao.AccountDao;
import dao.FollowDao;
import dao.PostDao;

/**
 * Servlet implementation class Update
 */
@WebServlet("/MyPageServlet")
public class MyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
//	このservlet上で使用する変数
public static ArrayList<post> list = new ArrayList<post>();
public static ArrayList<post> imagearray = new ArrayList<post>();
	public static String id;
    public MyPageServlet() {
        super();

    }

 public static FollowDao a = new FollowDao();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//メインjspからアカウントIDを取得し、アカウントIDをもとに行検索をかける。
		id=request.getParameter("account_id");
//		投稿内容表示処理 (アカウントIDを取得し、アカウントIDが一致する投稿を全件取得する）
		post(id);
		request.setAttribute("list", list);
//		登録情報更新処理 （アカウントIDで照会し、一致するアカウント登録情報を取得）
		account(id);
		System.out.println("main.jspから　取得した名前　"+AccountDao.getname);
		request.setAttribute("id",AccountDao.getid);
		request.setAttribute("name",AccountDao.getname);
		request.setAttribute("pass",AccountDao.getpassword);
		request.setAttribute("mail",AccountDao.getmail);
		request.setAttribute("birthday",AccountDao.getbirthday);
		request.setAttribute("tell",AccountDao.gettell);
		request.setAttribute("update_at",AccountDao.getupdate_at);
		String path = AccountDao.user_img;
		request.setAttribute("userimg",path);

//		int FollowCount = FollowCount(Integer.parseInt(id));
//		request.setAttribute("followcount", FollowCount);
//
//		int FollowerCount = FollowerCount(Integer.parseInt(id));
//		request.setAttribute("followercount", FollowerCount);


//		全画像取得
		request.setAttribute("image",imagearray);
		if (true) {
			/*ここにmypage.jspへの遷移コードを書く｛mypage.jsp｝*/
			String view = "/WEB-INF/view/mypage.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(view);
			dispatcher.forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	public static void account(String id) {
		System.out.println("accountメソッド");
		account result = AccountDao.searchDao2(id);
	}
	public static void post(String id) {
		System.out.println("postメソッド");
		//ArrayListを作ってListの中に全件検索のdaoのメソッドで得た値を代入する
				list = PostDao.allPost(id);
	}
	public static ArrayList<Bean.post> image(String id) {
		imagearray = PostDao.image(id);
		return imagearray;
	}
	public static int FollowCount(int userId){
		int followcount = a.getFollowCount(Integer.parseInt(id));
		return followcount;
	}
	public static int FollowerCount(int userId){
		int followercount = a.getFollowerCount(Integer.parseInt(id));
		return followercount;
	}
}
