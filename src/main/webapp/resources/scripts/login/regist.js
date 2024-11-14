let isIdChecked = false;

// 아이디 중복확인
function checkId() {
    const memberId = document.getElementById("memberId").value;
    if (!memberId) {
        alert("아이디를 입력하세요.");
        return;
    }

    fetch("/login/memberIdCheck.do", {
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
            isIdChecked = false;
        });
}

// 유효성검사 시작
document.addEventListener("DOMContentLoaded", function () {
    const memberIdInput = document.getElementById("memberId");
    const passwordInput = document.getElementById("pwd");
    const nameInput = document.getElementById("name");
    const phoneInput = document.getElementById("phone");
    const emailInput = document.getElementById("email");
    const zipCodeInput = document.getElementById("zipCode");
    const addr1Input = document.getElementById("addr1");
    const addr2Input = document.getElementById("addr2");
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
            showMessage(memberIdInput, false, "아이디는 영문자로 시작하고 5~15자의 영문자와 숫자만 사용 가능합니다.");
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
            "이름은 한글 2~10자 이내로 입력 가능합니다.");
    });

    phoneInput.addEventListener("keyup", function () {
        const phoneRegex = /^[0-9]{11}$/;
        showMessage(phoneInput, phoneRegex.test(phoneInput.value),
            "휴대폰 번호는 숫자만 입력 가능합니다.");
    });

    emailInput.addEventListener("keyup", function () {
        const emailRegex = /^[\w-]+(?:\.[\w-]+)*@[\w-]+(?:\.[\w-]+)*\.[a-zA-Z]{2,}(\.[a-zA-Z]{2,5})?$/;
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
            emailInput.classList.contains("invalid") ||
            zipCodeInput.value === "" ||
            addr1Input.value === "" ||
            addr2Input.value === ""
        ) {
            alert("입력하신 정보가 올바른지 확인해주세요.");
            event.preventDefault();
        }
    });
});

// 주소
function goZip() {
    new daum.Postcode({
        oncomplete: function (data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ""; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if (data.buildingName !== "" && data.apartment === "Y") {
                extraRoadAddr +=
                    extraRoadAddr !== ""
                        ? ", " + data.buildingName
                        : data.buildingName;
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if (extraRoadAddr !== "") {
                extraRoadAddr = " (" + extraRoadAddr + ")";
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("zipCode").value = data.zonecode;
            document.getElementById("addr1").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value =
                data.jibunAddress;

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if (data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML =
                    "(예상 도로명 주소 : " + expRoadAddr + ")";
                guideTextBox.style.display = "block";
            } else if (data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML =
                    "(예상 지번 주소 : " + expJibunAddr + ")";
                guideTextBox.style.display = "block";
            } else {
                guideTextBox.innerHTML = "";
                guideTextBox.style.display = "none";
            }
        },
    }).open();
}

// 주소 입력x
function enforceReadOnly(field) {
    field.addEventListener('focus', () => {
        field.setAttribute("readonly", true);
    });
    field.addEventListener('input', () => {
        field.setAttribute("readonly", true);
    });
}

document.addEventListener("DOMContentLoaded", () => {
    const zipCodeField = document.getElementById("zipCode");
    const addr1Field = document.getElementById("addr1");
    enforceReadOnly(zipCodeField);
    enforceReadOnly(addr1Field);
});
