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
<style>
    .checkbox-container {
        margin-left: 75%;
        display: flex;
        align-items: center;
        font-size: 16px;
        cursor: pointer;
    }

    .checkbox-container input {
        display: none;
    }

    .checkmark {
        width: 20px;
        height: 20px;
        border: 2px solid #555;
        display: inline-block;
        position: relative;
    }

    .checkmark::after {
        content: '';
        position: absolute;
        left: 5px;
        top: 0px;
        width: 6px;
        height: 12px;
        border: solid #555;
        border-width: 0 2px 2px 0;
        transform: rotate(45deg);
        display: none;
    }

    .checkbox-container input:checked + .checkmark::after {
        display: block;
    }

    .button {
        padding: 10px 20px;
        margin: 10px;
        border: none;
        cursor: pointer;
        font-size: 16px;
    }

    .terms-content {
        display: inline-block;
        width: 800px;
        height: 500px;
        overflow: auto;
        border: 1px solid #ccc;
        padding: 5px;
    }

</style>
<main class="center">
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
                <c:if test="${not empty errors}">
                    <p style="color:red;">${errors}</p>
                </c:if>
                <br>
                <button type="button" class="button confirmBtn" onclick="checkAgreement()" style="margin-left: 85%">회원가입</button>
            </form>
        </div>
    </div>
    <br>
    <script src="../../../resources/scripts/login/registCheck.js"></script>
</main>

<footer class="footerContainer">
    <c:import url="/WEB-INF/views/commonArea/footerArea.jsp" />
</footer>

<c:import url="/WEB-INF/views/commonArea/swiperScriptTag.jsp" />
</body>
</html>
