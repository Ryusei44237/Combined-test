<%@page import="Bean.account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Bean.post" %>
<!DOCTYPE html>
<html lang="ja" class="no-js">
    <head>
    <!-- 確認 -->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/timeline.css">
        <title>Registration</title>


		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>災害情報</title>
		<meta name="description" content="Blueprint: Vertical Timeline" />
		<meta name="keywords" content="timeline, vertical, layout, style, component, web development, template, responsive" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/timeline.css">
		<script src="/WebContent/js/timeline.js"></script>


		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content" style="width: 750px;">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">投稿エリア</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body" style="width: 750px;">
				<form>
					<div class="form-group">
						<label for="exampleInputEmail1">投稿文</label> <input type="email"
							class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" placeholder="投稿内容入力"> <small
							id="emailHelp" class="form-text text-muted">誹謗中傷、荒らし行為禁止</small>
					</div>
					<div class="form-group form-check">
						<input type="checkbox" class="form-check-input" id="exampleCheck1">
						<label class="form-check-label" for="exampleCheck1">プライバシーポリシーに同意</label>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">キャンセル</button>
				<input type="submit" class="btn btn-primary" value="投稿">
			</div>
		</div>
	</div>
</div>
<!-- 投稿モーダルここまで -->
<div class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog"
	aria-labelledby="mySmallModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content" style="width: 1000px;">
			<!--  -->
			<div class="modal-body" style="width: 1000px;">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<div class="row">
					<div class="col-3" style="width: 160px;">
						<div class="nav flex-column nav-pills" id="v-pills-tab"
							role="tablist" aria-orientation="vertical">
							<a class="nav-link " id="v-pills-home-tab" data-toggle="pill"
								href="#v-pills-home" role="tab" aria-controls="v-pills-home"
								aria-selected="false" style="width: 155px;">環境設定</a> <a
								class="nav-link" id="v-pills-profile-tab" data-toggle="pill"
								href="#v-pills-profile" role="tab"
								aria-controls="v-pills-profile" aria-selected="true"
								style="width: 155px;">ガイドライン</a> <a class="nav-link"
								id="v-pills-messages-tab" data-toggle="pill"
								href="#v-pills-messages" role="tab"
								aria-controls="v-pills-messages" aria-selected="true"
								style="width: 155px;">ログアウト</a>
						</div>
					</div>
					<div class="col-9">
						<div class="tab-content" id="v-pills-tabContent">
							<div class="tab-pane fade show active" id="v-pills-home"
								role="tabpanel" aria-labelledby="v-pills-home-tab"
								style="width: 800px;">

								<form method="post" action="example.cgi">

									<p>
										テーマ選択<br> <input type="radio" name="q1" value="ホワイト">
										ホワイト <input type="radio" name="q1" value="ダーク"> ダーク
									</p>

									<p>
										住所表示選択<br> <input type="radio" name="q2" value="はい">
										表示 <input type="radio" name="q2" value="いいえ" checked>
										非表示
									</p>

									<p>
										電話番号表示選択<br> <input type="radio" name="q3" value="はい">
										表示 <input type="radio" name="q3" value="いいえ" disabled>
										非表示
									</p>

									<p>
										<input type="submit" value="設定を保存する">
									</p>

								</form>
							</div>
							<div class="tab-pane fade" id="v-pills-profile" role="tabpanel"
								aria-labelledby="v-pills-profile-tab">
								<link rel="stylesheet" href="../css/gaideline.css">
								<div class="wrapKOPIPE" style="margin: 0 0 0 0;">

									<div class="wrapHINAGATA">
										<h1>ガイドライン（利用規約）</h1>
										<p>この利用規約（以下，「本規約」といいます。）は，＿＿＿＿＿（以下，「当社」といいます。）がこのウェブサイト上で提供するサービス（以下，「本サービス」といいます。）の利用条件を定めるものです。登録ユーザーの皆さま（以下，「ユーザー」といいます。）には，本規約に従って，本サービスをご利用いただきます。</p>

										<h2>第1条（適用）</h2>
										<ol>
											<li>本規約は，ユーザーと当社との間の本サービスの利用に関わる一切の関係に適用されるものとします。</li>
											<li>当社は本サービスに関し，本規約のほか，ご利用にあたってのルール等，各種の定め（以下，「個別規定」といいます。）をすることがあります。これら個別規定はその名称のいかんに関わらず，本規約の一部を構成するものとします。</li>
											<li>本規約の規定が前条の個別規定の規定と矛盾する場合には，個別規定において特段の定めなき限り，個別規定の規定が優先されるものとします。</li>
										</ol>

										<h2>第2条（利用登録）</h2>
										<ol>
											<li>本サービスにおいては，登録希望者が本規約に同意の上，当社の定める方法によって利用登録を申請し，当社がこれを承認することによって，利用登録が完了するものとします。</li>
											<li>当社は，利用登録の申請者に以下の事由があると判断した場合，利用登録の申請を承認しないことがあり，その理由については一切の開示義務を負わないものとします。
												<ol>
													<li>利用登録の申請に際して虚偽の事項を届け出た場合</li>
													<li>本規約に違反したことがある者からの申請である場合</li>
													<li>その他，当社が利用登録を相当でないと判断した場合</li>
												</ol>
											</li>
										</ol>

										<h2>第3条（ユーザーIDおよびパスワードの管理）</h2>
										<ol>
											<li>ユーザーは，自己の責任において，本サービスのユーザーIDおよびパスワードを適切に管理するものとします。</li>
											<li>ユーザーは，いかなる場合にも，ユーザーIDおよびパスワードを第三者に譲渡または貸与し，もしくは第三者と共用することはできません。当社は，ユーザーIDとパスワードの組み合わせが登録情報と一致してログインされた場合には，そのユーザーIDを登録しているユーザー自身による利用とみなします。</li>
											<li>ユーザーID及びパスワードが第三者によって使用されたことによって生じた損害は，当社に故意又は重大な過失がある場合を除き，当社は一切の責任を負わないものとします。</li>
										</ol>

										<h2>第4条（利用料金および支払方法）</h2>
										<ol>
											<li>ユーザーは，本サービスの有料部分の対価として，当社が別途定め，本ウェブサイトに表示する利用料金を，当社が指定する方法により支払うものとします。</li>
											<li>ユーザーが利用料金の支払を遅滞した場合には，ユーザーは年14．6％の割合による遅延損害金を支払うものとします。</li>
										</ol>

										<h2>第5条（禁止事項）</h2>
										<p>ユーザーは，本サービスの利用にあたり，以下の行為をしてはなりません。</p>

										<ol>
											<li>法令または公序良俗に違反する行為</li>
											<li>犯罪行為に関連する行為</li>
											<li>本サービスの内容等，本サービスに含まれる著作権，商標権ほか知的財産権を侵害する行為</li>
											<li>当社，ほかのユーザー，またはその他第三者のサーバーまたはネットワークの機能を破壊したり，妨害したりする行為</li>
											<li>本サービスによって得られた情報を商業的に利用する行為</li>
											<li>当社のサービスの運営を妨害するおそれのある行為</li>
											<li>不正アクセスをし，またはこれを試みる行為</li>
											<li>他のユーザーに関する個人情報等を収集または蓄積する行為</li>
											<li>不正な目的を持って本サービスを利用する行為</li>
											<li>本サービスの他のユーザーまたはその他の第三者に不利益，損害，不快感を与える行為</li>
											<li>他のユーザーに成りすます行為</li>
											<li>当社が許諾しない本サービス上での宣伝，広告，勧誘，または営業行為</li>
											<li>面識のない異性との出会いを目的とした行為</li>
											<li>当社のサービスに関連して，反社会的勢力に対して直接または間接に利益を供与する行為</li>
											<li>その他，当社が不適切と判断する行為</li>
										</ol>

										<h2>第6条（本サービスの提供の停止等）</h2>
										<ol>
											<li>当社は，以下のいずれかの事由があると判断した場合，ユーザーに事前に通知することなく本サービスの全部または一部の提供を停止または中断することができるものとします。
												<ol>
													<li>本サービスにかかるコンピュータシステムの保守点検または更新を行う場合</li>
													<li>地震，落雷，火災，停電または天災などの不可抗力により，本サービスの提供が困難となった場合</li>
													<li>コンピュータまたは通信回線等が事故により停止した場合</li>
													<li>その他，当社が本サービスの提供が困難と判断した場合</li>
												</ol>
											</li>
											<li>当社は，本サービスの提供の停止または中断により，ユーザーまたは第三者が被ったいかなる不利益または損害についても，一切の責任を負わないものとします。</li>
										</ol>

										<h2>第7条（利用制限および登録抹消）</h2>
										<ol>
											<li>当社は，ユーザーが以下のいずれかに該当する場合には，事前の通知なく，ユーザーに対して，本サービスの全部もしくは一部の利用を制限し，またはユーザーとしての登録を抹消することができるものとします。
												<ol>
													<li>本規約のいずれかの条項に違反した場合</li>
													<li>登録事項に虚偽の事実があることが判明した場合</li>
													<li>料金等の支払債務の不履行があった場合</li>
													<li>当社からの連絡に対し，一定期間返答がない場合</li>
													<li>本サービスについて，最終の利用から一定期間利用がない場合</li>
													<li>その他，当社が本サービスの利用を適当でないと判断した場合</li>
												</ol>
											</li>
											<li>当社は，本条に基づき当社が行った行為によりユーザーに生じた損害について，一切の責任を負いません。</li>
										</ol>

										<h2>第8条（退会）</h2>
										<p>ユーザーは，当社の定める退会手続により，本サービスから退会できるものとします。</p>

										<h2>第9条（保証の否認および免責事項）</h2>
										<ol>
											<li>当社は，本サービスに事実上または法律上の瑕疵（安全性，信頼性，正確性，完全性，有効性，特定の目的への適合性，セキュリティなどに関する欠陥，エラーやバグ，権利侵害などを含みます。）がないことを明示的にも黙示的にも保証しておりません。</li>
											<li>当社は，本サービスに起因してユーザーに生じたあらゆる損害について一切の責任を負いません。ただし，本サービスに関する当社とユーザーとの間の契約（本規約を含みます。）が消費者契約法に定める消費者契約となる場合，この免責規定は適用されません。</li>
											<li>前項ただし書に定める場合であっても，当社は，当社の過失（重過失を除きます。）による債務不履行または不法行為によりユーザーに生じた損害のうち特別な事情から生じた損害（当社またはユーザーが損害発生につき予見し，または予見し得た場合を含みます。）について一切の責任を負いません。また，当社の過失（重過失を除きます。）による債務不履行または不法行為によりユーザーに生じた損害の賠償は，ユーザーから当該損害が発生した月に受領した利用料の額を上限とします。</li>
											<li>当社は，本サービスに関して，ユーザーと他のユーザーまたは第三者との間において生じた取引，連絡または紛争等について一切責任を負いません。</li>
										</ol>

										<h2>第10条（サービス内容の変更等）</h2>
										<p>当社は，ユーザーに通知することなく，本サービスの内容を変更しまたは本サービスの提供を中止することができるものとし，これによってユーザーに生じた損害について一切の責任を負いません。</p>

										<h2>第11条（利用規約の変更）</h2>
										<p>当社は，必要と判断した場合には，ユーザーに通知することなくいつでも本規約を変更することができるものとします。なお，本規約の変更後，本サービスの利用を開始した場合には，当該ユーザーは変更後の規約に同意したものとみなします。</p>

										<h2>第12条（個人情報の取扱い）</h2>
										<p>当社は，本サービスの利用によって取得する個人情報については，当社「プライバシーポリシー」に従い適切に取り扱うものとします。</p>

										<h2>第13条（通知または連絡）</h2>
										<p>ユーザーと当社との間の通知または連絡は，当社の定める方法によって行うものとします。当社は,ユーザーから,当社が別途定める方式に従った変更届け出がない限り,現在登録されている連絡先が有効なものとみなして当該連絡先へ通知または連絡を行い,これらは,発信時にユーザーへ到達したものとみなします。</p>

										<h2>第14条（権利義務の譲渡の禁止）</h2>
										<p>ユーザーは，当社の書面による事前の承諾なく，利用契約上の地位または本規約に基づく権利もしくは義務を第三者に譲渡し，または担保に供することはできません。</p>

										<h2>第15条（準拠法・裁判管轄）</h2>
										<ol>
											<li>本規約の解釈にあたっては，日本法を準拠法とします。</li>
											<li>本サービスに関して紛争が生じた場合には，当社の本店所在地を管轄する裁判所を専属的合意管轄とします。</li>
										</ol>

										<p class="tR">以上</p>


									</div>
									<!--／wrapHINAGATA-->
								</div>
								<!--／wrapKOPIPE-->


								<!-- InstanceEndEditable -->
							</div>
							<!--／wrapContents-->
							<div class="tab-pane fade" id="v-pills-messages" role="tabpanel"
								aria-labelledby="v-pills-messages-tab">
								<div class="tab-body">
									<div>
										<p>ログアウトしますか？</p>
										<a class="btn btn-primary" href="login.html" role="button">ログアウト</a>
									</div>
								</div><!--ここでログアウト-->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</head>


<body>
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
            </div>
        </div>
    </section>


 <!-- ▼▼twitter風ここから -->
  <div class="twitter__container">
    <!-- ▼タイムラインエリア scrollを外すと高さ固定解除 -->
    <div class="twitter__contents scroll">
    <!-- ここに吹き出しやスタンプのタグを追加していく -->

    <%ArrayList<post> list = (ArrayList<post>)request.getAttribute("list");
		for(int i = 0 ; i <= list.size() ; i++){
			post post = list.get(i);%>
    <!-- 記事エリア -->
      <div class="twitter__block">
        <figure>
         <img src="${pageContext.request.contextPath}/user-img/<%=post.getUser_img()%>" />
        </figure>
        <div class="twitter__block-text">
        <div hidden><%=post.getId() %>></div>
          <div class="name"><%=post.getAccount_name() %><span class="name_reply">@<%=post.getId() %></span></div>
          <div class="date"><%=post.getCreate_At() %></div>
          <div class="text">
            <%=post.getContents() %><br><img src="${pageContext.request.contextPath}/post-img/<%=post.getImg()%>" alt=<%=post.getTags_Id()%><%=post.getAddress()%>>
          </div>
        </div>
      </div>
	<%} %>
    </div>
    <!--　▲タイムラインエリア ここまで -->
  </div>
  <!--　▲twitter風ここまで -->

	</body>
</html>
