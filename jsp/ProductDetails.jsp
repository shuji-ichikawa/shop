<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/shop/css/style.css">
<title>商品詳細</title>
</head>
<body>
<div class="dodai">
	<form action="/shop/ProductDetails_CartListController" method="POST">
	<input type="hidden" name="shohin_id" value="${ product_detail.shohin_id }"/>
	<c:set var="Login_mei" value="${Login}" />
	<input type="hidden" name="Login_id" value="${ Login_mei }" />
	<p><a href="/shop/LogoutController?Login_id=${ Login_mei }">ログアウト</a></p>
	<p>ようこそ、<c:out value="${ Login_mei }" />さん</p>
	<p><a href="/shop/ProductDetails_CartListController?Login_id=${Login_mei}">ショッピングカートを確認</a></p>
	<h1>ショッピングセンター</h1>
	<br>
	<h2>商品詳細</h2>
		<table>
			<tr>
				<th>画像</th>
				<th>商品名</th>
				<th>単価</th>
				<th>在庫数</th>
				<th>注文数</th>
			</tr>
			<tr>
				<td><input type="hidden" name="shashin" value="${ product_detail.shashin }"/><img src="/shop/img/${ product_detail.shashin }" width="100" height="100"/></td>
				<td><input type="hidden" name="shohin_mei" value="${ product_detail.shohin_mei }" />
				<c:out value="${ product_detail.shohin_mei }"/></td>
				<td><input type="hidden" name="tanka" value="${ product_detail.tanka }" />
					<c:out value="${ product_detail.tanka }"/>円</td>
				<td><c:out value="${ product_detail.zaiko }"/>個</td>
				<td><c:choose><c:when test="${ product_detail.zaiko - oldprbean.kosu > 0 }">
					<select name="kosu">
					<c:forEach var="i" begin="1" end="${ product_detail.zaiko - oldprbean.kosu }" step="1">
					<option value="${ i }"><c:out value="${ i }" /></option>
					</c:forEach>
					</select>個
					</c:when><c:otherwise>これ以上注文できません。</c:otherwise></c:choose>
				</td>
			</tr>
		</table>
		<table>
		<tr>
		<c:choose><c:when test="${ product_detail.zaiko - oldprbean.kosu != 0 }">
			<td><button>ショッピングカートに入れる</button></td>
		</c:when></c:choose>
			<td><a href="/shop/Login_ProductsListController?Login_id=${Login_mei}" class="button">買い物を続ける</a></td>
		</tr>
	</table>
	<br><br>
	</form>
</div>
</body>
</html>