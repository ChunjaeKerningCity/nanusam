function checkAgreement() {
    var termsCheckbox = document.getElementById("terms");
    if (termsCheckbox.checked) {
        var form = document.createElement('form');
        form.method = 'POST';
        form.action = '/login/registCheck.do';

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