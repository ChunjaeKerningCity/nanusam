<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>NanuSam</title>

  <c:import url="/WEB-INF/views/commonArea/commonStyleScriptGroup.jsp" />
  <c:import url="/WEB-INF/views/commonArea/swiperLinkTag.jsp" />
</head>
<link rel="stylesheet" href="/resources/styles/login/style.css" />
<body>
<header class="center">
  <c:import url="/WEB-INF/views/commonArea/headerArea1.jsp" charEncoding="UTF-8" />
  <c:import url="/WEB-INF/views/commonArea/headerSearchArea.jsp" charEncoding="UTF-8" />
  <c:import url="/WEB-INF/views/commonArea/headerArea2.jsp" charEncoding="UTF-8" />
</header>

<main>
  <form class="login-form" action="/login/login.do" method="post" autocomplete="off">
    <h1>로그인</h1>
    <input type="text" id="memberId" name="memberId" required placeholder="Id" ><br><br>
    <input type="password" id="pwd" name="pwd" required  placeholder="Password" ><br><br>
    <c:if test="${not empty errors}">
      <p style="color:red;">${errors}</p>
    </c:if>
    <button class="login-button" type="submit">로그인</button>
    <button class="signup-button" type="submit">회원가입</button>
  </form>
  <br>
</main>

<footer class="footerContainer">
  <c:import url="/WEB-INF/views/commonArea/footerArea.jsp" />
</footer>

<c:import url="/WEB-INF/views/commonArea/swiperScriptTag.jsp" />
</body>
</html>
