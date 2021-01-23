package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Bean.account;

public class FollowDao {

	//①DBアクセスに必要な情報の定数を定義

	//接続先DBのURL(jdbc:mysql://[ホスト名orIPアドレス]:[ポート番号]/[データベース名]?serverTimezone=JST)
	private static final String url = "jdbc:mysql://localhost/application?serverTimezone=JST";
	//ユーザ
	private static final String user = "root";
	//パスワード
	private static final String pw = "admin";


	public void Follow(int account_Id, int follow_Id ) {

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
			String sql = "INSERT INTO follows (account_id, follow) VALUES (?,?)";

			//⑥SQLを実行するための準備(構文解析)
			pstmt = con.prepareStatement(sql);

			//⑦プレースホルダに値を設定
			//第1引数→何番目の?に設定するか(1から数える)
			//第2引数→?に設定する値

			 pstmt.setInt(1, account_Id);
             pstmt.setInt(2, follow_Id);


          // INSERT文を実行
             int result = pstmt.executeUpdate();
             if (result != 1) {
                 throw new RuntimeException("フォローに失敗しました。");
             }


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
	}

	// 指定したuser_Id のフォロー数を取得
    public int getFollowCount(int userId) {
    	//②アクセスに必要な変数の初期化
		Connection con = null;
		PreparedStatement pstmt = null;

		int followCount = 0;

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
			String sql = "SELECT COUNT(*) AS FOLLOWCOUNT FROM follows WHERE account_Id = ?";

			//⑥SQLを実行するための準備(構文解析)
			pstmt = con.prepareStatement(sql);

			//⑦プレースホルダに値を設定
			//第1引数→何番目の?に設定するか(1から数える)
			//第2引数→?に設定する値

			pstmt.setInt(1, userId);
			// SELECTを実行
            try (ResultSet rs = pstmt.executeQuery()) {

                // 1件しか返って来ないのでif文
                if (rs.next()) {
                    followCount = rs.getInt("FOLLOWCOUNT");
                }
            }

    		} catch (Exception e) {
    			throw new RuntimeException(e);
    		}
				return followCount;
    }

    // 指定したuser_Id のフォロワー数を取得
    public int getFollowerCount(int userId) {
    	//②アクセスに必要な変数の初期化
    	Connection con = null;
    	PreparedStatement pstmt = null;

    	int followerCount = 0;

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
    		String sql = "SELECT COUNT(*) AS FOLLOWERCOUNT FROM follows WHERE follow = ?";

    		//⑥SQLを実行するための準備(構文解析)
    		pstmt = con.prepareStatement(sql);

    		//⑦プレースホルダに値を設定
    		//第1引数→何番目の?に設定するか(1から数える)
    		//第2引数→?に設定する値

    		pstmt.setInt(1, userId);

    		// SELECTを実行
            try (ResultSet rs = pstmt.executeQuery()) {

                if (rs.next()) {
                    followerCount = rs.getInt("FOLLOWERCOUNT");

                }
            }

    		} catch (Exception e) {
    			throw new RuntimeException(e);
    		}
    		return followerCount;
	}

 // 指定したuser_Idのフォロー 一覧の取得
    public List<account> getFollowList(int userId) {
        List<account> followList = new ArrayList<account>();

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

    		// フォローしたユーザーの取得（自分は表示しない）
    		String sql = "SELECT follows.follow AS follow_id, account.name as account_name FROM follows"
    				+ "INNER JOIN account ON follows.follow = account.id" + "WHERE account_id = ?";

    		//⑥SQLを実行するための準備(構文解析)
    		pstmt = con.prepareStatement(sql);

    		//⑦プレースホルダに値を設定
    		//第1引数→何番目の?に設定するか(1から数える)
    		//第2引数→?に設定する値

            pstmt.setInt(1, userId);

            // SELECTを実行
            try (ResultSet rs = pstmt.executeQuery()) {
              // SELECT文の結果をArrayListに格納
              while (rs.next()) {
            	  String followUserId = rs.getString("USER_ID");
                  String followUserName = rs.getString("USER_NAME");

                  account follow = new account(followUserId, followUserName);
                  followList.add(follow);
             }
            }
            } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return followList;
    }

    // 指定したuser_Idのフォロワー 一覧の取得
    public List<account> getFollowerList(int userId) {
        List<account> followerList = new ArrayList<account>();

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

    		// フォローしたユーザーの取得（自分は表示しない）
    		String sql = "SELECT account.id AS account_id, account.name as account_name FROM account"
    				+ "INNER JOIN follows ON account.id = follows.account_id" + "WHERE follows.follow = ?";

    		//⑥SQLを実行するための準備(構文解析)
    		pstmt = con.prepareStatement(sql);

    		//⑦プレースホルダに値を設定
    		//第1引数→何番目の?に設定するか(1から数える)
    		//第2引数→?に設定する値

            pstmt.setInt(1, userId);

            // SELECTを実行
            try (ResultSet rs = pstmt.executeQuery()) {
              // SELECT文の結果をArrayListに格納
              while (rs.next()) {
            	  String followerUserId = rs.getString("USER_ID");
                  String followerUserName = rs.getString("USER_NAME");

                  account follower = new account(followerUserId, followerUserName);
                  followerList.add(follower);
             }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return followerList;
    }

    // フォローを解除する
    public void followDelete(int userId, int followId) {
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

            String sql = "DELETE FROM follows WHERE account_id = ? AND follow = ?";

            //⑥SQLを実行するための準備(構文解析)
    		pstmt = con.prepareStatement(sql);

            pstmt.setInt(1, userId);
            pstmt.setInt(2, followId);

           // INSERT文を実行
           int result = pstmt.executeUpdate();
           if (result != 1) {
                    throw new RuntimeException("フォロー解除に失敗しました。");
           }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
