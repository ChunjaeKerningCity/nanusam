<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>

<html>
<head>
    <title>member regist</title>
</head>
<style>
    .invalid { border-color: red; }
    .valid { border-color: green; }
    .message { color: red; font-size: 0.9em; display: none; }
    .disabled { opacity: 0.5; cursor: not-allowed; }
</style>
<title>회원가입</title>
</head>
<h2>회원가입</h2>
<form id="registerForm" method="post" action="/member/regist.do" autocomplete="off">
    <label for="memberId">아이디:</label>
    <input type="text" id="memberId" name="memberId" required>
    <span class="message"></span>
    <button type="button" class="disabled" onclick="checkId()" disabled>아이디 중복확인</button>
    <span id="idCheckResult"></span>
    <div id="div_err_memberId" style="display: none;"></div>

    <br>

    <label for="pwd">비밀번호:</label>
    <input type="password" id="pwd" name="pwd" required>
    <span class="message"></span>
    <div id="div_err_pwd" style="display: none;"></div>

    <br>

    <label for="name">이름:</label>
    <input type="text" id="name" name="name" required>
    <span class="message"></span>
    <div id="div_err_name" style="display: none;"></div>

    <br>

    <label for="zipCode">우편번호:</label>
    <input type="text" id="zipCode" name="zipCode" required>
    <div id="div_err_zipCode" style="display: none;"></div>

    <br>

    <label for="addr1">주소:</label>
    <input type="text" id="addr1" name="addr1" required>
    <div id="div_err_addr1" style="display: none;"></div>

    <br>

    <label for="addr2">상세 주소:</label>
    <input type="text" id="addr2" name="addr2" required>
    <div id="div_err_addr2" style="display: none;"></div>

    <br>

    <label for="phone">휴대폰 번호:</label>
    <input type="text" id="phone" name="phone" required>
    <span class="message"></span>
    <div id="div_err_phone" style="display: none;"></div>

    <br>

    <label for="email">이메일:</label>
    <input type="email" id="email" name="email" required>
    <span class="message"></span>
    <div id="div_err_email" style="display: none;"></div>

    <br>

    <label for="birthday">생일:</label>
    <input type="date" id="birthday" name="birthday" required>
    <div id="div_err_birthday" style="display: none;"></div>

    <br>

    <button type="submit">회원가입</button>
</form>

<%--<script>
   let isIdChecked = false;

   function checkId() {
       const memberId = document.getElementById("memberId").value;
       if (!memberId) {
           alert("아이디를 입력하세요.");
           return;
       }

       fetch("/member/memberIdCheck.do", {
           method: "POST",
           headers: {
               "Content-Type": "application/x-www-form-urlencoded",
           },
           body: "memberId=" + encodeURIComponent(memberId)
       })
           .then(response => response.json())
           .then(data => {
               const idCheckResult = document.getElementById("idCheckResult");
               if (data.available) {
                   idCheckResult.textContent = "사용 가능한 아이디입니다.";
                   idCheckResult.style.color = "green";
                   isIdChecked = true;
               } else {
                   idCheckResult.textContent = "이미 사용 중인 아이디입니다.";
                   idCheckResult.style.color = "red";
                   isIdChecked = false;
               }
           })
           .catch(error => {
               const idCheckResult = document.getElementById("idCheckResult");
               idCheckResult.textContent = "중복 확인에 실패했습니다.";
               idCheckResult.style.color = "red";
           });
   }

   document.addEventListener("DOMContentLoaded", function () {
       const memberIdInput = document.getElementById("memberId");
       const passwordInput = document.getElementById("pwd");
       const nameInput = document.getElementById("name");
       const phoneInput = document.getElementById("phone");
       const emailInput = document.getElementById("email");
       const submitButton = document.querySelector("button[type='submit']");
       const checkIdButton = document.querySelector("button[onclick='checkId()']");


       function showMessage(field, isValid, message) {
           const messageEl = field.nextElementSibling;
           if (isValid) {
               messageEl.style.display = "none";
               field.classList.add("valid");
               field.classList.remove("invalid");
           } else {
               messageEl.style.display = "block";
               messageEl.innerText = message;
               field.classList.add("invalid");
               field.classList.remove("valid");
           }
       }

       memberIdInput.addEventListener("keyup", function () {
           const idRegex = /^[a-zA-Z][a-zA-Z0-9]{4,14}$/;
           if (idRegex.test(memberIdInput.value)) {
               showMessage(memberIdInput, true, "");
               checkIdButton.classList.remove("disabled");
               checkIdButton.disabled = false;
           } else {
               showMessage(memberIdInput, false, "아이디는 영문자로 시작하며 5~15자의 영문자와 숫자로 구성되어야 합니다.");
               checkIdButton.classList.add("disabled");
               checkIdButton.disabled = true;
           }
       });

       passwordInput.addEventListener("keyup", function () {
           const pwRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,20}$/;
           showMessage(passwordInput, pwRegex.test(passwordInput.value),
               "비밀번호는 영문, 숫자, 특수문자를 포함하여 8~20자로 입력해주세요.");
       });

       nameInput.addEventListener("keyup", function () {
           const nameRegex = /^[가-힣]{2,10}$/;
           showMessage(nameInput, nameRegex.test(nameInput.value),
               "이름은 한글 2~10자로 입력해주세요.");
       });

       phoneInput.addEventListener("keyup", function () {
           const phoneRegex = /^010\d{3,4}\d{4}$/;
           showMessage(phoneInput, phoneRegex.test(phoneInput.value),
               "휴대폰 번호는 010xxxxxxxx 형식으로 숫자만만 입력해주세요.");
       });

       emailInput.addEventListener("keyup", function () {
           const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
           showMessage(emailInput, emailRegex.test(emailInput.value),
               "유효한 이메일 형식으로 입력해주세요.");
       });

       document.getElementById("registerForm").addEventListener("submit", function (event) {
           if (!memberIdInput.classList.contains("valid") || !isIdChecked) {
               alert("아이디를 확인해주세요.");
               event.preventDefault();
           } else if (passwordInput.classList.contains("invalid") ||
               nameInput.classList.contains("invalid") ||
               phoneInput.classList.contains("invalid") ||
               emailInput.classList.contains("invalid")) {
               alert("입력하신 정보가 올바른지 확인해주세요.");
               event.preventDefault();
           }
       });
   });
</script>--%>
<script>

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

</body>
</html>