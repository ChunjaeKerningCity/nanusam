<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2024-11-14
  Time: 오후 1:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>후기등록</title>
</head>
<body>
    <form action="../review/regist.do" method="post">
        <label for="seller">판매자 : </label><input id="seller" type="text" name="buyer" value="${buyer}" readonly/>
        <label for="buyer">구매자 : </label><input id="buyer" type="text" name="seller" value="${sessionScope.memberId}" readonly/>
        <label for="score"><img src="/resources/public/star.png" alt="star score" style="margin-bottom : 3px;width:18px; height:18px;"></label>
        <select id="score" name="score">
            <option value="">평점</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
        </select>
        <label for="content">후기내용</label>
        <textarea id="content" name="content" style="resize : none;">

        </textarea>
        <input type="submit">
    </form>
</body>
</html>

