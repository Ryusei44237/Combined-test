package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Bean.post;

public class PostDao {

	//①DBアクセスに必要な情報の定数を定義

		//接続先DBのURL(jdbc:mysql://[ホスト名orIPアドレス]:[ポート番号]/[データベース名]?serverTimezone=JST)
		private static final String url = "jdbc:mysql://localhost/application?serverTimezone=JST";
		//ユーザ
		private static final String user = "SNS";
		//パスワード
		private static final String pw = "admin";

		public static String account_id;
		public static String contents;
		public static String img;
		public static String tags;
		public static String address;
		public static String create_at;
		public static String id;
		public static String account_name;
		private static String user_img;
		//INSERT文を実行するメソッドのサンプル
		//引数は登録したい情報が格納されたBean
		public static post insertPost(post s){
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
				String sql = "INSERT INTO post(id,account_name,contents,img,tags_id,account_id,address,create_at) VALUE(?, ?, ? ,?, ?, ?, ?, ?)";

				//⑥SQLを実行するための準備(構文解析)
				pstmt = con.prepareStatement(sql);

				//⑦プレースホルダに値を設定
				//第1引数→何番目の?に設定するか(1から数える)
				//第2引数→?に設定する値
				System.out.println("アカウントネーム"+s.getAccount_name());
				pstmt.setString(1, s.getId());
				pstmt.setString(2, s.getAccount_name());
				pstmt.setString(3, s.getContents());
				pstmt.setString(4, s.getImg());
				pstmt.setString(5, s.getTags_Id());
				pstmt.setString(6, s.getAccount_Id());
				pstmt.setString(7, s.getAddress());
				pstmt.setString(8, s.getCreate_At());


				System.out.println("実行できてる");
				//⑧SQLを実行し、DBから結果を受領する
				int result= pstmt.executeUpdate();
				System.out.println(result + "件登録されました。");

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
		//検索キーワードをもとに条件に一致する投稿を全件表示
		public static ArrayList<post> searchPost(String SearchText){
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {
				// ②JDBCドライバをロードする
				Class.forName("com.mysql.cj.jdbc.Driver");

				// ③DBMSとの接続を確立する
				con = DriverManager.getConnection(url,user,pw);
				// ④SQL文を作成する
				String sql = "SELECT account.id, account.name, account.userimg, contents, img, post.create_at FROM post LEFT OUTER JOIN account ON account_id = account.id WHERE contents LIKE '%"+SearchText+"%' order by post.create_at desc ;";
				// ⑤SQL文を実行するための準備を行う
				pstmt = con.prepareStatement(sql);

				// ⑥SQL文を実行してDBMSから結果を受信する
				rs = pstmt.executeQuery();

				//return用のArrayList生成
				ArrayList<post> list = new ArrayList<post>();

				//next()の戻り値がfalseになるまでResultSetから
				//データを取得してArrayListに追加していく
				while( rs.next() ){
					id =rs.getString("id");
					account_name = rs.getString("name");
					user_img =  rs.getString("userimg");
					contents = rs.getString("contents");
					img = rs.getString("img");
					create_at = rs.getString("create_at");
					post result = new post(id,account_name,user_img,contents,img,create_at);
					list.add(result);
				}

				//account_id=rs.getString(id);

				//中身の詰まったArrayListを返却する
				System.out.println(list);
				return list;

			}  catch (SQLException e){
				System.out.println("DBアクセスに失敗しました。");
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				System.out.println("DBアクセスに失敗しました。");
				e.printStackTrace();
			} finally {
				//⑫DBとの切断処理
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

			//途中でExceptionが発生した時はnullを返す。
			return null;
		}

		//アカウントIDで投稿内容を全件検索するSELECT文を実行するメソッドのサンプル
		public static ArrayList<post> allPost(String id){
			//アクセスに必要な変数の初期化
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;


			try{
				//JDBCドライバをロードする
				Class.forName("com.mysql.cj.jdbc.Driver");

				//データベースと接続する(コネクションを取ってくる)
				//第1引数→接続先URL
				//第2引数→ユーザ名
				//第3引数→パスワード
				con = DriverManager.getConnection(url, user, pw);

				//SQL文の元を作成する
				String sql = "select account.id,account.name,account.userimg,contents,img,post.create_at from post left outer join account on account_id = account.id where account_id=? order by post.create_at desc;";

				//SQLを実行するための準備(構文解析)
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				//SQLを実行し、DBから結果を受領する
				rs = pstmt.executeQuery();

				//return用のArrayList生成
				ArrayList<post> list = new ArrayList<post>();


				//next()の戻り値がfalseになるまでResultSetから
				//データを取得してArrayListに追加していく
				while( rs.next() ){
					account_id = rs.getString("id");
					account_name = rs.getString("name");
					contents = rs.getString("contents");
					img = rs.getString("img");
					user_img = rs.getString("userimg");
					create_at = rs.getString("create_at");
					post result = new post(account_id,account_name,user_img,contents,img,create_at);
					list.add(result);
				}
				//中身の詰まったArrayListを返却する
				System.out.println(list);
				return list;

			}  catch (SQLException e){
				System.out.println("DBアクセスに失敗しました。");
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				System.out.println("DBアクセスに失敗しました。");
				e.printStackTrace();
			} finally {
				//⑫DBとの切断処理
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

			//途中でExceptionが発生した時はnullを返す。
			return null;
		}
		//タグて紐づけて全件検索するSELECT文を実行するメソッドのサンプル
				public static ArrayList<post> tags_post(String tag){
					//アクセスに必要な変数の初期化
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;


					try{
						//JDBCドライバをロードする
						Class.forName("com.mysql.cj.jdbc.Driver");

						//データベースと接続する(コネクションを取ってくる)
						//第1引数→接続先URL
						//第2引数→ユーザ名
						//第3引数→パスワード
						con = DriverManager.getConnection(url, user, pw);

						//SQL文の元を作成する
						String sql = "SELECT account.id, account.name, account.userimg, contents, img, post.create_at FROM post LEFT OUTER JOIN account ON account_id = account.id WHERE tags_id = ? order by post.create_at desc;";
						//SQLを実行するための準備(構文解析)
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, tag);
						//SQLを実行し、DBから結果を受領する
						rs = pstmt.executeQuery();

						//return用のArrayList生成
						ArrayList<post> list = new ArrayList<post>();


						//next()の戻り値がfalseになるまでResultSetから
						//データを取得してArrayListに追加していく
						while( rs.next() ){
							account_id = rs.getString("id");
							account_name = rs.getString("name");
							contents = rs.getString("contents");
							img = rs.getString("img");
							user_img = rs.getString("userimg");
							create_at = rs.getString("create_at");
							post result = new post(account_id,account_name,user_img,contents,img,create_at);
							list.add(result);

						}
						//中身の詰まったArrayListを返却する
						System.out.println(list);

						return list;

					}  catch (SQLException e){
						System.out.println("DBアクセスに失敗しました。");
						e.printStackTrace();
					} catch (ClassNotFoundException e) {
						System.out.println("DBアクセスに失敗しました。");
						e.printStackTrace();
					} finally {
						//⑫DBとの切断処理
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

					//途中でExceptionが発生した時はnullを返す。
					return null;
				}
				//画像だけを全件検索するSELECT文を実行するメソッドのサンプル
				public static ArrayList<post> image(String id){
					//アクセスに必要な変数の初期化
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;


					try{
						//JDBCドライバをロードする
						Class.forName("com.mysql.cj.jdbc.Driver");

						//データベースと接続する(コネクションを取ってくる)
						//第1引数→接続先URL
						//第2引数→ユーザ名
						//第3引数→パスワード
						con = DriverManager.getConnection(url, user, pw);

						//SQL文の元を作成する
						String sql = "SELECT img FROM post where account_id = ?;";

						//SQLを実行するための準備(構文解析)
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, id);
						//SQLを実行し、DBから結果を受領する
						rs = pstmt.executeQuery();

						//return用のArrayList生成
						ArrayList<post> list = new ArrayList<post>();


						//next()の戻り値がfalseになるまでResultSetから
						//データを取得してArrayListに追加していく
						while( rs.next() ){

							account_name =  rs.getString("account_name");
							img = rs.getString("img");
							create_at = rs.getString("create_at");
							post result = new post(account_name,img,create_at);
							list.add(result);

						}
						//中身の詰まったArrayListを返却する
						System.out.println(list);
						return list;

					}  catch (SQLException e){
						System.out.println("DBアクセスに失敗しました。");
						e.printStackTrace();
					} catch (ClassNotFoundException e) {
						System.out.println("DBアクセスに失敗しました。");
						e.printStackTrace();
					} finally {
						//⑫DBとの切断処理
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

					//途中でExceptionが発生した時はnullを返す。
					return null;
				}
}
