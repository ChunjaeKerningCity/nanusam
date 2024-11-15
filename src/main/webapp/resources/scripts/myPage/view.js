// 유효성검사 시작
document.addEventListener("DOMContentLoaded", function () {
    const phoneInput = document.getElementById("phone");
    const emailInput = document.getElementById("email");
    const zipCodeInput = document.getElementById("zipCode");
    const addr1Input = document.getElementById("addr1");
    const addr2Input = document.getElementById("addr2");


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

    document.getElementById("modifyForm").addEventListener("submit", function (event) {
         if (passwordInput.classList.contains("invalid") ||
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
    const memberIdField = document.getElementById("memberId");
    const nameField = document.getElementById("name");
    const zipCodeField = document.getElementById("zipCode");
    const addr1Field = document.getElementById("addr1");
    enforceReadOnly(memberIdField);
    enforceReadOnly(nameField);
    enforceReadOnly(zipCodeField);
    enforceReadOnly(addr1Field);
});

function enableEdit() {
    document.getElementById("phone").readOnly = false;
    document.getElementById("email").readOnly = false;
    document.getElementById("addr2").readOnly = false;
    document.getElementById("birthday").readOnly = false;

    document.getElementById("editBtn").style.display = "none";
    document.getElementById("saveBtn").style.display = "inline";
    document.getElementById("zipcodeBtn").style.display = "inline";
    
//삭제
function deleteGo() {
    if (confirm("정말로 탈퇴하시겠습니까?")) {

        fetch(`/member/checkGoodsStatusY?memberId=${memberId}`)
            .then(response => response.json())
            .then(data => {
                if (data.hasGoods) {
                    if (confirm("현재 판매 중인 상품이 있습니다. 해당 상품들을 모두 판매불가로 전환하시겠습니까?")) {
                        document.getElementById("modifyForm").action = "/member/delete.do";
                        document.getElementById("modifyForm").submit();
                    }
                } else {
                    // 판매 중인 상품이 없는 경우 바로 탈퇴 처리
                    document.getElementById("modifyForm").action = "/member/delete.do";
                    document.getElementById("modifyForm").submit();
                }
            })
            .catch(error => {
                console.error("탈퇴 요청 중 오류가 발생했습니다.", error);
                alert("탈퇴 처리 중 문제가 발생했습니다. 다시 시도해주세요.");
            });
    }
}

}
