<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/shop/css/style.css">
<title>ログイン画面</title>
</head>
<body>
<div class="dodai">
<h1>ショッピングセンター</h1>
<h2>ログイン画面</h2>
<br><br>
<form action="/shop/Login_ProductsListController" method="post">
<ul>
<li>
<label>ユーザーID</label>
<input id="pi" type="text" name="ki">
<div class="check"><c:out value="${ msgki1 }" /><c:out value="${ msgki2 }" /></div>
</li>
<li>
<label>パスワード</label>
<input id="pi" type="password" name="ps">
<div class="check"><c:out value="${ msgps1 }" /><c:out value="${ msgps2 }" /></div>
</li>
</ul>
<button>ログイン</button><br><br>
<a href="/shop/jsp/RegisterCustomer.jsp" class="button">新規登録はこちら</a>
</form>
</div>
</body>
</html>