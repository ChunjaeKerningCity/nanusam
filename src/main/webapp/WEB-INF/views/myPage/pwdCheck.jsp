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
<c:import url="/WEB-INF/views/commonArea/errPrintJs.jsp"/>
<header class="center">
    <c:import url="/WEB-INF/views/commonArea/headerArea1.jsp" charEncoding="UTF-8" />
    <c:import url="/WEB-INF/views/commonArea/headerSearchArea.jsp" charEncoding="UTF-8" />
    <c:import url="/WEB-INF/views/commonArea/headerArea2.jsp" charEncoding="UTF-8" />
</header>

<link rel="stylesheet" href="/resources/styles/login/style.css" />
<main class="center">
    <div class="mainContent">
            <form class="pwd-form" action="/member/pwdCheck.do" method="post" autocomplete="off">
                <h3>${memberName}님 비밀번호를 입력해주세요.</h3>
                <input type="password" id="pwd" name="pwd" required placeholder="비밀번호"><br><br>
                <button class="button confirmBtn" type="submit">비밀번호확인</button>
            </form>
            <c:if test="${not empty errors}">
                <p style="color:red;">${errors}</p>
            </c:if>
        </div>
</main>


<footer class="footerContainer">
    <c:import url="/WEB-INF/views/commonArea/footerArea.jsp" />
</footer>

<c:import url="/WEB-INF/views/commonArea/swiperScriptTag.jsp" />
</body>
</html>
