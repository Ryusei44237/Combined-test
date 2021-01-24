<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/forgetpass.css">
    <title>Registration</title>
</head>
<header>
  <nav class="navbar navbar-expand-lg navbar-light bg-light ">
    <a class="nav-link disabled" href="../html/toppage.html">
      <div class="aaa">
      <img src="../image/空.jpg" width="30" height="30" class="d-inline-block align-top" alt="">
      卒研ページ
      </div>
    </a>
<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
<span class="navbar-toggler-icon"></span>
</button>
<div class="collapse navbar-collapse" id="navbarNav">
<ul class="navbar-nav">
  <li class="nav-item active">
    <a class="nav-link" href="../html/login.html">ログイン<span class="sr-only">(current)</span></a>
  </li>
  <li class="nav-item active">
    <a class="nav-link disabled" href="test.html">登録</a>
  </li>
  </ul>
</div>
</nav>
</header>
<body>
    <form>
      <h2>パスワードを忘れた方</h2>
      <p>会員登録時に登録された生年月日と<br>メールアドレスを入力してください。</p>

        <div class="form-group col-md-12">
          <label for="exampleInputEmail1">メールアドレス</label>
          <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="メールアドレスの入力...">
        </div>
        <p>生年月日</p>
        <div class="form-row" style="margin: 0px 28px 0px 28px;">
            <div class="form-group col-md-4">
                <input type="text" class="form-control" id="exampleInputYear" placeholder="年...">
              </div>

          <div class="form-group col-md-4">
            <select id="inputState" class="form-control">
              <option selected>月...</option>
              <option>1</option>
              <option>2</option>
              <option>3</option>
              <option>4</option>
              <option>5</option>
              <option>6</option>
              <option>7</option>
              <option>8</option>
              <option>9</option>
              <option>10</option>
              <option>11</option>
              <option>12</option>
            </select>
          </div>

          <div class="form-group col-md-4">
            <select id="inputState" class="form-control">
              <option selected>日...</option>
              <option>1</option>
              <option>2</option>
              <option>3</option>
              <option>4</option>
              <option>5</option>
              <option>6</option>
              <option>7</option>
              <option>8</option>
              <option>9</option>
              <option>10</option>
              <option>11</option>
              <option>12</option>
              <option>13</option>
              <option>14</option>
              <option>15</option>
              <option>16</option>
              <option>17</option>
              <option>18</option>
              <option>19</option>
              <option>20</option>
              <option>21</option>
              <option>22</option>
              <option>23</option>
              <option>24</option>
              <option>25</option>
              <option>26</option>
              <option>27</option>
              <option>28</option>
              <option>29</option>
              <option>30</option>
              <option>31</option>
            </select>
          </div>

        </div>

        <div class="form-group">
        <input type="submit" class="btn btn-primary" style="margin-bottom: 5px;" value="メールを送信する">
        </div>
        </div>
      </form>
</body>
</html>