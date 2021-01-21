<%@page import="Bean.account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/hinagata.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/86a6bb02b6.js"	crossorigin="anonymous"></script>

    <title>ひな型 </title>
</head>
<body>
    <div id="modal">
       <!-- 投稿ボタンを押下した際に出てくる投稿モーダル -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
    aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">投稿エリア</h5>
                <button type="button" class="close" data-dismiss="modal"
                    aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="postform" action="/sotuken-project/PostServlet" method="post">
                    <class class="form-group">
                        <label for="exampleInputEmail1">投稿文</label>
                        <input type="text"class="form-control" id = "testname" name="PostContents" aria-describedby="emailHelp"placeholder="投稿文を入力">
                        <input type="hidden"name="accountid" value=<%=request.getAttribute("accountid")%>>
                        <input type="file" name="uploadFile" id="uploadFile">
                    </class>
                            <div class="form-group col-md-4">
                                 <select id="inputState"
                                    class="form-control" name="PostTags">
                                    <option selected>タグ選択</option>
                                    <option value="1">台風</option>
                                    <option value="2">地震</option>
                                    <option value="3">津波</option>
                                    <option value="4">洪水</option>
                                </select>
                            </div>
                            <input type="hidden" name="value" value="post">
                        <button type="submit" class="btn btn-primary" id="submit">投稿</button>
                    </div>
                    </form>
            </div>
        </div>
    </div>
    </div>
    <!-- bodyの中をヘッダー、レフトメニュー、ライトメニュー、メイン、フッターの５要素に分割する -->
    <section class="header">
        <div class="header_items">
            <!-- ロゴ -->
            <div id="h_item1">
                <div id="logo">
                    <img src="https://getbootstrap.jp/docs/4.5/assets/brand/bootstrap-solid.svg" alt="">
                </div>
            </div>
            <!-- 画面遷移 -->
            <div id="h_item2">
                <div id="form_group">
                    <form action="/sotuken-project/tourokuServlet" method="get"><button type="submit" class="clear-decoration">登録</button></form>
                    <form action="/sotuken-project/TestServlet" method="get"><button type="submit" class="clear-decoration">ログイン</button></form>
                    <form action="/sotuken-project/MyPageServlet" method="get"><input type="hidden" name="account_id" value=<%=request.getAttribute("accountid")%>><button type="submit" class="clear-decoration" name="name" value=<%=request.getAttribute("getname") %>>マイページ</button></form>
                </div>
            </div>
            <!-- タイトル -->
            <div id="h_item3">
                <div id="title">
                    <p id="title-text">災害情報共有</p>
                </div>
            </div>
            <!-- 検索バー -->
            <div id="h_item4">
                <div id="searchform">
                    <form class="form-inline my-2 my-lg-0" style="width: 20vw; display: flex;" action="/sotuken-project/PostSearch"method="get">
                        <input class="form-control mr-sm-2" type="text" name="Search"placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                    </form>
                </div>
                 <!-- 投稿ボタン -->
                 <button type="button" data-toggle="modal" data-target="#exampleModal" class="btn btn-primary" id="post_button">投稿</button>
                <!-- 設定ボタン -->
                <div id="setting">
                    <button type="button" class="btn btn-primary" data-toggle="modal"data-target=".bd-example-modal-sm"><i class="fas fa-cog"></i></button>
                </div>
            </div>
        </div>
    </section>
    <div class="container_body">

        <section class="left_menu">

        </section>

        <!-- main area ここにカルーセル、card、その他 -->
        <sction class="main">
            <!-- カルーセル -->
            <div id="carousel-area">
                <!-- カルーセルエリアを左、中央、右に三等分する -->
                <div id="carousel_left_side">

                </div>
                <div id="carousel_center_side">
                    <div id="carousel">
                        <div id="carouselExampleIndicators" class="carousel slide"data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carouselExampleIndicators" data-slide-to="0"class="active"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <iframe src="https://www.youtube-nocookie.com/embed/WV5w19J-cAA? loop=1&playlist=vdxoDyNAoH0&autoplay=1&mute=1&rel=0&modestbranding=1"frameborder="0" allowfullscreen></iframe>
                                </div>
                                <div class="carousel-item">
                                    <iframe src="https://www.youtube-nocookie.com/embed/coYw-eVU0Ks? loop=1&playlist=vdxoDyNAoH0&autoplay=1&mute=1&rel=0&modestbranding=1"frameborder="0" allowfullscreen></iframe>
                                </div>
                                <div class="carousel-item">
                                    <iframe src="https://www.youtube-nocookie.com/embed/WXoMJJCaQPU? loop=1&playlist=vdxoDyNAoH0&autoplay=1&mute=1&rel=0&modestbranding=1"frameborder="0" allowfullscreen></iframe>
                                </div>
                            </div>
                            <a class="carousel-control-prev" href="#carouselExampleIndicators"role="button" data-slide="prev"> <span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="sr-only">Previous</span></a> <a class="carousel-control-next" href="#carouselExampleIndicators"role="button" data-slide="next"> <span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="sr-only">Next</span></a>
                        </div>
                    </div>
                </div>
                <div id="carousel_right_side">

                </div>
            </div>
            <!-- card -->
				<div id="card">
					<div class="card-deck">
						<div class="card">
							<img
								src="${pageContext.request.contextPath}/app-image/東日本大震災.jpg"
								alt="" width="100%" height="200vh">
							<div class="card-body">
								<h5 class="card-title">台風</h5>
								<p class="card-text">強い風</p>
								<form action="/Combined-test/TimelineServlet" method="get">
									<input type="hidden" value="台風" name="tag"> <input
										type="submit" class="btn btn-primary stretched-link"
										value="タイムラインへgo">
								</form>
							</div>
						</div>
						<div class="card">
							<img src="${pageContext.request.contextPath}/app-image/熊本地震.jpg"
								alt="" width="100%" height="200vh">
							<div class="card-body">
								<h5 class="card-title">東日本大震災</h5>
								<p class="card-text">大きな揺れが人々を襲った</p>
								<form action="/Combined-test/TimelineServlet" method="get">
									<input type="hidden" value="東日本大震災" name="tag"> <input
										type="submit" class="btn btn-primary stretched-link"
										value="タイムラインへgo">
								</form>
								<a href="#" class="btn btn-primary stretched-link">タイムラインへGo</a>
							</div>
						</div>
						<div class="card">
							<img src="${pageContext.request.contextPath}/app-image/台風.jpg"
								alt="" width="100%" height="200vh">
							<div class="card-body">
								<h5 class="card-title">つなみ</h5>
								<p class="card-text">太平洋側の地域に大きな被害をもたらした。</p>
								<form action="/Combined-test/TimelineServlet" method="get">
									<input type="hidden" value="津波" name="tag"> <input
										type="submit" class="btn btn-primary stretched-link"
										value="タイムラインへgo">
								</form>
								<a href="#" class="btn btn-primary stretched-link">タイムラインへGo</a>
							</div>
						</div>
					</div>
				</div>
				<div id="card">
					<div class="card-deck">
						<div class="card">
							<img
								src="${pageContext.request.contextPath}/app-image/東日本大震災.jpg"
								alt="" width="100%" height="200vh">
							<div class="card-body">
								<h5 class="card-title">洪水</h5>
								<p class="card-text">大変だ！</p>
								<form action="/Combined-test/TimelineServlet" method="get">
									<input type="hidden" value="洪水" name="tag"> <input
										type="submit" class="btn btn-primary stretched-link"
										value="タイムラインへgo">
								</form>
							</div>
						</div>
						<div class="card">
							<img src="${pageContext.request.contextPath}/app-image/熊本地震.jpg"
								alt="" width="100%" height="200vh">
							<div class="card-body">
								<h5 class="card-title">熊本地震</h5>
								<p class="card-text">大きな揺れが人々を襲った</p>
								<a href="#" class="btn btn-primary stretched-link">タイムラインへGo</a>
							</div>
						</div>
						<div class="card">
							<img src="${pageContext.request.contextPath}/app-image/台風.jpg"
								alt="" width="100%" height="200vh">
							<div class="card-body">
								<h5 class="card-title">台風</h5>
								<p class="card-text">太平洋側の地域に大きな被害をもたらした。</p>
								<a href="#" class="btn btn-primary stretched-link">タイムラインへGo</a>
							</div>
						</div>
					</div>
				</div>
        </sction>
        <!-- main area end -->

        <sction class="right_menu">

        </sction>
    </div>
    </div>
    <section class="footer">
            rights.ryusei
    </section>

        <!-- bootstrap -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

<script>
    // ファイル選択フォームに変更時に、フォームの値をコンソールログに表示する
    $("#uploadFile").change(function(){
      var value = this.value;
      console.log(value);
    });
</script>
</body>
</html>
