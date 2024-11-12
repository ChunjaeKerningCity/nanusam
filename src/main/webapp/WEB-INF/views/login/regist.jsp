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
<form id="registerForm" method="post" action="member/regist.do" autocomplete="off">
    <label for="memberId">아이디:</label>
    <input type="text" id="memberId" name="memberId" required>
    <span class="message"></span>
    <button type="button" class="disabled" onclick="checkId()" disabled>아이디 중복확인</button>
    <span id="idCheckResult"></span>
    <br>

    <label for="password">비밀번호:</label>
    <input type="password" id="password" name="password" required>
    <span class="message"></span>
    <br>

    <label for="name">이름:</label>
    <input type="text" id="name" name="name" required>
    <span class="message"></span>
    <br>

    <label for="zipCode">우편번호:</label>
    <input type="text" id="zipCode" name="zipCode" required>
    <br>

    <label for="addr1">주소:</label>
    <input type="text" id="addr1" name="addr1" required>
    <br>

    <label for="addr2">상세 주소:</label>
    <input type="text" id="addr2" name="addr2" required>
    <br>

    <label for="phone">휴대폰 번호:</label>
    <input type="text" id="phone" name="phone" required pattern="^\d{3}-\d{3,4}-\d{4}$">
    <span class="message"></span>
    <br>

    <label for="email">이메일:</label>
    <input type="email" id="email" name="email" required>
    <span class="message"></span>
    <br>

    <label for="birthday">생일:</label>
    <input type="date" id="birthday" name="birthday" required>
    <br>

    <button type="submit">회원가입</button>
</form>

<script>
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
                } else {
                    idCheckResult.textContent = "이미 사용 중인 아이디입니다.";
                    idCheckResult.style.color = "red";
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
        const passwordInput = document.getElementById("password");
        const nameInput = document.getElementById("name");
        const phoneInput = document.getElementById("phone");
        const emailInput = document.getElementById("email");
        const submitButton = document.querySelector("button[type='submit']");
        const checkIdButton = document.querySelector("button[onclick='checkId()']");

        let isIdChecked = false;

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

        // 아이디 정규표현식 (영문자로 시작, 영문/숫자 조합 5~15자)
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

        // 비밀번호 정규표현식 (영문, 숫자, 특수문자 포함 8~20자)
        passwordInput.addEventListener("keyup", function () {
            const pwRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,20}$/;
            showMessage(passwordInput, pwRegex.test(passwordInput.value),
                "비밀번호는 영문, 숫자, 특수문자를 포함하여 8~20자로 입력해주세요.");
        });

        // 이름 정규표현식 (한글 2~10자)
        nameInput.addEventListener("keyup", function () {
            const nameRegex = /^[가-힣]{2,10}$/;
            showMessage(nameInput, nameRegex.test(nameInput.value),
                "이름은 한글 2~10자로 입력해주세요.");
        });

        // 휴대폰 번호 정규표현식 (010-xxxx-xxxx 형식)
        phoneInput.addEventListener("keyup", function () {
            const phoneRegex = /^010-\d{3,4}-\d{4}$/;
            showMessage(phoneInput, phoneRegex.test(phoneInput.value),
                "휴대폰 번호는 010-xxxx-xxxx 형식으로 입력해주세요.");
        });

        // 이메일 정규표현식 (기본 HTML5 이메일 형식)
        emailInput.addEventListener("keyup", function () {
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            showMessage(emailInput, emailRegex.test(emailInput.value),
                "유효한 이메일 형식으로 입력해주세요.");
        });

        // 폼 제출 시 유효성 검사
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
</script>

</body>
</html>