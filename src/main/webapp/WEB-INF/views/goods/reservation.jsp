<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>NanuSam</title>
  <c:import url="/WEB-INF/views/commonArea/commonStyleScriptGroup.jsp" />
  <c:import url="/WEB-INF/views/commonArea/swiperLinkTag.jsp" />
  <c:import url="/WEB-INF/views/goods/mygoodsstyle.jsp"/>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<c:import url="/WEB-INF/views/commonArea/errPrintJs.jsp"/>
<header class="center">
  <c:import url="/WEB-INF/views/commonArea/headerArea1.jsp" charEncoding="UTF-8" />
  <c:import url="/WEB-INF/views/commonArea/headerArea2.jsp" charEncoding="UTF-8" />
</header>
<div class="line"></div>
<main class="marginTop">
  <div class="commonContainer">
    <div class="commonLeft"></div>
    <div class="commonMain">
<table>
  <tr style="text-align: center">
    <th>상품이미지</th>
    <th>상품명</th>
    <th>가격</th>
    <th>상세보기</th>
    <th>바로결제</th>
  </tr>

  <c:forEach items="${pageinfo.dtoList}" var="item">

    <tr>
      <td class="td-img">
        <img src="/resources/image/${item.mainImageName}" class="card-img-top"
             alt="상품이미지">
      </td>
      <td>${item.name}</td>
      <td>${item.price}</td>
      <td>
        <button onclick='location.href="/goods/view.do?idx=${item.idx}"' class="button confirmBtn">상세보기</button>
      </td>
      <td><button onclick='location.href="/payment/regist.do?goodsIdx=${item.idx}"' class="button confirmBtn">바로결제</button></td>
    </tr>

  </c:forEach>

</table>

<c:if test="${pageinfo.dtoList == null || pageinfo.dtoList.size() == 0}">
  <div class="col">
    <div class="alert alert-secondary center" role="alert">
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
    </div>
    <div class="commonRight">
      <c:import url="/WEB-INF/views/commonArea/footerArea.jsp"/>
    </div>
  </div>
</main>

<footer class="footerContainer">
  <c:import url="/WEB-INF/views/commonArea/footerArea.jsp" />
</footer>

<c:import url="/WEB-INF/views/commonArea/swiperScriptTag.jsp" />
</body>
</html>