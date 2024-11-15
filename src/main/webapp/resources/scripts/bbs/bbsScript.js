document.addEventListener("DOMContentLoaded", () => {
  const urlParams = new URLSearchParams(window.location.search);
  const currentPage = urlParams.get('page_no');

  document.querySelectorAll('.pagination2 .page-link').forEach(link => {
    if (link.textContent.replace(/[\[\]]/g, '') === currentPage) {
      link.style.backgroundColor = '#fff1aa';
      link.style.color = 'black';
      link.style.borderColor = '#333';
    }
  });
});

document.addEventListener("DOMContentLoaded", () => {
  document.querySelectorAll('#regDate').forEach(td => {
    td.textContent = td.textContent.substring(0, 10);
  });
});