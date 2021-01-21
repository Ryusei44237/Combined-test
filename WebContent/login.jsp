<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="nav-link disabled" href="/WebContent/WEB-INF/view/main.jsp"> <img
			src="../image/空.jpg" width="30" height="30"
			class="d-inline-block align-top" alt=""> 卒研ページ
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link disabled"
					href="/WebContent/WEB-INF/view/login.jsp">ログイン<span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item active"><a class="nav-link "
					href="signup.jsp">登録</a></li>
			</ul>
		</div>
	</nav>
</header>

<body>
	<link rel="stylesheet" href="/WebContent/css/login.css">
	<div class="form-wrapper">
		<h1>ログイン</h1>
		<!--ここのフォームから、MainServletへ値を送信する-->
<form action="/sotuken/MainServlet" method="post">
			<div class="form-item">
				<label for="name"></label> <input type="text" name="name"
					required="required" placeholder="ユーザ名"></input>
			</div>
			<div class="form-item">
				<label for="password"></label> <input type="password"
					name="password" required="required" placeholder="パスワード"></input>
			</div>
			<p id="misstext">　</p>
			<div class="button-panel">
			<input type="hidden" name="judge" value="log">
				<input type="submit" class="button" title="Sign In" value="サインイン"></input>
			</div>
		</form>
		<div class="form-footer">
			<p>
				<a href="signup.jsp">アカウントを作成</a>
			</p>
			<p>
				<a href="forgot.jsp">パスワードを忘れた場合</a>
			</p>
		</div>
	</div>
	<script>
		//変数受け取り
		var judge = <%=request.getAttribute("judgement")%>
		//コンソール表示
		console.log("judgeの中身は："+judge);
		//falseを受け取っていたら
		if(judge == false){
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