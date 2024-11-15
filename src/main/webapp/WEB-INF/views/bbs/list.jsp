<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>NanuSam</title>
    <c:import url="/WEB-INF/views/commonArea/commonStyleScriptGroup.jsp" />
    <c:import url="/WEB-INF/views/commonArea/swiperLinkTag.jsp" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* 전체 컨텐츠를 중앙 정렬 */
        .container-center {
            max-width: 1200px; /* 최대 너비 설정 */
            margin: 0 auto; /* 가로 중앙 정렬 */
            padding: 50px 15px;
        }
        .input-group-addon {
            cursor: pointer;
        }
        .hd {
            font-size: 22px;
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
            width: 100%;
        }
        .table th, .table td{
            text-align: center;
            padding: 10px;
        }
        .table th{
            min-width: 200px;
        }
        .table td{
            min-width: 200px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        .table th:nth-child(2), .table th:nth-child(3) {
            text-align: right;
        }
        .table td:nth-child(2), .table td:nth-child(3) {
            text-align: right;
        }
        .pagination {
            justify-content: center;
        }
        .btnRegist {
            margin-top: 20px;
            margin-bottom: 20px;
            padding: 10px 20px;
            background-color: #888888;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            float: right;
        }
        .btnRegist:hover {
            background-color: #0056b3;
            text-decoration: none;
        }
        hr {
            border: 0;
            width: 100%;
            height: 1px;
            background-color: #555555; /* 선 색상 */
            margin-bottom: 20px; /* 제목과 선 사이 간격 */
        }
    </style>
</head>
<body>
<header class="center">
    <c:import url="/WEB-INF/views/commonArea/headerArea1.jsp" charEncoding="UTF-8" />
    <c:import url="/WEB-INF/views/commonArea/headerSearchArea.jsp" charEncoding="UTF-8" />
    <c:import url="/WEB-INF/views/commonArea/headerArea2.jsp" charEncoding="UTF-8" />
</header>
<main>
    <div class="container-center">
        <div>
            <hr/>
            <h2 class="hd">
                공지사항
            </h2>
            <!-- 리스트 영역 -->
            <table class="table table-hover">
                <thead>
                <tr class="hd2">
                    <th scope="col">제목</th>
                    <th scope="col">조회수</th>
                    <th scope="col">등록일</th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${not empty bbsList && not empty bbsList.dtoList}">
                    <c:forEach items="${bbsList.dtoList}" var="list" varStatus="loop">
                        <tr>
                            <td ><a style="color: black"  href="/bbs/view.do?idx=${list.idx}">${list.title}</a></td>
                            <td>${list.readCnt}</td>
                            <td>${list.regDate}</td>
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
            <!--// 리스트 영역 -->
        </div>

        <!-- 페이징 영역 -->
        <nav aria-label="Page navigation example">
            <ul class="pagination">
<%--                <li class="page-item">--%>
<%--                    <a class="page-link" href="<c:choose>--%>
<%--                                            <c:when test="${bbsList.page_no == 1}">#</c:when>--%>
<%--                                            <c:otherwise>?page_no=1</c:otherwise>--%>
<%--                                            </c:choose>" aria-label="첫페이지">--%>
<%--                        <span aria-hidden="true">&langle;&langle;</span>--%>
<%--                    </a>--%>
<%--                </li>--%>
                <li class="page-item">
                    <a class="page-link" href="<c:choose>
                                            <c:when test="${bbsList.prev_page_flag}">?page_no=${bbsList.page_block_start-1}</c:when>
                                            <c:otherwise>#</c:otherwise>
                                            </c:choose>" aria-label="이전">
                        <span aria-hidden="true">&langle;</span>
                    </a>
                </li>
                <c:forEach begin="${bbsList.page_block_start}" end="${bbsList.page_block_end}" var="page_num">
                    <li class="page-item ${bbsList.page_no == page_num? "active":""}"><a class="page-link" href="?page_no=${page_num}">${page_num}</a></li>
                </c:forEach>
                <li class="page-item">
                    <a class="page-link" href="<c:choose>
                                           <c:when test="${bbsList.next_page_flag}">?page_no=${bbsList.page_block_end+1}</c:when>
                                           <c:otherwise>#</c:otherwise>
                                            </c:choose>" aria-label="다음">
                        <span aria-hidden="true">&rangle;</span>
                    </a>
                </li>
<%--                <li class="page-item">--%>
<%--                    <a class="page-link" href="<c:choose>--%>
<%--                                        <c:when test="${bbsList.page_no == bbsList.total_page}">#</c:when>--%>
<%--                                        <c:otherwise>?page_no=${bbsList.total_page}</c:otherwise>--%>
<%--                                        </c:choose>" aria-label="마지막 페이지">--%>
<%--                        <span aria-hidden="true">&rangle;&rangle;</span>--%>
<%--                    </a>--%>
<%--                </li>--%>
            </ul>
        </nav>
        <!--// 페이징 영역 -->

        <!-- 글 작성 버튼/ 관리자 게시판에서만 활성화 -->
        <div>
            <button type="button" class="btnRegist" onclick="javascript:location.href='/bbs/regist.do'">글 작성</button>
        </div>
    </div>
</main>

<footer class="footerContainer">
    <c:import url="/WEB-INF/views/commonArea/footerArea.jsp" />
</footer>

<c:import url="/WEB-INF/views/commonArea/swiperScriptTag.jsp" />
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
