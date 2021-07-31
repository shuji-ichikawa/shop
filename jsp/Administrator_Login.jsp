<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者用ログイン</title>
</head>
<body>
<form action="/shop/Administrator_Login_ProductsListController" method="post">
<label>
管理者ＩＤ:	<input type="text" name="ai">
		<font color="red"><c:out value="${ msgai1 }" /><c:out value="${ msgai2 }" /></font><br>
パスワード:	<input type="password" name="ps">
		<font color="red"><c:out value="${ msgps1 }" /><c:out value="${ msgps2 }" /></font><br>
</label>
<input type="submit" value="ログイン"><br>
</form>
</body>
</html>