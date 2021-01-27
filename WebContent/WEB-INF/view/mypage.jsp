<%@page import="Bean.account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="Bean.post"%>
<!-- マイページ　html -->
<!DOCTYPE html>
<html lang="ja">
<head>
	<script>
		window.addEventListener("popstate", function (e) {
		
		history.pushState(null, null, null);
		return;
		
		});
		history.pushState(null, null, null);
		</script>
<!-- 確認 -->
<meta charset="utf-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/mypage.css">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<!-- font awesome CSS -->
<script src="https://kit.fontawesome.com/86a6bb02b6.js"
	crossorigin="anonymous"></script>
<!-- end -->

<title><%=request.getAttribute("name")%>のページ</title>
<body style="background: #fcfcfc;">
	<!-- 投稿ボタンを押下した際に出てくる投稿モーダル -->
	<div id="modal">
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
						<form id="postform" action="/Combined-test/PostServlet"
							method="POST" enctype="multipart/form-data">
							<class class="form-group"> <label
								for="exampleInputEmail1">投稿文</label> <input type="text"
								class="form-control" id="testname" name="PostContents"
								placeholder="投稿文を入力"> <input type="hidden"
								name="accountid" value=<%=request.getAttribute("accountid")%>>
							<input type="hidden" name="accountname"
								value=<%=request.getAttribute("getname")%>> <input
								type="file" name="uploadFile" id="uploadFile" value="null">
							</class>
							<div class="form-group col-md-4">
								<select id="inputState" class="form-control" name="PostTags">
									<option selected>タグ選択</option>
									<option value="1">台風</option>
									<option value="2">地震</option>
									<option value="3">津波</option>
									<option value="4">洪水</option>
								</select>
							</div>
							<input type="hidden" name="value" value="post">
							<button type="submit" class="btn btn-primary" id="submit"
								name="load" value="hinagata">投稿</button>
						</form>
					</div>
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
						<div class="col-9" style="max-width: 68%;">
							<div class="tab-content" id="v-pills-tabContent">
								<div class="tab-pane fade show active" id="v-pills-home"
									role="tabpanel" aria-labelledby="v-pills-home-tab"
									style="width: 800px;">

									<p>Coming Soon...</p>

								</div>
								<div class="tab-pane fade" id="v-pills-profile" role="tabpanel"
									aria-labelledby="v-pills-profile-tab">
									<link rel="stylesheet" href="../css/gaideline.css">
									<div class="wrapKOPIPE" style="margin: 0 0 0 0;">

										<div class="wrapHINAGATA">
											<h1>ガイドライン（利用規約）</h1>
											<p>この利用規約（以下，「本規約」といいます。）は，＿＿＿＿＿（以下，「当社」といいます。）がこのウェブサイト上で提供するサービス（以下，「本サービス」といいます。）の利用条件を定めるものです。登録ユーザーの皆さま（以下，「ユーザー」といいます。）には，本規約に従って，本サービスをご利用いただきます。
											</p>

											<h2>第1条（適用）</h2>
											<ol>
												<li>本規約は，ユーザーと当社との間の本サービスの利用に関わる一切の関係に適用されるものとします。</li>
												<li>当社は本サービスに関し，本規約のほか，ご利用にあたってのルール等，各種の定め（以下，「個別規定」といいます。）をすることがあります。これら個別規定はその名称のいかんに関わらず，本規約の一部を構成するものとします。
												</li>
												<li>本規約の規定が前条の個別規定の規定と矛盾する場合には，個別規定において特段の定めなき限り，個別規定の規定が優先されるものとします。
												</li>
											</ol>

											<h2>第2条（利用登録）</h2>
											<ol>
												<li>本サービスにおいては，登録希望者が本規約に同意の上，当社の定める方法によって利用登録を申請し，当社がこれを承認することによって，利用登録が完了するものとします。
												</li>
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
												<li>ユーザーは，自己の責任において，本サービスのユーザーIDおよびパスワードを適切に管理するものとします。
												</li>
												<li>ユーザーは，いかなる場合にも，ユーザーIDおよびパスワードを第三者に譲渡または貸与し，もしくは第三者と共用することはできません。当社は，ユーザーIDとパスワードの組み合わせが登録情報と一致してログインされた場合には，そのユーザーIDを登録しているユーザー自身による利用とみなします。
												</li>
												<li>ユーザーID及びパスワードが第三者によって使用されたことによって生じた損害は，当社に故意又は重大な過失がある場合を除き，当社は一切の責任を負わないものとします。
												</li>
											</ol>

											<h2>第4条（利用料金および支払方法）</h2>
											<ol>
												<li>ユーザーは，本サービスの有料部分の対価として，当社が別途定め，本ウェブサイトに表示する利用料金を，当社が指定する方法により支払うものとします。
												</li>
												<li>ユーザーが利用料金の支払を遅滞した場合には，ユーザーは年14．6％の割合による遅延損害金を支払うものとします。
												</li>
											</ol>

											<h2>第5条（禁止事項）</h2>
											<p>ユーザーは，本サービスの利用にあたり，以下の行為をしてはなりません。</p>

											<ol>
												<li>法令または公序良俗に違反する行為</li>
												<li>犯罪行為に関連する行為</li>
												<li>本サービスの内容等，本サービスに含まれる著作権，商標権ほか知的財産権を侵害する行為</li>
												<li>当社，ほかのユーザー，またはその他第三者のサーバーまたはネットワークの機能を破壊したり，妨害したりする行為
												</li>
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
												<li>当社は，本サービスの提供の停止または中断により，ユーザーまたは第三者が被ったいかなる不利益または損害についても，一切の責任を負わないものとします。
												</li>
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
												<li>当社は，本サービスに事実上または法律上の瑕疵（安全性，信頼性，正確性，完全性，有効性，特定の目的への適合性，セキュリティなどに関する欠陥，エラーやバグ，権利侵害などを含みます。）がないことを明示的にも黙示的にも保証しておりません。
												</li>
												<li>当社は，本サービスに起因してユーザーに生じたあらゆる損害について一切の責任を負いません。ただし，本サービスに関する当社とユーザーとの間の契約（本規約を含みます。）が消費者契約法に定める消費者契約となる場合，この免責規定は適用されません。
												</li>
												<li>前項ただし書に定める場合であっても，当社は，当社の過失（重過失を除きます。）による債務不履行または不法行為によりユーザーに生じた損害のうち特別な事情から生じた損害（当社またはユーザーが損害発生につき予見し，または予見し得た場合を含みます。）について一切の責任を負いません。また，当社の過失（重過失を除きます。）による債務不履行または不法行為によりユーザーに生じた損害の賠償は，ユーザーから当該損害が発生した月に受領した利用料の額を上限とします。
												</li>
												<li>当社は，本サービスに関して，ユーザーと他のユーザーまたは第三者との間において生じた取引，連絡または紛争等について一切責任を負いません。
												</li>
											</ol>

											<h2>第10条（サービス内容の変更等）</h2>
											<p>当社は，ユーザーに通知することなく，本サービスの内容を変更しまたは本サービスの提供を中止することができるものとし，これによってユーザーに生じた損害について一切の責任を負いません。
											</p>

											<h2>第11条（利用規約の変更）</h2>
											<p>当社は，必要と判断した場合には，ユーザーに通知することなくいつでも本規約を変更することができるものとします。なお，本規約の変更後，本サービスの利用を開始した場合には，当該ユーザーは変更後の規約に同意したものとみなします。
											</p>

											<h2>第12条（個人情報の取扱い）</h2>
											<p>当社は，本サービスの利用によって取得する個人情報については，当社「プライバシーポリシー」に従い適切に取り扱うものとします。
											</p>

											<h2>第13条（通知または連絡）</h2>
											<p>ユーザーと当社との間の通知または連絡は，当社の定める方法によって行うものとします。当社は,ユーザーから,当社が別途定める方式に従った変更届け出がない限り,現在登録されている連絡先が有効なものとみなして当該連絡先へ通知または連絡を行い,これらは,発信時にユーザーへ到達したものとみなします。
											</p>

											<h2>第14条（権利義務の譲渡の禁止）</h2>
											<p>ユーザーは，当社の書面による事前の承諾なく，利用契約上の地位または本規約に基づく権利もしくは義務を第三者に譲渡し，または担保に供することはできません。
											</p>

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
									</div>
									<!--ここでログアウト-->
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--  -->
			</div>
		</div>
	</div>
	<!--  -->
</head>
<!-- ヘッド終了　以下body -->


<!-- hedear開始 -->
<section class="header">
	<div class="header_items">
		<!-- ロゴ -->
		<div id="h_item1">
			<div id="logo">
				<img
					src="https://getbootstrap.jp/docs/4.5/assets/brand/bootstrap-solid.svg"
					alt="">
			</div>
		</div>
		<!-- 画面遷移 -->
		<div id="h_item2">
			<div id="form_group">
				<form action="/Combined-test/Bridge" method="POST">
					<button type="submit" class="clear-decoration"
						style="width: fit-content;">トップページ</button>
					<input type="hidden" name="accountid"
						value=<%=request.getAttribute("id")%>>
					<!---->
					<input type="hidden" name="accountname"
						value=<%=request.getAttribute("name")%>>
					<!---->
				</form>
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
				<form class="form-inline my-2 my-lg-0"
					style="width: 20vw; display: flex;"
					action="/Combined-test/PostSearch" method="get">
					<input class="form-control mr-sm-2" type="text" name="Search"
						placeholder="Search" aria-label="Search">
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
				</form>
			</div>
			<!-- 投稿ボタン -->
			<button type="button" data-toggle="modal" data-target="#exampleModal"
				class="btn btn-primary" id="post_button">投稿</button>
			<!-- 設定ボタン -->
			<div id="setting">
				<button type="button" class="btn btn-primary" data-toggle="modal"
					data-target=".bd-example-modal-sm">
					<i class="fas fa-cog"></i>
				</button>
			</div>
		</div>
	</div>
</section>
<!--
    header終了・ マイページ（ホーム）開始
  -->
<div class="home-page">
	<img
		src="${pageContext.request.contextPath}/user-img/<%=request.getAttribute("userimg")%>"
		alt="ユーザのトップ画像" class="rounded-circle"
		style="height: 100px; width: 100px;">

	<!-- プロフィール -->
	<div class="profile">
		<div class="username">
			<h1>ユーザ名を入力</h1>
			<!-- <button class="followbutton">フォロー</button> -->
		</div>
		<div class="bg-white rounded">
			<p class="text-justify" style="background: #fcfcfc">こんにちは！</p>
		</div>
	</div>
	<!-- end -->

	<!-- タブ -->
	<ul class="nav nav-tabs" id="myTab" role="tablist">
		<li class="nav-item"><a class="nav-link active blue"
			id="home-tab" data-toggle="tab" href="#home" role="tab"
			aria-controls="home" aria-selected="true">過去投稿</a></li>
		<li class="nav-item"><a class="nav-link blue" id="profile-tab"
			data-toggle="tab" href="#profile" role="tab" aria-controls="profile"
			aria-selected="false">画像一覧</a></li>
		<li class="nav-item"><a class="nav-link blue" id="contact-tab"
			data-toggle="tab" href="#contact" role="tab" aria-controls="contact"
			aria-selected="false">アカウント管理</a></li>
	</ul>
	<div class="tab-content" id="myTabContent">
		<div class="tab-pane fade show active" id="home" role="tabpanel"
			aria-labelledby="home-tab">

			<table class="table">
				<tbody style="background-color: #f0f8ff;">
					<% ArrayList<post> list = (ArrayList<post>)request.getAttribute("list");
												for(int i = 0 ; i < list.size() ; i++){ post post=list.get(i); %>
					<tr>
						<th scope="row" style="width: 100px;">1</th>
						<td><img
							src="${pageContext.request.contextPath}/user-img/<%=post.getUser_img()%>"
							alt="" class="rounded-circle"
							style="margin-left: 0px; height: 30px; width: 30px;"> <%=post.getId() %>
							<p class="text-justify">
								<%=post.getContents() %>
							</p> <img
							src="${pageContext.request.contextPath}/user-img/<%=post.getImg()%>"
							alt="">
							<p id="hidden">
								<%=post.getAddress() %>
								<%=post.getTags_Id()%>
								<%=post.getCreate_At() %>
							</p></td>


					</tr>
					<% } %>
				</tbody>
			</table>
		</div>

		<div class="tab-pane fade" id="profile" role="tabpanel"
			aria-labelledby="profile-tab">
			<div class="insta" style="background-color: #fcfcfc;">
				<div>
					<% ArrayList<post> list2 = (ArrayList<post>)request.getAttribute("list");
														for(int i = 0 ; i < list2.size() ; i++){ post post=list2.get(i); %>
					<a> <img
						src="${pageContext.request.contextPath}/post-img/<%=post.getImg()%>"
						class="img-circle"> <span class="fa-stack fa-lg"> <i
							class="fa fa-circle fa-stack-2x"></i> <i
							class="fa fa-times fa-stack-1x fa-inverse"></i>
							<div hidden value=<%=post.getCreate_At() %>></div>
							<div hidden value=<%=post.getImg()%>></div>
					</span>
					</a>
					<%} %>
				</div>
			</div>

		</div>
		<div class="tab-pane fade" id="contact" role="tabpanel"
			aria-labelledby="contact-tab">
			<!--ここにその他-->
			<!-- アカウント情報変更タブ -->
			<form class="needs-validation" novalidate
				action="/Combined-test/Update" method="POST"
				style="background-color: #f5f5f5;">
				<div class="form-row">
					<div class="col-md-5 mb-3">
						<label for="validationCustom01">ユーザID</label> <input type="text"
							class="form-control" id="validationCustom01"
							value=<%=request.getAttribute("id")%> name="id" required>
						<div class="valid-feedback"></div>
					</div>
					<div class="col-md-5 mb-3">
						<label for="validationCustom02">名前</label> <input type="text"
							class="form-control" id="validationCustom02"
							value=<%=request.getAttribute("name")%> name="name" required>
						<div class="valid-feedback"></div>
					</div>
				</div>
				<div class="form-row">
					<div class="col-md-5 mb-3">
						<label for="validationCustom03">電話番号</label> <input type="text"
							class="form-control" id="validationCustom03"
							value=<%=request.getAttribute("tell")%> name="tell" required>
						<div class="invalid-feedback"></div>
					</div>
					<div class="col-md-5 mb-3">
						<label for="validationCustom06">メール</label> <input type="text"
							class="form-control" id="validationCustom06"
							value=<%=request.getAttribute("mail")%>
							aria-describedby="inputGroupPrepend" name="mail" required>
						<div class="invalid-feedback"></div>
					</div>
				</div>
				<div class="form-row">
					<div class="col-md-5 mb-3">
						<label for="validationCustom04">現在のパスワード</label> <input
							type="password" class="form-control" id="validationCustom04"
							placeholder="パスワード" name="password" required value=<%=request.getAttribute("password")%>>
						<div class="invalid-feedback"></div>
					</div>
					<div class="col-md-5 mb-3">
						<label for="validationCustom05">新しいパスワード</label>
						<input	type="password" class="form-control" id="validationCustom05"placeholder="パスワードの再入力をお願いします" name="password2" required>
						<div class="invalid-feedback"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value=""
							id="invalidCheck" required> <label
							class="form-check-label" for="invalidCheck"> 同意 </label>
						<div class="invalid-feedback">同意が無いと変更できません</div>
					</div>
				</div>
				<button class="btn btn-primary" type="submit">アカウント情報変更</button>
			</form>
		</div>

		<script>
											// Example starter JavaScript for disabling form submissions if there are invalid fields
											(function () {
												'use strict';
												window.addEventListener('load', function () {
													// Fetch all the forms we want to apply custom Bootstrap validation styles to
													var forms = document.getElementsByClassName('needs-validation');
													// Loop over them and prevent submission
													var validation = Array.prototype.filter.call(forms, function (form) {
														form.addEventListener('submit', function (event) {
															if (form.checkValidity() === false) {
																event.preventDefault();
																event.stopPropagation();
															}
															form.classList.add('was-validated');
														}, false);
													});
												}, false);
											})();
										</script>
		<!-- ここまで -->
	</div>
</div>
</div>
<!-- マイページ終わり -->
<!--
    Optional JavaScript
  -->

<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>
<!--ここまで-->
<script>
	window.addEventListener("popstate", function (e) {

		 history.pushState(null, null, null);
		 return;

		});
		history.pushState(null, null, null);
	</script>
</body>
<!-- body終了 -->

</html>