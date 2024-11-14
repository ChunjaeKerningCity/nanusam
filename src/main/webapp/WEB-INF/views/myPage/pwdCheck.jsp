<%--
  Created by IntelliJ IDEA.
  User: full5-9
  Date: 2024-11-13
  Time: 오후 8:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/member/pwdCheck.do" method="post" autocomplete="off">
    <label for="pwd">비밀번호: </label>
    <input type="password" id="pwd" name="pwd" required><br><br>
    <button type="submit">비밀번호확인</button>
</form>
<c:if test="${not empty errors}">
    <p style="color:red;">${errors}</p>
</c:if>
</body>
</html>
