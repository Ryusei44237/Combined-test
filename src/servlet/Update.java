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
import dao.AccountDao;
import dao.PostDao;
import util.GenerateHashedPw;

/**
 * Servlet implementation class Update
 */
@WebServlet("/Update")
public class Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static ArrayList<Bean.post> list;
	private String name;
	private String id;
	private String password;
	private String tell;
	private String mail;
	private String password2;
	private static ArrayList<Bean.post> imagearray;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update() {
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
		name=util.GeneratedUTF_8.GUTF_8(request.getParameter("name"));
		id=request.getParameter("id");
		password=request.getParameter("password2");
		String salt = "hashSNS";
		password = Hash(salt,password);//Hashメソッドへソルトとパスワードを与える
		tell=request.getParameter("tell");
		mail=request.getParameter("mail");
		System.out.println("アップデート"+name+id+password+password+tell+mail);
		account s = new account(id,name,password,tell,mail);
		account result = AccountDao.updateDao(s);


//		//メインjspからアカウントIDを取得し、アカウントIDをもとに行検索をかける。
//		投稿内容表示処理 (アカウントIDを取得し、アカウントIDが一致する投稿を全件取得する）
		post(id);
		request.setAttribute("list", list);
//		登録情報更新処理 （アカウントIDで照会し、一致するアカウント登録情報を取得）
		account(id);
//		image(id);
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


		String view = "/WEB-INF/view/mypage.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
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
//	public static ArrayList<Bean.post> image(String id) {
//		imagearray = PostDao.image(id);
//		return imagearray;
//	}
	public static String Hash(String salt,String password) {
		String hashedStr = GenerateHashedPw.getSafetyPassword(password, salt);
		String hashedStr2 = GenerateHashedPw.getSafetyPassword(password, salt);
		System.out.println(hashedStr2);
		return hashedStr2;

	}

}
