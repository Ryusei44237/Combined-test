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
import util.GenerateHashedPw;
/**
 * Servlet implementation class SignInServlet
 */
@WebServlet("/CreateAccountMethod")
@MultipartConfig(maxFileSize=1048576) // 1Mまで
public class CreateAccountMethod extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreateAccountMethod() {
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
		//ユーザ情報取得機能
		String id = null;
		String name=util.GeneratedUTF_8.GUTF_8(request.getParameter("name"));//アカウントネーム
		String mail=request.getParameter("mail");//メールアドレス
		String password=request.getParameter("password");//パスワード・ハッシュかける処理を作成
		String year = request.getParameter("AcountYear");//年
		String month = request.getParameter("AcountMonth");//月
		String day = request.getParameter("AcountDay");//日
		String tell=request.getParameter("tell");//電話番号
		String token=request.getParameter("token");//セッショントークン
		String update_at=null;//更新日
		Part part = request.getPart("userimg");
		String birthday=year+month+day;//ここでdate型に入れれる形に直す//生年月日は個別で得たものを合体させbirthdayとして登録する

		//パスワードハッシュ化機能
		String salt = "hashSNS";
		password = Hash(salt,password);//Hashメソッドへソルトとパスワードを与える

		//登録時間取得機能
		String key="時間を取得します";//GetTimeメソッドへのキー
		String create_at=util.GetTime.GetTime(key);//作成日

		//画像取得機能
		String userimg = util.Getimg.getFileName(part);

//		part.write("C:\\workspace\\Combined-test\\WebContent\\user-img\\" + userimg);
//		part.write("C:\\Users\\SYS-4191163\\git\\Combined-test\\WebContent\\user-img\\" + userimg);
//		part.write("C:\\Users\\Onuma Kento\\git\\Combined-test\\WebContent\\user-img\\" + userimg);
		part.write("C:\\Users\\SYS-4191153\\git\\Combined-test\\WebContent\\user-img\\" + userimg);

		//daoへ送る
		account s = new account(id,name,mail,password,birthday,tell,token,create_at,update_at,userimg);
		account result = dao.AccountDao.inserAccount(s);
		System.out.println("login.jspへ遷移します");
		/*ここにlogin.jspへの遷移コードを書く｛login.jsp｝*/
		String view = "login.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}
	public static String Hash(String salt,String password) {
		String hashedStr = GenerateHashedPw.getSafetyPassword(password, salt);
		String hashedStr2 = GenerateHashedPw.getSafetyPassword(password, salt);
		System.out.println(hashedStr2);
		return hashedStr2;

	}
}
