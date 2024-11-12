<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>

<html>
<head>
    <title>member regist</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<title>회원가입</title>
</head>

<body>
<h2>회원가입</h2>
<form method="POST" id="registForm">
    <label>아이디: </label>
    <input type="text" id="memberId" name="memberId" required>
    <button type="button" onclick="checkId()">아이디 중복확인</button>
    <span id="idCheckResult"></span>
    <br><br>
    <label>비밀번호: </label>
    <input type="password" name="pwd" required>
    <br><br>
    <button type="submit">회원가입</button>
</form>

<script>
    function checkId() {
        const memberId = $("#memberId").val();
        if (!memberId) {
            alert("아이디를 입력하세요.");
            return;
        }
        $.ajax({
            url: "/member/memberIdCheck.do",
            type: "POST",
            data: { memberId: memberId },
            success: function(response) {
                if (response.available) {
                    $("#idCheckResult").text("사용 가능한 아이디입니다.").css("color", "green");
                } else {
                    $("#idCheckResult").text("이미 사용 중인 아이디입니다.").css("color", "red");
                }
            },
            error: function() {
                $("#idCheckResult").text("중복 확인에 실패했습니다.").css("color", "red");
            }
        });
    }
</script>

</body>
</html>
