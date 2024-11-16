<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>NanuSam</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <c:import url="/WEB-INF/views/commonArea/commonStyleScriptGroup.jsp"/>
    <c:import url="/WEB-INF/views/commonArea/swiperLinkTag.jsp"/>
    <link rel="stylesheet" href="/resources/styles/style2.css" />
</head>
<body>
<c:import url="/WEB-INF/views/commonArea/errPrintJs.jsp"/>
<header class="center">
    <c:import url="/WEB-INF/views/commonArea/headerArea1.jsp" charEncoding="UTF-8"/>
    <c:import url="/WEB-INF/views/commonArea/headerArea2.jsp" charEncoding="UTF-8"/>
</header>
<div class="line"></div>
<main style="margin-top:20px">
    <div class="commonContainer">
        <div class="commonLeft"></div>
        <div class="commonMain">
            <c:import url="/WEB-INF/views/commonArea/errPrintJs.jsp"/>
            <div class="container text-center">
                <%--    검색폼--%>
                <div class="row justify-content-md-center">
                    <div class="col">
                        <div style="">
                            <%@ include file="/WEB-INF/views/commonArea/headerSearchArea2.jsp" %>
                        </div>
                    </div>
                    <div class="col-md-auto">
                        <div class="btn-group me-2" role="group" aria-label="Second group">
                            <button style="padding-top: 15px; padding-bottom: 15px; margin: 0" type="button"
                                    class="button confirmBtn" onclick="location.href='/goods/regist.do';return false;">
                                상품 등록
                            </button>
                        </div>
                    </div>
                </div>
                <%--    상품 목록--%>
                <div class="center">
                    <div class="cardContainer" id="cardContainer">
                        <c:forEach items="${pageinfo.dtoList}" var="item">
                            <a href="/goods/view.do?idx=${item.idx}" class="card2">
                                <img
                                        src="/resources/image/${item.mainImageName}"
                                        class="cardImage"
                                        alt="상품 이미지"
                                />
                                <p class="cardName">${item.name}</p>
                                <div class="cardInfo">
                                    <p class="cardPrice">${item.price}</p>
                                    <p class="regDate">${item.regDateStr}</p>
                                </div>
                            </a>
                        </c:forEach>
                    </div>
                </div>

<%--                <div class="row row-cols-auto">--%>
<%--                    <c:forEach items="${pageinfo.dtoList}" var="item">--%>
<%--                        <div class="col card-section">--%>
<%--                            <div class="card" style="width: 265px;">--%>
<%--                                <img src="/resources/image/goods_${item.idx}_0.png" class="card-img-top"--%>
<%--                                     alt="/resources/image/goods_${item.idx}_0.jpg">--%>
<%--                                <div class="card-body">--%>
<%--                                    <h5 class="card-title">${categories[item.category].value}</h5>--%>
<%--                                    <p class="card-text">${item.name} - ${item.price}</p>--%>
<%--                                    <a href="/goods/view.do?idx=${item.idx}" class="button confirmBtn"--%>
<%--                                       style="background-color: #F0F0F0">상세보기</a><a--%>
<%--                                        href="/cart/add.do?goodsIdx=${item.idx}&memberId=${memberId}"--%>
<%--                                        class="button confirmBtn" style="background-color: #F0F0F0">장바구니</a>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </c:forEach>--%>
<%--                </div>--%>
                <c:if test="${pageinfo.dtoList == null || pageinfo.dtoList.size() == 0}">
                    <div class="col">
                        <div class="alert alert-secondary center" role="alert">
                            검색 결과 없음
                        </div>
                    </div>
                </c:if>
                <%--    페이징--%>
                <div class="row" style="margin-top: 1rem;">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-center">
                            <c:if test="${pageinfo.prev_page_flag}">
                                <li class="page-item">
                                    <a class="page-link"
                                       href="/goods/list.do?page_no=${pageinfo.page_block_start - 1}&searchKeyword=${pageinfo.searchKeyword}&searchCategory=${pageinfo.searchCategory}"
                                       aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:forEach var="no" begin="${pageinfo.page_block_start}" end="${pageinfo.page_block_end}"
                                       step="1">
                                <li class="page-item"><a class="page-link"
                                                         href="/goods/list.do?page_no=${no}&searchKeyword=${pageinfo.searchKeyword}&searchCategory=${pageinfo.searchCategory}">${no}</a>
                                </li>
                            </c:forEach>
                            <c:if test="${pageinfo.next_page_flag}">
                                <li class="page-item">
                                    <a class="page-link"
                                       href="/goods/list.do?page_no=${pageinfo.page_block_end + 1}&searchKeyword=${pageinfo.searchKeyword}&searchCategory=${pageinfo.searchCategory}"
                                       aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
        <div class="commonRight"></div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <c:if test="${not empty alertMessage}">
        <script type="text/javascript">
            alert("${alertMessage}");
        </script>
    </c:if>
</main>

<footer class="footerContainer">
    <c:import url="/WEB-INF/views/commonArea/footerArea.jsp"/>
</footer>

<c:import url="/WEB-INF/views/commonArea/swiperScriptTag.jsp"/>
</body>
</html>
