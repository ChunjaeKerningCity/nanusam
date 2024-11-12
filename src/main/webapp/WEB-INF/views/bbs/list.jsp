<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>bbs list</title>
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
            margin-bottom: 50px; /* 테이블 여백 */
        }
        .pagination {
            justify-content: center; /* 페이징 버튼 중앙 정렬 */
        }
        .btnRegist {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
        }
        .btnRegist:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<!-- 상단 네비바 -->
<!--// 상단 네비바 -->

<div class="container-center">
<%--    <div>--%>
<%--        <!-- 검색영역 -->--%>
<%--        <nav class="navbar navbar-light bg-light">--%>
<%--            <div class="container d-flex justify-content-between align-items-center">--%>
<%--                <div class="dropdown">--%>
<%--                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-expanded="false">--%>
<%--                        제목--%>
<%--                    </button>--%>
<%--                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">--%>
<%--                        <a class="dropdown-item" href="#" onclick="setDropdownValue('제목')">제목</a>--%>
<%--                        <a class="dropdown-item" href="#" onclick="setDropdownValue('내용')">내용</a>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                <form class="form-inline d-flex ml-3">--%>
<%--                    <div class="input-group">--%>
<%--                        <input class="form-control form-control-lg rounded-left" type="search" placeholder="" aria-label="Search">--%>
<%--                        <div class="input-group-append">--%>
<%--                            <button class="btn btn-outline-secondary btn-lg rounded-right" type="submit">--%>
<%--                                <i class="fas fa-search"></i>--%>
<%--                            </button>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </form>--%>
<%--            </div>--%>
<%--        </nav>--%>
<%--        <!--// 검색영역 -->--%>
<%--    </div>--%>

    <div>
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
            <c:forEach items="${bbsList.dtoList}" var="list" varStatus="loop">
                <tr>
                    <td><a href="/bbs/view.do?idx=${list.idx}">${list.title}</a></td>
                    <td>${list.readCnt}</td>
                    <td>${list.regDate}</td>
                </tr>
            </c:forEach>
            <c:if test="${bbsList == null}">
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
            <li class="page-item">
                <a class="page-link" href="<c:choose>
                                            <c:when test="${bbsList.page_no == 1}">#</c:when>
                                            <c:otherwise>?page_no=1</c:otherwise>
                                            </c:choose>" aria-label="첫페이지">
                    <span aria-hidden="true">&langle;&langle;</span>
                </a>
            </li>
            <li class="page-item">
                <a class="page-link" href="<c:choose>
                                            <c:when test="${bbsList.prev_page_flag}">?page_no=${bbsList.page_block_start-1}</c:when>
                                            <c:otherwise>#</c:otherwise>
                                            </c:choose>" aria-label="이전">
                    <span aria-hidden="true">&langle;</span>
                </a>
            </li>
            <c:forEach begin="${bbsList.page_block_start}" end="${bbsList.page_block_end}" var="page_num">
                <li class="page-item"><a class="page-link" href="?page_no=${page_num}">${page_num}</a></li>
            </c:forEach>
            <li class="page-item">
                <a class="page-link" href="<c:choose>
                                           <c:when test="${bbsList.next_page_flag}">?page_no=${bbsList.page_block_end+1}</c:when>
                                           <c:otherwise>#</c:otherwise>
                                            </c:choose>" aria-label="다음">
                    <span aria-hidden="true">&rangle;</span>
                </a>
            </li>
            <li class="page-item">
                <a class="page-link" href="<c:choose>
                                        <c:when test="${bbsList.page_no == bbsList.total_page}">#</c:when>
                                        <c:otherwise>?page_no=${bbsList.total_page}</c:otherwise>
                                        </c:choose>" aria-label="마지막 페이지">
                    <span aria-hidden="true">&rangle;&rangle;</span>
                </a>
            </li>
        </ul>
    </nav>
    <!--// 페이징 영역 -->

    <!-- 글 작성 버튼 -->
    <div>
        <button type="button" class="btnRegist" onclick="javascript:location.href='/bbs/regist.do'">글 작성</button>
    </div>
</div>
<!-- 푸터 -->
<!--// 푸터 -->

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    // 드롭다운 값 설정 함수
    function setDropdownValue(value) {
        // 버튼의 텍스트를 클릭한 값으로 변경
        document.getElementById("dropdownMenuButton").innerText = value;
    }
</script>
</body>
</html>
