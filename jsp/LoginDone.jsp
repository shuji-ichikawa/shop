<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/shop/css/style.css">
<title>ログイン完了</title>
</head>
<body>
<div class="dodai">
<br><br>
<h1>ようこそ、<c:set var="Login_mei" value="${Login}" />
<c:out value="${ Login_mei }" />さん<br>
ログインが完了しました。<br></h1>
<br>
	<a href ="/shop/jsp/ProductsList.jsp?Login_id=${Login_mei}" class="button">商品一覧画面へ</a>
</div>
</body>
</html>