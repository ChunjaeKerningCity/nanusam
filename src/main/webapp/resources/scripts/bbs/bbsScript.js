document.addEventListener("DOMContentLoaded", () => {
  const currentPageNo = parseInt(new URLSearchParams(window.location.search).get('page_no'), 10);
  const pageLinks = document.querySelectorAll(".pageItem .page-link");

  pageLinks.forEach(link => {
    const pageNo = parseInt(link.getAttribute('href').match(/page_no=(\d+)/)[1], 10);
    if (pageNo === currentPageNo) {
      link.classList.add('currentPage');
    }
  });
});