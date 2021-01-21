package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.account;
import dao.AccountDao;
import util.GenerateHashedPw;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/Main"
		+ "Servlet")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String View;
	private static int count=0;
	private static String resname;
	private static String resid;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainServlet() {
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
		request.setCharacterEncoding("UTF-8");
//ログイン情報取得機能
		String name=request.getParameter("name");
		String pass=request.getParameter("password");
		String value = request.getParameter("value");
//取得情報比較機能
		login(name,pass);
//試行回数記録機能
		Judgment(count,name,pass);

		request.setAttribute("getname",resname);
		request.setAttribute("accountid", resid);
		RequestDispatcher dispatcher = request.getRequestDispatcher(View);
		dispatcher.forward(request, response);
	}
	public static void login(String name,String pass) {
		account result = AccountDao.searchDao(name,pass);
//		パスワードハッシュ化機能
		String salt = "hashSNS";
		pass = Hash(salt,pass);
		if (name.equals(AccountDao.getname)&&pass.equals(AccountDao.getpassword)) {
			resname=AccountDao.getname;
			resid=AccountDao.getid;
			View = "/WEB-INF/view/hinagata.jsp";
		}else if (name.equals(AccountDao.getname)) {
			System.out.println("ユーザ名は一致：パスワードが不一致"+pass);
			count+=1;
			View = "login.jsp";
		}else if(pass.equals(AccountDao.getpassword)) {
			System.out.println("パスワードは一致：ユーザ名が不一致"+pass);
			count+=1;
			System.out.println(count);
			View = "/login.jsp";
		}else {
			System.out.println("ユーザ名.パスワード両方不一致"+pass);
			count+=1;
			System.out.println(count+pass);
			View = "login.jsp";
		}
	}
	public static void Judgment(int count,String name,String pass) {
		if (count<6) {
			login(name, pass);
		}else if (count>=6) {
			View = "forgetpass.jsp";
		}
	}
	public static String Hash(String salt,String password) {
		String hashedStr = GenerateHashedPw.getSafetyPassword(password, salt);
		String hashedStr2 = GenerateHashedPw.getSafetyPassword(password, salt);
		System.out.println(hashedStr2);
		return hashedStr2;

	}

}