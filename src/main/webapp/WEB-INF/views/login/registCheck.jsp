<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<textarea>대애충 약관 동으 ㅣ영역임</textarea>

<input type="checkbox" id="terms" name="terms" required>
<label for="terms">이용 약관에 동의합니다.</label><br>
<button type="button" onclick="checkAgreement()">회원가입</button>
<br>
<c:if test="${not empty errors}">
    <p style="color:red;">${errors}</p>
</c:if>

<script type="text/javascript">
    function checkAgreement() {
        var termsCheckbox = document.getElementById("terms");
        if (termsCheckbox.checked) {
            var form = document.createElement('form');
            form.method = 'POST';
            form.action = '/member/registCheck.do';

            var input = document.createElement('input');
            input.type = 'hidden';
            input.name = 'termsAgreement';
            input.value = 'true';
            form.appendChild(input);

            document.body.appendChild(form);
            form.submit();
        } else {
            alert("이용 약관에 동의해야 회원가입이 가능합니다.");
        }
    }
</script>
</body>
</html>
