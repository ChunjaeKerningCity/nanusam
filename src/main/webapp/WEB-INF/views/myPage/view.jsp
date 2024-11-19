<%@ page import="java.time.LocalDateTime" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
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
        <form class="frm-view" id="modifyForm" method="post" action="/member/modify.do" autocomplete="off">
          <input type="text" id="memberId" name="memberId" maxlength="15" minlength="5" value="${memberDTO.memberId}" required readonly>
          <div class="form-row">
            <input type="text" id="zipCode" name="zipCode" value="${memberDTO.zipCode}"  readonly  required>
            <div id="div_err_zipCode" style="display: none;"></div>
            <input  type="button" onclick="goZip()" id="zipcodeBtn" class="button confirmBtn" style="display: none;" value="우편번호 찾기" />
          </div>
          <input type="text" id="addr1" name="addr1" value="${memberDTO.addr1}"  readonly required>
          <div id="div_err_addr1" class="div_err"></div>
          <input type="text" id="addr2" name="addr2" value="${memberDTO.addr2}" readonly required >
          <div id="div_err_addr2" class="div_err"></div>
          <input type="text" id="phone" name="phone" maxlength="11" minlength="11" value="${memberDTO.phone}" readonly required>
          <span class="message"></span>
          <div id="div_err_phone" class="div_err"></div>
          <input type="email" id="email" name="email" value="${memberDTO.email}" readonly required>
          <span class="message"></span>
          <div id="div_err_email" class="div_err"></div>
          <input type="date" id="birthday" name="birthday" value="${memberDTO.birthday}" readonly required>
          <div id="div_err_birthday" class="div_err"></div>
          <button type="button" class="button confirmBtn" id="editBtn" onclick="enableEdit()" style="width: 100%">수정하기</button>
          <button type="submit" class="button confirmBtn" id="saveBtn" style="display: none; width: 100%;">저장하기</button>
          <button type="button" class="button confirmBtn" id="deleteBtn" style="background-color: #F0F0F0; width: 100%;" onclick="deleteGo()">회원 탈퇴</button>
        </form>
      </div>
    </div>
    <div class="commonRight"><c:import url="/WEB-INF/views/commonArea/sideBar.jsp" /></div>
  </div>
</main>
<c:if test="${confirmRequired}">
  <script>
    if (confirm("${errors}")) {
      document.location.href = "/member/confirmDelete.do?memberId=${memberId}";
    }
  </script>
</c:if>
<script src="/resources/scripts/cdn/postcode.v2.js"></script>
<script src="../../../resources/scripts/myPage/view.js?ts=<%=LocalDateTime.now()%>"></script>
<script>

  // 백엔드 오류메세지
  const svrValidateResult = {};
  <c:forEach items="${errors2}" var="err">
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
