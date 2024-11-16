<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>후기수정</title>
    <style>
        /* 기본 레이아웃 스타일 */
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 20px;
            width: 600px;
            height: 400px;
            overflow: hidden;
        }

        /* 테이블 스타일 */
        table {
            width: 560px;
            border-collapse: collapse;
            margin-top: 10px;
        }

        td {
            padding: 8px;
            vertical-align: middle;
        }

        /* 폼 요소 스타일 */
        label, span {
            font-weight: bold;
        }

        textarea, select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ced4da;
            border-radius: 4px;
            font-size: 14px;
        }
        textarea{
            height : 200px;
        }
        /* 공통 버튼 태그 + a 태그 */
        .button {
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .confirmBtn {
            background-color: #fff1aa;
            color: black;
        }

        .confirmBtn:hover {
            background-color: #ffe97a;
        }
    </style>
</head>
<body>
<c:if test="${modifyFinished}">
    <script>
        alert("후기 수정 완료!");
        window.close();
    </script>
</c:if>
<form action="${pageContext.request.contextPath}/review/modify.do" method="post">

    <table>
        <tr>
            <td>
                <span>판매자 : </span>
            </td>
            <td>
                <span>${dto.seller}</span>
            </td>
        </tr>
        <tr>
            <td>
                <span>구매자 : </span>
            </td>
            <td>
                <span>${dto.buyer}</span>
            </td>
        </tr>
        <tr>
            <td>
                <label for="score"><img src="/resources/public/star.png" alt="star score" style="margin-bottom : 3px;width:18px; height:18px;"></label>
            </td>
            <td>
                <select id="score" name="score">
                    <option value="">평점</option>
                    <option value="1" ${dto.score eq 1 ? 'selected' : ''}>1</option>
                    <option value="2" ${dto.score eq 2 ? 'selected' : ''}>2</option>
                    <option value="3" ${dto.score eq 3 ? 'selected' : ''}>3</option>
                    <option value="4" ${dto.score eq 4 ? 'selected' : ''}>4</option>
                    <option value="5" ${dto.score eq 5 ? 'selected' : ''}>5</option>
                </select>
            </td>
        </tr>
        <tr style="height:200px;">
            <td>
                <label for="content">후기내용</label>
            </td>
            <td>
                <textarea id="content" name="content" style="resize : none;" placeholder="5자이상 200자이하로 입력하세요" minlength="5" maxlength="200">${dto.content}</textarea>
            </td>
        </tr>
        <tr>
            <td></td>
            <td style="display : flex; justify-content: flex-end">
                <input class="button confirmBtn" style="width:100px;margin-right : 10px;" type="submit" value="수정"/><input style="width:100px;" class="button confirmBtn" type="button" value="삭제" id="btnDelete"/>
            </td>
        </tr>
        <input type="hidden" name="idx" value="${dto.idx}"/>
        <input id="seller" type="hidden" name="seller" value="${dto.seller}"/>
        <input id="buyer" type="hidden" name="buyer" value="${dto.buyer}"/>
    </table>
</form>
<script>
    const btnDelete = document.getElementById("btnDelete");
    btnDelete.addEventListener("click",(e)=>{
       e.preventDefault();
       e.stopPropagation();
       let flag = confirm("정말삭제하시겠습니까?");
       if(flag){
           location.href="/review/delete.do?idx=${dto.idx}";
       }
    });
    window.addEventListener('unload',()=>{
        if (window.opener && !window.opener.closed) {
            window.opener.alert('자식 창이 닫혔습니다.');
            window.opener.location.reload();
        }
    });
</script>
</body>
</html>

