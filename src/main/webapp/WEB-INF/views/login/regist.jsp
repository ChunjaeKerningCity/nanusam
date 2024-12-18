<%@ page import="java.util.Date" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
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
                <div class="cardContainerTop">
                    <form id="registerForm" class="regist-form" method="post" action="/login/regist.do" autocomplete="off">
                        <h2>회원가입</h2>
                        <div class="form-row">
                            <input type="text" id="memberId" name="memberId" maxlength="15" minlength="5" value="${memberDTO.memberId}" placeholder="아이디" required>
                            <button type="button"  onclick="checkId()" disabled class="button confirmBtn" style="width: 100%; background-color: #F0F0F0"> 중복 확인 </button>
                        </div>
                        <div id="div_err_memberId" class="div_err"></div>
                        <input type="password" id="pwd" name="pwd" maxlength="20" minlength="8" value="${memberDTO.pwd}" placeholder="비밀번호" required>
                        <div id="div_err_pwd" class="div_err"></div>
                        <input type="text" id="name" name="name" maxlength="10" minlength="2" value="${memberDTO.name}" placeholder="이름" required>
                        <span class="error-name"></span>
                        <div id="div_err_name" class="div_err"></div>
                        <div class="form-row">
                            <input type="text" id="zipCode" name="zipCode" value="${memberDTO.zipCode}" readonly placeholder="우편번호" required>
                            <div id="div_err_zipCode" ></div>
                            <input class="button confirmBtn" type="button" onclick="goZip()" value="우편번호 찾기" style="width: 100%" />
                        </div>
                        <input type="text" id="addr1" name="addr1" value="${memberDTO.addr1}" readonly placeholder="주소" required>
                        <div id="div_err_addr1" class="div_err"></div>
                        <input type="text" id="addr2" name="addr2" value="${memberDTO.addr2}" placeholder="상세 주소" required>
                        <div id="div_err_addr2"class="div_err" ></div>
                        <input type="text" id="phone" name="phone" maxlength="11" minlength="11" value="${memberDTO.phone}" placeholder="휴대폰 번호" required>
                        <div id="div_err_phone" class="div_err"></div>
                        <input type="email" id="email" name="email" value="${memberDTO.email}" placeholder="이메일" required>
                        <div id="div_err_email" class="div_err"></div>
                        <input type="date" id="birthday" name="birthday" value="${memberDTO.birthday}" placeholder="생일" required>
                        <div id="div_err_birthday" class="div_err"></div>
                        <button type="submit" class="button confirmBtn" style="width: 100%">회원가입</button>
                    </form>
                </div>
            </div>
        </div>
        <div class="commonRight"></div>
    </div>
</main>
<script src="/resources/scripts/cdn/postcode.v2.js"></script>
<script src="../../../resources/scripts/login/regist.js?ts=<%=LocalDateTime.now()%>"></script>
<script>
    // 백엔드 오류메세지
    const svrValidateResult = {};
    <c:forEach items="${errors}" var="err">
    if (document.getElementById("div_err_${err.getField()}") != null){
        document.getElementById("div_err_${err.getField()}").innerHTML="<span style='color:red'>${err.getField()} 필드는 ${err.defaultMessage}</span>"
        document.getElementById("div_err_${err.getField()}").style.display = "block";
    }
    svrValidateResult['${err.defaultMessage}'] = '${err.defaultMessage}' ;
    </c:forEach>
    console.log(svrValidateResult);
</script>
<footer class="footerContainer">
    <c:import url="/WEB-INF/views/commonArea/footerArea.jsp" />
</footer>

<c:import url="/WEB-INF/views/commonArea/swiperScriptTag.jsp" />
</body>
</html>
