package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Bean.account;
import Bean.post;
import dao.AccountDao;
import dao.PostDao;

/**
 * Servlet implementation class PostServlet
 */
@WebServlet("/PostServlet")
@MultipartConfig(maxFileSize=1048576) // 1Mまで
public class PostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static String pathString;
	public static Part part;
	private static String resname;
	private static String resid;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF8");
//    	投稿情報取得機能
		String PostContents = request.getParameter("PostContents");
		String account_name = request.getParameter("accountname");
		String PostTags_Id = request.getParameter("PostTags");
		String PostAccount_Id = request.getParameter("accountid");
		String id = null;
		account(PostAccount_Id);
		String key="時間を取得します";//GetTimeメソッドへのキー
		String PostCreate_at = util.GetTime.GetTime(key);//作成日
		String PostAddress =null;
		part=request.getPart("uploadFile");//画像受け取り
		System.out.println(part+"画像イメージ");
//画像取得処理
		String PostImg = util.Getimg.getFileName(part);
		System.out.println(PostImg);

		part.write("/opt/tomcat/apache-tomcat-9.0.41/webapps/Combined-test/post-img/" + PostImg);
//		part.write("C:\\Users\\SYS-4191163\\git\\Combined-test\\WebContent\\post-img\\" + part);
//		part.write("C:\\Users\\Onuma Kento\\git\\Combined-test\\WebContent\\post-img\\" + part);
//		part.write("C:\\Users\\SYS-4191153\\git\\Combined-test\\WebContent\\post-img\\" + part);



		post s = new post(id,account_name,PostContents,PostImg, PostTags_Id, PostAccount_Id, PostAddress, PostCreate_at);
		System.out.println("投稿内容　"+PostContents+"投稿画像　"+PostImg+"ポストタグ　"+PostTags_Id+"投稿アカウントID　"+PostAccount_Id+"投稿場所　"+PostAddress+"作成日　"+PostCreate_at);
		post result = PostDao.insertPost(s);
		resname=AccountDao.getname;
		resid=AccountDao.getid;
		request.setAttribute("getname",resname);
		request.setAttribute("accountid", resid);
		if (true) {
			String view ="/WEB-INF/view/hinagata.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(view);
			dispatcher.forward(request, response);
		}

	}
	public static void account(String id) {
		System.out.println("accountメソッド");
		account result = AccountDao.searchDao2(id);
	}
}
