document.addEventListener("DOMContentLoaded", () => {
  const urlParams = new URLSearchParams(window.location.search);
  let currentPage = urlParams.get('page_no');

  if (!currentPage) {
    currentPage = '1';
  }

  document.querySelectorAll('.pagination2 .page-link').forEach(link => {
    if (link.textContent.replace(/[\[\]]/g, '') === currentPage) {
      link.style.color = 'rgb(3, 199, 90)';
      link.style.border = '1px solid rgb(3, 199, 90)';
    }
  });
});

document.addEventListener("DOMContentLoaded", () => {
  document.querySelectorAll('#regDate').forEach(td => {
    td.textContent = td.textContent.substring(0, 10);
  });
});