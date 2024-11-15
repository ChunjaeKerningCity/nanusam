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
    <link href="/resources/styles/bbs/listStyle.css" rel="stylesheet" />
    <style>
    </style>
</head>
<body>
<header class="center">
    <c:import url="/WEB-INF/views/commonArea/headerArea1.jsp" charEncoding="UTF-8" />
    <c:import url="/WEB-INF/views/commonArea/headerArea2.jsp" charEncoding="UTF-8" />
</header>

<div class="line"></div>

<main>
    <div class="commonContainer">
        <div class="commonLeft"></div>
        <div class="commonMain">
            <h2 class="textCenter">
                공지사항
            </h2>
            <!-- 리스트 영역 -->
            <table class="boardTable">
                <thead>
                <tr>
                    <th>제목</th>
                    <th>조회수</th>
                    <th>등록일</th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${not empty bbsList && not empty bbsList.dtoList}">
                    <c:forEach items="${bbsList.dtoList}" var="list" varStatus="loop">
                        <tr>
                            <td ><a style="color: black"  href="/bbs/view.do?idx=${list.idx}">${list.title}</a></td>
                            <td>${list.readCnt}</td>
                            <td id="regDate">${list.regDateStr}</td>
                        </tr>
                    </c:forEach>
                </c:if>
                <c:if test="${empty bbsList.dtoList}">
                    <tr>
                        <td colspan="7" class="text-center">등록된 게시물이 존재하지 않습니다.</td>
                    </tr>
                </c:if>
                </tbody>
            </table>

            <div class="pagination">
                <nav aria-label="Page navigation example">
                    <ul class="pagination2 flex">
                        <c:if test="${bbsList.prev_page_flag}">
                            <li class="pageItem">
                                <a class="page-link" href="/bbs/list.do?page_no=${bbsList.page_block_start - 1}" aria-label="Previous">
                                    <span> < </span>
                                </a>
                            </li>
                        </c:if>
                        <c:forEach var="no" begin="${bbsList.page_block_start}" end="${bbsList.page_block_end}" step="1">
                            <li class="pageItem">
                                <a class="page-link" href="/bbs/list.do?page_no=${no}">[${no}]</a>
                            </li>
                        </c:forEach>
                        <c:if test="${bbsList.next_page_flag}">
                            <li class="page-item">
                                <a class="page-link" href="/bbs/list.do?page_no=${bbsList.page_block_end + 1}" aria-label="Next">
                                    <span> > </span>
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="commonRight"></div>
    </div>
</main>

<footer class="footerContainer">
    <c:import url="/WEB-INF/views/commonArea/footerArea.jsp" />
</footer>

<c:import url="/WEB-INF/views/commonArea/swiperScriptTag.jsp" />

<script src="/resources/scripts/bbs/bbsScript.js"></script>
</body>
</html>
