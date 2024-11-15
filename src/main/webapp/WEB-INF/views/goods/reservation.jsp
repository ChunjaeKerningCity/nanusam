<%--
  Created by IntelliJ IDEA.
  User: full5-2
  Date: 2024-11-15
  Time: 오후 1:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>예약 상품 목록</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>

<table>
  <tr>
    <th>상품이미지</th>
    <th>상품명</th>
    <th>가격</th>
    <th>상세보기</th>
  </tr>

  <c:forEach items="${pageinfo.dtoList}" var="item">

    <tr>
      <td>
        <img src="/resources/image/${item.mainImageName}" class="card-img-top"
             alt="상품이미지">
      </td>
      <td>${item.name}</td>
      <td>${item.price}</td>
      <td>
        <a href="/goods/view.do?idx=${item.idx}" class="btn btn-info">상세보기</a>
      </td>
    </tr>

  </c:forEach>

</table>

<c:if test="${pageinfo.dtoList == null || pageinfo.dtoList.size() == 0}">
  <div class="col">
    <div class="alert alert-secondary" role="alert">
      등록된 상품이 없습니다.
    </div>
  </div>
</c:if>

<%--    페이징--%>
<div class="row" style="margin-top: 1rem;">
  <nav aria-label="Page navigation example">
    <ul class="pagination justify-content-center">
      <c:if test="${pageinfo.prev_page_flag}">
        <li class="page-item">
          <a class="page-link" href="/goods/reservation.do?page_no=${pageinfo.page_block_start - pageinfo.page_size}" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
          </a>
        </li>
      </c:if>
      <c:forEach var="no" begin="${pageinfo.page_block_start}" end="${pageinfo.page_block_end}" step="1">
        <li class="page-item"><a class="page-link" href="/goods/reservation.do?page_no=${no}">${no}</a></li>
      </c:forEach>
      <c:if test="${pageinfo.next_page_flag}">
        <li class="page-item">
          <a class="page-link" href="/goods/reservation.do?page_no=${pageinfo.page_block_end + 1}" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
          </a>
        </li>
      </c:if>
    </ul>
  </nav>
</div>


</body>
</html>
