<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/shop/css/style.css">
<title>新規登録</title>
</head>
<body>
<div class="dodai">
<p><a href="/shop/jsp/Login.jsp"><br>ログイン画面に戻る</a></p>
<form action="/shop/RegisterCustomer_DoneController" method="POST">
<h1>登録事項</h1>
<br>
<h2>下記の登録をお願いします</h2>
<ul>
<li>
<label>名前</label>
<input type="text" name="km" placeholder="例：山田太郎">
<div class="check"><c:out value="${ msgkm1 }" /><c:out value="${ msgkm2 }" /></div>
</li>
<li>
<label>ユーザーＩＤ</label>
<input type="text" name="ki" placeholder="半角英数字8文字以内で入力をお願いします。">
<div class="check"><c:out value="${ msgki1 }" /><c:out value="${ msgki2 }" /><c:out value="${ msgki3 }" /></div>
</li>
<li>
<label>パスワード</label>
<input type="password"  name="ps"  placeholder="半角英数字16文字以内で入力をお願いします。">
<div class="check"><c:out value="${ msgps1 }" /><c:out value="${ msgps2 }" /></div>
</li>
<li>
<label>郵便番号</label>
<input type="text" name="bin" placeholder="「-」を入れず半角数字7文字以内で入力をお願いします。">
<div class="check"><c:out value="${ msgbin1 }" /><c:out value="${ msgbin2 }" /></div>
</li>
<li>
<label>住所</label>
<input type="text" name="jyu" placeholder="例：東京都千代田区永田町1-10-1">
<div class="check"><c:out value="${ msgjyu1 }" /><c:out value="${ msgjyu2 }" /></div>
</li>
<li>
<label>電話番号</label>
<input type="text" name="den" placeholder="「-」を入れず半角数字11文字以内で入力をお願いします。">
<div class="check"><c:out value="${ msgden1 }" /><c:out value="${ msgden2 }" /></div>
</li>
</ul>
<input class="clear" type="reset" value="リセット">&emsp;&emsp;&emsp;&emsp;
<button>送信</button>
</form>
</div>
</body>
</html>