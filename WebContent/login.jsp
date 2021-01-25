<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>

<!--これでいける-->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/login.css">
<title>Registration</title>
</head>
<!-- 確認 -->
<header>
	<nav class="navbar navbar-expand-lg navbar-light bg-light " style="padding:0px 16px 0px 16px;">
		<a class="nav-link disabled" href="../html/toppage.html">
		<div id="h_item1">
                <div id="logo">
                    <img src="https://getbootstrap.jp/docs/4.5/assets/brand/bootstrap-solid.svg" alt="">
                </div>
        </div>
		</a>
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link disabled"
					><h5>ログイン</h5><span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item active"><a class="nav-link"
					href="/Combined-test/signup.jsp"><h5>登録</h5></a></li>
			</ul>
		<div id="h_item3" style="margin-left: 13%;">
                <div id="title">
                    <p id="title-text" style="margin:16px 0 16px 0;">災害情報共有</p>
                </div>
            </div>
	</nav>
</header>

<body>
	<link rel="stylesheet" href="/WebContent/css/login.css">
	<div class="form-wrapper">
		<h1>ログイン</h1>
		<!--ここのフォームから、MainServletへ値を送信する-->
		<form action="/Combined-test/MainServlet" method="post">
			<div class="form-item">
				<label for="name"></label> <input type="text" name="name"
					required="required" placeholder="ユーザ名"></input>
			</div>
			<div class="form-item">
				<label for="password"></label> <input type="password"
					name="password" required="required" placeholder="パスワード"></input>
			</div>
			<div id="misstext"></div>
			<div class="button-panel">
			<input type="hidden" name="judge" value="log">
				<input type="submit" class="button" title="Sign In" value="サインイン"></input>
			</div>
		</form>
		<div class="form-footer">
			<p>
				<a href="signup.jsp">アカウントを作成</a>
			</p>
			<!-- <p>
				 <a href="forgotpass.jsp">パスワードを忘れた場合</a>
			</p> -->
		</div>
	</div>
	<%
	String miss= (String)request.getAttribute("miss");
	String name=(String)request.getAttribute("inputname");
	String password=(String)request.getAttribute("inputpass");
	String dbname = (String)request.getAttribute("getname");
	String dbpass = (String)request.getAttribute("getpass");
	%>
	<script>
		//変数受け取り

		var miss = "<%=miss%>";
		var name = "<%=name%>";
		var password = "<%=password%>";
		var dbname= "<%=dbname%>";
		var dbpass = "<%=dbpass%>";
		//コンソール表示
		console.log("judgeの中身は："+miss);
		console.log(name);
		console.log(password);
		console.log(dbname);
		console.log(dbpass);
		//falseを受け取っていたら
		if(miss == "miss"){
			console.log("分岐に入りました");
			var elem = document.getElementById("misstext");
			//パスワードフォームの下に赤文字を表示する
			elem.innerHTML = "<span style='color: red;'>ユーザIDまたはパスワードが間違っています。</span>";
		}else{
			console.log("falseは確認されませんでした。");
		}
	</script>
</body>
</html>