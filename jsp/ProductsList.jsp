<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/shop/css/style.css">
<title>商品一覧</title>
</head>
<body>
<div class="dodai">
<c:set var="Login_mei" value="${Login}" />
<p><a href="/shop/LogoutController?Login_id=${ Login_mei }">ログアウト</a></p>
<p>ようこそ、<c:out value="${ Login_mei }" />さん</p>
<p><a href="/shop/ProductDetails_CartListController?Login_id=${Login_mei}">ショッピングカートを確認</a></p>
<h1>ショッピングセンター</h1>
<h2>商品一覧</h2>
	<table>
		<tr>
			<th>商品ID</th>
			<th>画像</th>
			<th>商品名</th>
			<th>単価</th>
			<th>在庫数</th>
			<th></th>
		</tr>
			<c:forEach var="product_listitem" items="${ product_list }" begin="${ offset }" end = "${ offset+num }">
				<tr>
					<td><input type="hidden" name="shohin_id" value="${ product_listitem.shohin_id }" />
						<c:out value="${ product_listitem.shohin_id }" /></td>
					<td><img src="/shop/img/${ product_listitem.shashin }" width="50" height="50"/></td>
					<td><input type="hidden" name="shohin_mei" value="${ product_listitem.shohin_mei }" />
						<c:out value="${ product_listitem.shohin_mei }" /></td>
					<td><input type="hidden" name="tanka" value="${ product_listitem.tanka }" />
						<c:out value="${ product_listitem.tanka }" />円</td>
					<td><input type="hidden" name="zaiko" value="${ product_listitem.zaiko }" />
						<c:out value="${ product_listitem.zaiko }" />個</td>
					<td><a href="/shop/ProductsList_ProductDetailsController?shohin_id=${ product_listitem.shohin_id }&Login_id=${Login_mei}" class="button">詳細</a></td>
				</tr>
			</c:forEach>
		</table>
		<table>
	<tr style="background: #d3d3d3; border-left: #d3d3d3 solid 10px; border: #d3d3d3 solid 1px; font-size: 100%; padding: 20px;">
		<td>
			<c:choose>
				<c:when test="${currentPage > 1}"><a href="/shop/jsp/ProductsList.jsp?currentPage=${ currentPage-1 }&Login_id=${Login_mei}">前へ</a></c:when>
				<c:otherwise><font color="#BBBBBB">前へ</font></c:otherwise>
			</c:choose>
		</td>
		<c:forEach begin="1" end="${ maxpage }" step="1" varStatus="status">
			<td width="30" align="center">
				<c:choose>
					<c:when test="${status.count == currentPage}">
						<font color="#BBBBBB"><input type="hidden" value="${ status.count }" /><c:out value="${ status.count }" /></font>
					</c:when>
					<c:otherwise>
						<a href="/shop/jsp/ProductsList.jsp?currentPage=${ status.count }&Login_id=${Login_mei}">${ status.count }</a>
					</c:otherwise>
				</c:choose>
			</td>
		</c:forEach>
		<td>
		<c:choose>
		   <c:when test="${currentPage < maxpage}"><a href="/shop/jsp/ProductsList.jsp?currentPage=${ currentPage+1 }&Login_id=${Login_mei}">次へ</a></c:when>
		   <c:otherwise><font color="#BBBBBB">次へ</font></c:otherwise>
		</c:choose>
		</td>
	</tr>
</table>
</div>
</body>
</html>