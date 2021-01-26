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
	private static String miss;
	private static String pass2;
	private static String hpass;
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
		String name=request.getParameter("name");//jspから名前を取得
		String pass=request.getParameter("password");//jspからパスワードを取得
		String value = request.getParameter("value");//
		System.out.println(name+pass);
		//ハッシュ化
		String salt = "hashSNS";
		hpass = Hash(salt,pass);
		System.out.println(hpass);
//取得情報比較機能
		login(name,hpass);
//試行回数記録機能
		 Judgment(count,name,hpass);
		request.setAttribute("inputname",name);
		request.setAttribute("inputpass",hpass);
		request.setAttribute("getname",resname);
		request.setAttribute("getpass",pass2);
		request.setAttribute("accountid", resid);
		request.setAttribute("miss",miss);
		System.out.println(name+":"+hpass);
		System.out.println(resname+":"+pass2);
		RequestDispatcher dispatcher = request.getRequestDispatcher(View);
		dispatcher.forward(request, response);
	}
	public static void login(String name,String pass) {
		account result = AccountDao.searchDao(name,pass);
		System.out.println(result);
		if (name.equals(AccountDao.getname)&&pass.equals(AccountDao.getpassword)) {
			resid = AccountDao.getid;
			resname = AccountDao.getname;
			View = "/WEB-INF/view/hinagata.jsp";
//			System.out.println("ログインフォームで　取得したユーザ名："+name+"  取得したパスワード："+pass);
//			System.out.println("ユーザ名とパスワードが一致しました。");
//			System.out.println("データベースから　取得したユーザ名：　"+AccountDao.getname+"  取得したパスワード：　"+AccountDao.getpassword+" 取得したID"+AccountDao.getid);
		}else if (name.equals(AccountDao.getname)) {
//			System.out.println("ユーザ名は一致：パスワードが不一致");
			count+=1;
//			System.out.println(count);
			View = "login.jsp";
		}else if(pass.equals(AccountDao.getpassword)) {
//			System.out.println("パスワードは一致：ユーザ名が不一致");
			count+=1;
//			System.out.println(count);
			View = "login.jsp";
		}else {
//			System.out.println("ユーザ名.パスワード両方不一致");
			count+=1;
//			System.out.println(count);
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
//		System.out.println(hashedStr2);
		return hashedStr2;

	}

}