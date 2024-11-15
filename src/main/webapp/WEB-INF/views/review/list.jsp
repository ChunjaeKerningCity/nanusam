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
    <c:import url="/WEB-INF/views/commonArea/headerSearchArea.jsp" charEncoding="UTF-8" />
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

</header>

<main>
    <div class="container-center">
        <div>
            <hr/>
            <h2 class="hd">
                ${memberType eq 'seller'? '판매자' : '내가 쓴'} 후기목록
            </h2>
            <hr/>
            <table class="table table-hover">
                <thead>
                <tr class="hd2">
                    <th scope="col" style="width:10%;">번호</th>
                    <th scope="col" style="width:10%;">평점</th>
                    <th scope="col" style="text-align : left;">후기</th>
                    <th scope="col" style="width:10%;">${memberType eq 'seller'? '작성자' : '판매자'}</th>
                    <th scope="col" style="width:10%;">등록일</th>
                    <c:if test="${memberType eq 'buyer'}" var="buyer">
                        <th scope="col" style="width:10%;">수정/삭제</th>
                    </c:if>
                </tr>
                </thead>
                <tbody>
                <c:if test="${not empty pageDTO && not empty pageDTO.dtoList}">
                    <c:forEach items="${pageDTO.dtoList}" var="review" varStatus="loop">
                        <tr>
                            <td>${pageDTO.total_count-(pageDTO.page_no-1)*pageDTO.page_size-loop.count+1}</td>
                            <td style="color : #555;"><img src="/resources/public/star.png" alt="star score" style="margin-bottom : 3px;width:18px; height:18px;"> (${review.score})</td>
                            <td style="text-align : left;">${review.content}</td>
                            <td>${memberType eq 'buyer'? review.seller : review.buyer}</td>
                            <td>${review.regDateStr}</td>
                            <c:if test="${buyer}">
                                <td><button id="btnModify" onclick="modify(${review.idx})">수정/삭제</button>></td>
                            </c:if>
                        </tr>
                    </c:forEach>
                </c:if>
                <c:if test="${empty pageDTO.dtoList}">
                    <tr>
                        <td colspan="7" class="text-center">후기가 존재하지 않습니다.</td>
                    </tr>
                </c:if>
                </tbody>
            </table>
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
            childWindow = window.open("/review/modify.do?idx="+idx,"_blank","width=600,height=400,resizable=no");
        }

   </script>
</c:if>
</body>
</html>
