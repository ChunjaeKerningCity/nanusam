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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
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
            <h2 class="textCenter" style="margin: 50px 0 20px 0; font-weight: bold;">
                공지사항
            </h2>
            <!-- 리스트 영역 -->
            <table class="boardTable">
                <thead>
                <tr>
                    <th class="col-number">번호</th>
                    <th class="col-title">제목</th>
                    <th class="col-author">작성자</th>
                    <th class="col-views">조회수</th>
                    <th class="col-date">작성날짜</th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${not empty bbsList && not empty bbsList.dtoList}">
                    <c:forEach items="${bbsList.dtoList}" var="list" varStatus="loop">
                        <tr>
                            <td class="col-number">${list.idx}</td>
                            <td class="col-title"><a class="aHref" href="/bbs/view.do?idx=${list.idx}">${list.title}</a></td>
                            <td class="col-author">${list.memberId}</td>
                            <td class="col-views">${list.readCnt}</td>
                            <td class="col-date" id="regDate">${list.regDateStr}</td>
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

            <div class="row" style="margin-top: 1rem;">
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
                        <c:if test="${bbsList.prev_page_flag}">
                            <li class="page-item prev">
                                <a class="page-link" href="/bbs/list.do?page_no=${bbsList.page_block_start - 1}" aria-label="Previous">
                                    <span> &lt; </span>
                                </a>
                            </li>
                        </c:if>
                        <c:forEach var="no" begin="${bbsList.page_block_start}" end="${bbsList.page_block_end}" step="1">
                            <li class="page-item">
                                <a class="page-link" href="/bbs/list.do?page_no=${no}">${no}</a>
                            </li>
                        </c:forEach>
                        <c:if test="${bbsList.next_page_flag}">
                            <li class="page-item next">
                                <a class="page-link" href="/bbs/list.do?page_no=${bbsList.page_block_end + 1}" aria-label="Next">
                                    <span> &gt; </span>
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

<script src="/resources/scripts/bbs/bbsScript.js"></script>
</body>
</html>
