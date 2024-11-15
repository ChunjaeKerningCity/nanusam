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
<body>
<header class="center">
  <c:import url="/WEB-INF/views/commonArea/headerArea1.jsp" charEncoding="UTF-8" />
  <c:import url="/WEB-INF/views/commonArea/headerSearchArea.jsp" charEncoding="UTF-8" />
  <c:import url="/WEB-INF/views/commonArea/headerArea2.jsp" charEncoding="UTF-8" />
</header>
<link rel="stylesheet" href="/resources/styles/login/style.css" />

<main class="center">
  <div class="mainContent">
    <div class="loginArea">
      <form class="login-form" action="/login/login.do" method="post" autocomplete="off">
        <h1>로그인</h1>
        <input type="text" id="memberId" name="memberId" required placeholder="아이디" ><br><br>
        <input type="password" id="pwd" name="pwd" required placeholder="비밀번호" ><br><br>
        <c:if test="${not empty errors}">
          <p style="color:red;">${errors}</p>
        </c:if>
        <button class="button confirmBtn" type="submit" style="width: 100%">로그인</button>
        <button class="button2" type="button" onclick="goRegist()">회원가입</button>
      </form>
      <br>
      <script>
        function goRegist() {
          document.getElementById('memberId').removeAttribute('required');
          document.getElementById('pwd').removeAttribute('required');

          window.location.href = '/login/registCheck.do';
        }
      </script>
    </div>
  </div>
</main>

<footer class="footerContainer">
  <c:import url="/WEB-INF/views/commonArea/footerArea.jsp" />
</footer>

<c:import url="/WEB-INF/views/commonArea/swiperScriptTag.jsp" />
</body>
</html>
