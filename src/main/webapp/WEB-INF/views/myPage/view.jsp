<%--
  Created by IntelliJ IDEA.
  User: full5-9
  Date: 2024-11-14
  Time: 오후 1:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
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
  <input type="text" id="addr2" name="addr2" value="${memberDTO.addr2}" readonly required>
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
  <button type="submit">삭제하기</button>
</form>

</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../../../resources/scripts/myPage/view.js"></script>
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
<script src="../../../resources/scripts/myPage/view.js"></script>

</html>
