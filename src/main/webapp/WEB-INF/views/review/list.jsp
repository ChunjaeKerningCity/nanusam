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
    <style>
        /* 전체 컨텐츠를 중앙 정렬 */
        .container-center {
            width: 1200px; /* 최대 너비 설정 */
            margin: 0 auto; /* 가로 중앙 정렬 */
            padding: 50px 15px;
        }
        .hd {
            font-size: 28px;
            letter-spacing: -0.5px;
            color: dimgray;
        }
        .hd2 {
            font-size: 20px;
            color: dimgray;
        }
        .navbar {
            margin-bottom: 30px; /* 상단 네비바 여백 */
        }
        .table {
            table-layout: fixed;
            width: 1170px;
        }
        .table th, .table td{
            text-align: center;
            padding: 10px;
        }

        .table td{
            min-width: 200px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            font-size : 18px;
        }
        .pagination {
            justify-content: center;
        }
        hr {
            border: 0;
            width: 100%;
            height: 1px;
            background-color: #555555; /* 선 색상 */
            margin-bottom: 20px; /* 제목과 선 사이 간격 */
        }
    </style>


    <style>
        /* 후기 리스트 스타일 */
        .review-list {
            display: flex;
            flex-direction: column;
            gap: 20px;
            padding: 20px;
        }

        /* 각 후기 카드 */
        .review-card {
            display: flex;
            align-items: flex-start;
            gap: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        /* 텍스트 영역 */
        .review-content {
            flex: 1;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .review-writer {
            font-size: 16px; /* 작성자 폰트 크기 */
            color: #999; /* 작성자 폰트 색상 */
            font-weight: bold; /* 작성자를 강조하기 위해 굵게 설정 */
        }

        .review-content {
            font-size: 18px; /* 내용 폰트 크기 */
            color: #333; /* 내용 폰트 색상 */
            line-height: 1.6; /* 가독성을 높이기 위해 줄 간격 설정 */
        }

        /* 별점과 작성자 */
        .review-header {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            align-items: center;
            font-size: 14px;
            color: dimgray;
        }

        .review-stars {
            color: gold;
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .review-text {
            font-size: 16px;
            color: #333;
            line-height: 1.5;
        }

        /* 등록일 */
        .review-footer {
            font-size: 12px;
            color: #888;
        }

        .review-button {
            padding: 5px 10px;
            border: 1px solid #ddd;
            background-color: #f5f5f5;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.2s ease;
        }

        .review-button:hover {
            background-color: #e0e0e0;
        }

        .review-button.modify {
            color: #007bff;
            border-color: #007bff;
        }

        .review-button.modify:hover {
            background-color: #cce5ff;
        }
    </style>

</header>

<main>
    <div class="container-center">
                <h2 class="hd">
                    ${memberType eq 'seller'? '판매자' : '내가 쓴'} 후기목록
                </h2>
        <c:import url="/WEB-INF/views/commonArea/sideBar.jsp" charEncoding="UTF-8" />
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
       let childWindow;
        function modify(idx){
            childWindow = window.open("/review/modify.do?idx="+idx,"_blank","width=800,height=600,resizable=no");
        }
   </script>
</c:if>
</body>
</html>
