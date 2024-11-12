<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>

<html>
<head>
    <title>member regist</title>
</head>
<title>회원가입</title>
</head>
<h2>회원가입</h2>

<form id="registerForm" method="post" action="member/regist.do" autocomplete="off">
    <label for="memberId">아이디:</label>
    <input type="text" id="memberId" name="memberId" required>
    <button type="button" onclick="checkId()">아이디 중복확인</button>

    <label for="password">비밀번호:</label>
    <input type="password" id="password" name="password" required>

    <label for="name">이름:</label>
    <input type="text" id="name" name="name" required>

    <label for="addr1">우편번호:</label>
    <input type="text" id="zipCode" name="zipCode" required>

    <label for="addr1">주소:</label>
    <input type="text" id="addr1" name="addr1" required>

    <label for="addr1">주소:</label>
    <input type="text" id="addr2" name="addr2" required>

    <label for="phone">휴대폰 번호:</label>
    <input type="text" id="phone" name="phone" required pattern="^\d{3}-\d{3,4}-\d{4}$">

    <label for="email">이메일:</label>
    <input type="email" id="email" name="email" required>

    <label for="birthday">생일:</label>
    <input type="date" id="birthday" name="birthday" required>

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
</script>

</body>
</html>
