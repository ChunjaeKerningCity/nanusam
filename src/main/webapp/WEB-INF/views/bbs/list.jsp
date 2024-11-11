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
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>bbs list</title>
</head>
<body>
<!--상단 네비바-->
<!--//상단 네비바-->

<div>
    <!--검색영역-->
    <!--//검색영역-->
</div>
<div>
    <!--리스트 영역-->
    <table class="table">
        <thead>
        <tr>
            <th scope="col">선택</th>
            <th scope="col">번호</th>
            <th scope="col">제목</th>
            <th scope="col">작성자</th>
            <th scope="col">조회수</th>
            <th scope="col">등록일</th>
            <th scope="col">삭제</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${bbsList.dtoList}" var="list" varStatus="loop">
            <tr>
                <th scope="row">
                    <input type="checkbox" class="form-check-input" id="bbs_idx_${list.idx}">
                </th>
                <td><c:out value="${dto.title}"/> </td>
                <td><c:out value="${dto.memberId}"/> </td>
                <td><c:out value="${dto.readCnt}"/> </td>
                <td><c:out value="${dto.regDate}"/> </td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="7" class="text-center">등록된 게시물이 존재하지 않습니다.gg</td>
        </tr>
        </tbody>
    </table>
    <!--//리스트 영역-->
</div>

</body>
</html>
