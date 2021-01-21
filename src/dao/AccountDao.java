package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Bean.account;



public class AccountDao {
	//①DBアクセスに必要な情報の定数を定義

	//接続先DBのURL(jdbc:mysql://[ホスト名orIPアドレス]:[ポート番号]/[データベース名]?serverTimezone=JST)
	private static final String url = "jdbc:mysql://localhost:3306/application?serverTimezone=JST";
	//ユーザ
	private static final String user = "root";
	//パスワード
	private static final String pw = "admin";
	public static String getname = null;
	public static String getid=null;
	public static String getmail=null;
	public static String getpassword=null;
	public static String getbirthday=null;
	public static String gettell=null;
	public static String getcreate_at=null;
	public static String getupdate_at=null;
	public static String user_img=null;

//アカウント登録
	public static account inserAccount(account s){
		//②アクセスに必要な変数の初期化
		Connection con = null;
		PreparedStatement pstmt = null;

		try{
			//③JDBCドライバをロードする
			Class.forName("com.mysql.cj.jdbc.Driver");

			//④データベースと接続する(コネクションを取ってくる)
			//第1引数→接続先URL
			//第2引数→ユーザ名
			//第3引数→パスワード
			con = DriverManager.getConnection(url, user, pw);

			//⑤SQL文の元を作成する
			//?をプレースホルダと言います。
			//後の手順で?に値を設定します。
			String sql = "insert into account values(?,?,?,?,?,?,?,?,?,?)";

			//⑥SQLを実行するための準備(構文解析)
			pstmt = con.prepareStatement(sql);

			//⑦プレースホルダに値を設定
			//第1引数→何番目の?に設定するか(1から数える)
			//第2引数→?に設定する値
			pstmt.setString(1, s.getId());
			pstmt.setString(2, s.getName());
			pstmt.setString(3, s.getMail());
			pstmt.setString(4, s.getPassword());
			pstmt.setString(5, s.getBirthday());
			pstmt.setString(6, s.getTell());
			pstmt.setString(7, s.getToken());
			pstmt.setString(8, s.getCreate_at());
			pstmt.setString(9, s.getUpdate_at());
			pstmt.setString(10,s.getUserimg());


			System.out.println("アカウント登録完了！");
			//⑧SQLを実行し、DBから結果を受領する
			int result= pstmt.executeUpdate();

		}  catch (SQLException e){
			System.out.println("DBアクセスに失敗しました。");
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			System.out.println("DBアクセスに失敗しました。");
			e.printStackTrace();
		} finally {
			//⑨DBとの切断処理
			try {
				//nullかチェックしないとNullPointerExceptionが
				//発生してしまうためチェックしている。
				if( pstmt != null){
					pstmt.close();
				}
			} catch(SQLException e){
				System.out.println("DB切断時にエラーが発生しました。");
				e.printStackTrace();
			}

			try {
				if( con != null){
					con.close();
				}
			} catch (SQLException e){
				System.out.println("DB切断時にエラーが発生しました。");
				e.printStackTrace();
			}
		}
		return s;
	}
	//ログイン
		public static account searchDao(String name,String pass){
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			account result = null;

			try {
				// ②JDBCドライバをロードする
				Class.forName("com.mysql.cj.jdbc.Driver");

				// ③DBMSとの接続を確立する
				con = DriverManager.getConnection(url,user,pw);
				// ④SQL文を作成する
				String sql = "SELECT id,name,password,COUNT(name = ? or null) as count FROM account where name=? or password=?";
				// ⑤SQL文を実行するための準備を行う
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2,name);
				pstmt.setString(3, pass);


				// ⑥SQL文を実行してDBMSから結果を受信する
				rs = pstmt.executeQuery();

				// ⑦実行結果を含んだインスタンスからデータを取り出す
				if(rs.next()) {
					String countdata=rs.getString("count");
					getname=rs.getString("name");
					getpassword=rs.getString("password");
					getid=rs.getString("id");
					result = new account(countdata);
				}
			} catch (ClassNotFoundException e) {
				System.out.println("JDBCドライバが見つかりません。");
				e.printStackTrace();
			} catch (SQLException e) {
				System.out.println("DBアクセス時にエラーが発生しました。");
			} finally {
				// ⑧DBMSから切断する
				try {
					if (rs != null) {
						rs.close();
					}
				} catch (SQLException e) {
					System.out.println("DBアクセス時にエラーが発生しました。");
					e.printStackTrace();
				}
				try {
					if (pstmt != null) {
						pstmt.close();
					}
				} catch (SQLException e) {
					System.out.println("DBアクセス時にエラーが発生しました。");
					e.printStackTrace();
				}
				try {
					if (con != null) {
						con.close();
					}
				} catch (SQLException e) {
					System.out.println("DBアクセス時にエラーが発生しました。");
					e.printStackTrace();
				}
			}
			return result;
		}
		public static account searchDao2(String id){
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			account result = null;

			try {
				// ②JDBCドライバをロードする
				Class.forName("com.mysql.cj.jdbc.Driver");

				// ③DBMSとの接続を確立する
				con = DriverManager.getConnection(url,user,pw);
				// ④SQL文を作成する
				String sql = "SELECT * FROM account WHERE id = ?;";
				// ⑤SQL文を実行するための準備を行う
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);

				// ⑥SQL文を実行してDBMSから結果を受信する
				rs = pstmt.executeQuery();

				// ⑦実行結果を含んだインスタンスからデータを取り出す
				rs.next();

				getid = rs.getString("id");
				getname = rs.getString("name");
				getmail = rs.getString("mail");
				getpassword  = rs.getString("password");
				getbirthday = rs.getString("birthday");
				gettell = rs.getString("tell");
				getcreate_at = rs.getString("create_at");
				getupdate_at = rs.getString("update_at");
				user_img = rs.getString("userimg");
				result = new account(getid,getname,getmail,getpassword,getbirthday,gettell,getcreate_at,getupdate_at,user_img);
				System.out.println("DAOで取得した値の一覧："+getid+"|"+getname+"|"+getmail+"|"+getpassword+"|"+getbirthday+"|"+gettell+"|"+getcreate_at+"|"+getupdate_at+"|"+user_img);
			} catch (ClassNotFoundException e) {
				System.out.println("JDBCドライバが見つかりません。");
				e.printStackTrace();
			} catch (SQLException e) {
				System.out.println("DBアクセス時にエラーが発生しました。");
			} finally {
				// ⑧DBMSから切断する
				try {
					if (rs != null) {
						rs.close();
					}
				} catch (SQLException e) {
					System.out.println("DBアクセス時にエラーが発生しました。");
					e.printStackTrace();
				}
				try {
					if (pstmt != null) {
						pstmt.close();
					}
				} catch (SQLException e) {
					System.out.println("DBアクセス時にエラーが発生しました。");
					e.printStackTrace();
				}
				try {
					if (con != null) {
						con.close();
					}
				} catch (SQLException e) {
					System.out.println("DBアクセス時にエラーが発生しました。");
					e.printStackTrace();
				}
			}
			return result;
		}
}
