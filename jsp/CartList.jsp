<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/shop/css/style.css">
<title>商品購入(カート)</title>
</head>
<body>
<div class="dodai">
<c:set var="Login_mei" value="${Login}" />
<p><a href="/shop/LogoutController?Login_id=${ Login_mei }">ログアウト</a></p>
<p>ようこそ、<c:out value="${ Login_mei }" />さん</p>
<h1>商品購入画面</h1>
<h2>カート一覧</h2>
	<c:forEach var="msg" items="${ msglist }">
		<c:out value="${ msg }" /><br />
	</c:forEach>
<c:choose>
<c:when test="${ cartlist.size() != 0 }">
<form action="/shop/CartList_ThanksController" method="POST">
<input type="hidden" name="Login_id" value="${ Login_mei }" />
	<table>
		<tr>
			<th>画像</th>
			<th>商品名</th>
			<th>単価</th>
			<th>数量</th>
			<th>注文</th>
		</tr>
		<c:forEach var="cartlistitem" items="${ cartlist }">
			<tr>
				<td><img src="/shop/img/${ cartlistitem.shashin }" width="50" height="50"/></td>
				<td><input type="hidden" name="shohin_mei" value="${ cartlistitem.shohin_mei }" />
					<c:out value="${ cartlistitem.shohin_mei }" /></td>
				<td><input type="hidden" name="tanka" value="${ cartlistitem.tanka }" />
					<c:out value="${ cartlistitem.tanka }" />円</td>
				<td><input type="hidden" name="kosu" value="${ cartlistitem.kosu }" />
					<c:out value="${ cartlistitem.kosu }" />個</td>
				<td><a href="/shop/DeleteController?shohin_mei=${cartlistitem.shohin_mei}&Login_id=${ Login_mei }" class="button">削除</a></td>
			</tr>
		</c:forEach>
		<tr>
			<td>合計<c:out value="${ sum }" />円</td>
		</tr>
		</table>
	<button>注文確定</button>
	</form>
	</c:when>
	<c:otherwise>カートが空です</c:otherwise>
</c:choose>
<br><br>
<a href="/shop/Login_ProductsListController?Login_id=${Login_mei}" class="button">買い物を続ける</a>
</div>
</body>
</html>