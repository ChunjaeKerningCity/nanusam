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

<main>
  <form id="modifyForm" method="post" action="/member/modify.do" autocomplete="off">
    <label for="memberId">아이디:</label>
    <input type="text" id="memberId" name="memberId" maxlength="15" minlength="5" value="${memberDTO.memberId}" required readonly>
    <span class="message"></span>
    <br>
    <label for="name">이름:</label>
    <input type="text" id="name" name="name" maxlength="10" minlength="2" value="${memberDTO.name}" required readonly>
    <span class="message"></span>
    <div id="div_err_name" style="display: none;"></div>
    <br>
    <label for="zipCode">우편번호:</label>
    <input type="text" id="zipCode" name="zipCode" value="${memberDTO.zipCode}" readonly  required>
    <div id="div_err_zipCode" style="display: none;"></div>
    <input  type="button" onclick="goZip()" id="zipcodeBtn" style="display: none;" value="우편번호 찾기" />
    <br>
    <label for="addr1">주소:</label>
    <input type="text" id="addr1" name="addr1" value="${memberDTO.addr1}" readonly required>
    <div id="div_err_addr1" style="display: none;"></div>
    <br>
    <label for="addr2">상세 주소:</label>
    <input type="text" id="addr2" name="addr2" value="${memberDTO.addr2}" readonly required >
    <div id="div_err_addr2" style="display: none;"></div>
    <br>
    <label for="phone">휴대폰 번호:</label>
    <input type="text" id="phone" name="phone" maxlength="11" minlength="11" value="${memberDTO.phone}" readonly required>
    <span class="message"></span>
    <div id="div_err_phone" style="display: none;"></div>
    <br>
    <label for="email">이메일:</label>
    <input type="email" id="email" name="email" value="${memberDTO.email}" readonly required>
    <span class="message"></span>
    <div id="div_err_email" style="display: none;"></div>
    <br>
    <label for="birthday">생일:</label>
    <input type="date" id="birthday" name="birthday" value="${memberDTO.birthday}" readonly required>
    <div id="div_err_birthday" style="display: none;"></div>
    <br>
    <button type="button" id="editBtn" onclick="enableEdit()">수정하기</button>
    <button type="submit" id="saveBtn" style="display: none;">저장하기</button>
    <button type="button" id="deleteBtn" onclick="deleteGo()">회원 탈퇴</button>
  </form>
</main>
<c:if test="${confirmRequired}">
  <script>
    if (confirm("${errors}")) {
      document.location.href = "/member/confirmDelete.do?memberId=${memberId}";
    }
  </script>
</c:if>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../../../resources/scripts/myPage/view.js"></script>
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
