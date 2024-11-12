<%--
  Created by IntelliJ IDEA.
  User: full5-3
  Date: 2024-11-11
  Time: 오후 2:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>member regist</title>
</head>
<title>회원가입</title>
</head>
<body>
<h2>아이디 중복 확인</h2>
<form>
    <label for="memberId">아이디:</label>
    <input type="text" id="memberId" name="memberId">
    <button type="button" onclick="checkId()">확인</button>
</form>
<p id="result"></p>

<script type="text/javascript">
    function checkId() {
        const memberId = document.querySelector("#memberId").value;
        const result = document.querySelector("#result");

        if (memberId === "") {
            result.textContent = "아이디를 입력해주세요.";
            return;
        }

        const param = { uid: memberId };

        fetch('/member/existUid.do', {
            method: "POST",
            headers: {
                "Content-Type": "application/json; charset=UTF-8",
            },
            body: JSON.stringify(param),
        })
            .then((response) => response.json())
            .then((json) => {
                if (json.status) {
                    result.textContent = "사용할 수 있는 아이디입니다.";
                    result.style.color = "green";
                } else {
                    result.textContent = "이미 존재하는 아이디입니다.";
                    result.style.color = "red";
                }
            })
            .catch((error) => {
                console.error("Error:", error);
                result.textContent = "서버 오류가 발생했습니다.";
                result.style.color = "red";
            });
    }
</script>


</body>
</html>
