<%--
  Created by IntelliJ IDEA.
  User: full5-3
  Date: 2024-11-11
  Time: 오후 2:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>goods list</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<h1>goods list</h1>
${errors}
<div class="container text-center">
<%--    상품등록버튼--%>

<%--    검색폼--%>
    <div class="row justify-content-md-center">
        <form action="/goods/list.do" method="get" name="frmSearch" id="frmSearch">
            <div class="row">
                <div class="col">
                    <select name="searchCategory" id="searchCategory" class="form-select" aria-label="Default select example">
                        <option selected value="">전체</option>
                        <c:forEach items="${categories}" var="category">
                            <option value="${category.code}" ${pageinfo.searchCategory eq category.code ? 'selected' : ''}>${category.value}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col">
                    <div class="mb-3">
                        <input type="text" name="searchKeyword" id="searchKeyword" class="form-control" placeholder="상품명" value="${pageinfo.searchKeyword}">
                    </div>
                </div>
                <div class="col">

                        <div class="btn-group me-2" role="group" aria-label="First group">
                            <input type="submit" class="btn btn-secondary" id="btnSubmit" value="검색" />
                        </div>
                        <div class="btn-group me-2" role="group" aria-label="Second group">
                            <button type="button" class="btn btn-primary" onclick="location.href='/goods/regist.do';return false;">상품 등록</button>
                        </div>


                </div>
            </div>
        </form>
    </div>
<%--    상품 목록--%>
    <div class="row row-cols-auto">
        <c:forEach items="${pageinfo.dtoList}" var="item">
        <div class="col card-section">
            <div class="card" style="width: 15rem;">
                <img src="/resources/image/goods_${item.idx}_0.png" class="card-img-top" alt="/resources/image/goods_${item.idx}_0.jpg">
                <div class="card-body">
                    <h5 class="card-title">${categories[item.category].value}</h5>
                    <p class="card-text">${item.name} - ${item.price}</p>
                    <a href="/goods/view.do?idx=${item.idx}" class="btn btn-info">상세보기</a><a href="#" class="btn btn-info">장바구니</a>
                </div>
            </div>
        </div>
        </c:forEach>
    </div>
    <c:if test="${pageinfo.dtoList == null || pageinfo.dtoList.size() == 0}">
        <div class="col">
            <div class="alert alert-secondary" role="alert">
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
                        <a class="page-link" href="/goods/list.do?page_no=${pageinfo.page_block_start - pageinfo.page_size}&searchKeyword=${pageinfo.searchKeyword}&searchCategory=${pageinfo.searchCategory}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>
                <c:forEach var="no" begin="${pageinfo.page_block_start}" end="${pageinfo.page_block_end}" step="1">
                    <li class="page-item"><a class="page-link" href="/goods/list.do?page_no=${no}&searchKeyword=${pageinfo.searchKeyword}&searchCategory=${pageinfo.searchCategory}">${no}</a></li>
                </c:forEach>
                <c:if test="${pageinfo.next_page_flag}">
                    <li class="page-item">
                        <a class="page-link" href="/goods/list.do?page_no=${pageinfo.page_block_end + 1}&searchKeyword=${pageinfo.searchKeyword}&searchCategory=${pageinfo.searchCategory}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
            </ul>
        </nav>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
