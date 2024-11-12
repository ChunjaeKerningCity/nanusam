const navLinks = document.querySelectorAll(".navGnb a");

navLinks.forEach((link) => {
  link.addEventListener("mouseover", () => {
    // 현재 hover한 a 태그를 제외한 다른 a 태그에 클래스 추가
    navLinks.forEach((otherLink) => {
      if (otherLink !== link) {
        otherLink.classList.add("dimmed");
      }
    });
  });

  link.addEventListener("mouseout", () => {
    navLinks.forEach((otherLink) => {
      otherLink.classList.remove("dimmed");
    });
  });
});

// option에 따라 검색 카테고리 변경
function changeAction(formElement, selectElement) {
  formElement.action = selectElement.value;
}

document.querySelectorAll(".cardName").forEach(function (element) {
  const maxLength = 14;

  if (element.textContent.length > maxLength) {
    element.textContent = element.textContent.substring(0, maxLength) + "...";
  }
});
