<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>후기목록</title>

    <c:import url="/WEB-INF/views/commonArea/commonStyleScriptGroup.jsp" />
    <c:import url="/WEB-INF/views/commonArea/swiperLinkTag.jsp" />
</head>
<body>
<c:import url="/WEB-INF/views/commonArea/errPrintJs.jsp"/>
<header class="center">
    <c:import url="/WEB-INF/views/commonArea/headerArea1.jsp" charEncoding="UTF-8" />
    <c:import url="/WEB-INF/views/commonArea/headerArea2.jsp" charEncoding="UTF-8" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <c:import url="/WEB-INF/views/review/listStyle.jsp"/>
</header>
<div class="line"></div>
<main class="marginTop">
  <div class="commonContainer">
    <div class="commonLeft"></div>
    <div class="commonMain">
        <h2>
            ${memberType eq 'seller'? '판매자' : '내가 쓴'} 후기목록
        </h2>
        <div class="line"></div>
        <div class="review-list">
            <c:forEach items="${pageDTO.dtoList}" var="review">
                <div class="review-card">
                    <!-- 텍스트 내용 -->
                    <div class="review-content">
                            <!-- 별점과 작성자 -->
                        <div class="review-header">
                            <div class="review-stars">
                                <img src="/resources/public/star.png" alt="별점" style="width: 18px; height: 18px;" />
                                (${review.score})
                                <!-- 수정/삭제 버튼 -->
                            </div>
                            <c:if test="${memberType eq 'buyer'}" var="buyer">
                                <button class="button confirmBtn" onclick="modify(${review.idx});">수정/삭제</button>
                            </c:if>
                        </div>
                        <!-- 후기 내용 -->
                        <div class="review-text">
                            <div class="review-writer">${memberType eq 'buyer' ? review.seller : review.buyer}</div>
                            <div class="review-content">${review.content}</div>
                        </div>
                        <!-- 등록일 -->
                        <div class="review-footer">등록일: ${review.regDateStr}</div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <nav aria-label="Page navigation example">
            <ul class="pagination">
                <li class="page-item">
                    <a class="page-link" href="<c:choose>
                                                <c:when test="${pageDTO.prev_page_flag}">?page_no=${pageDTO.page_block_start-1}&${queryString}</c:when>
                                                <c:otherwise>#</c:otherwise>
                                                </c:choose>" aria-label="이전">
                        <span aria-hidden="true">&langle;</span>
                    </a>
                </li>
                <c:forEach begin="${pageDTO.page_block_start}" end="${pageDTO.page_block_end}" var="page_num">
                    <li class="page-item ${pageDTO.page_no == page_num? "active":""}"><a class="page-link" href="?page_no=${page_num}&${queryString}">${page_num}</a></li>
                </c:forEach>
                <li class="page-item">
                    <a class="page-link" href="<c:choose>
                                               <c:when test="${pageDTO.next_page_flag}">?page_no=${pageDTO.page_block_end+1}&${queryString}</c:when>
                                               <c:otherwise>#</c:otherwise>
                                                </c:choose>" aria-label="다음">
                        <span aria-hidden="true">&rangle;</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
    <div class="commonRight">
        <c:import url="/WEB-INF/views/commonArea/sideBar.jsp" charEncoding="UTF-8" />
    </div>
  </div>
</main>

<footer class="footerContainer">
    <c:import url="/WEB-INF/views/commonArea/footerArea.jsp" />
</footer>

<c:import url="/WEB-INF/views/commonArea/swiperScriptTag.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous">
</script>
<c:if test="${buyer}">
   <script>
        function modify(idx){
            window.open("/review/modify.do?idx="+idx,"_blank","width=800,height=600,resizable=no");
        }
   </script>
</c:if>
</body>
</html>
