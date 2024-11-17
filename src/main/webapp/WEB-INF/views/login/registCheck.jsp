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
<c:import url="/WEB-INF/views/commonArea/errPrintJs.jsp"/>
<header class="center">
    <c:import url="/WEB-INF/views/commonArea/headerArea1.jsp" charEncoding="UTF-8" />
    <c:import url="/WEB-INF/views/commonArea/headerArea2.jsp" charEncoding="UTF-8" />
</header>
<div class="line"></div>
<main>
    <div class="commonContainer">
        <div class="commonLeft"></div>
        <div class="commonMain">
            <div class="mainContent">
                <div class="center">
                    <form class="frm">
                        <div class="terms-container">
                            <span class="terms-content"><%@ include file="terms.jsp" %></span>
                        </div>
                        <label class="checkbox-container">
                            <input type="checkbox" id="terms" name="terms" required >
                            <span class="checkmark"></span>
                            이용 약관에 동의합니다.
                        </label>
                        <br>
                        <button type="button" class="button confirmBtn" onclick="checkAgreement()" style="margin-left: 85%">회원가입</button>
                    </form>
                </div>
            </div>
        </div>
        <div class="commonRight"></div>
    </div>
</main>
<script src="../../../resources/scripts/login/registCheck.js"></script>
<footer class="footerContainer">
    <c:import url="/WEB-INF/views/commonArea/footerArea.jsp" />
</footer>

<c:import url="/WEB-INF/views/commonArea/swiperScriptTag.jsp" />
</body>
</html>
