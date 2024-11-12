<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>로그인</h1>
<form action="/member/login.do" method="post">
  <label for="memberId">아이디: </label>
  <input type="text" id="memberId" name="memberId" required><br><br>
  <label for="pwd">비밀번호: </label>
  <input type="password" id="pwd" name="pwd" required><br><br>
  <button type="submit">로그인</button>
</form>
<br>
<c:if test="${not empty errors}">
  <p style="color:red;">${errors}</p>
</c:if>
</body>
</html>
