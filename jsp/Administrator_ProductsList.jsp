<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者用商品一覧</title>
</head>
<body>
<h1>ショッピングセンター</h1>
<p><a href="/shop/jsp/Administrator_Login.jsp">ログアウト</a></p>
<h2>商品一覧</h2>
	<p><a href="/shop/jsp/Administrator_Register.jsp">商品登録</a></p>
	<table border="1">
		<tr>
			<th>商品ID</th>
			<th>画像</th>
			<th>商品名</th>
			<th>単価</th>
			<th>在庫数</th>
		</tr>
			<c:forEach var="product_listitem" items="${ product_list }">
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
				</tr>
			</c:forEach>
		</table>
</body>
</html>