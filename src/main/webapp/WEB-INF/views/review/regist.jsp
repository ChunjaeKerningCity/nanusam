<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2024-11-14
  Time: 오후 1:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>후기등록</title>
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
            width: 100%;
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

        textarea, select, input[type="text"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ced4da;
            border-radius: 4px;
            font-size: 14px;
        }

        textarea {
            height : 200px;
            resize: none;
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
<c:if test="${registFinished}">
    <script>
        alert("후기 등록 완료!");
        window.close();
    </script>
</c:if>
    <form action="../review/regist.do" method="post">
        <input type="hidden" name="paymentIdx" value="${paymentIdx}"/>
        <table>
            <tr>
                <td>
                    <label for="seller">판매자 : </label>
                </td>
                <td>
                    <input id="seller" type="text" name="seller" value="${seller}" readonly/>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="goodsName">상품 : </label>
                </td>
                <td>
                    <input id="goodsName" type="text" name="goodsName" value="${goodsName}" readonly/>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="buyer">구매자 : </label>
                </td>
                <td>
                    <input id="buyer" type="text" name="buyer" value="${sessionScope.memberId}" readonly/>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="score"><img src="/resources/public/star.png" alt="star score" style="margin-bottom : 3px;width:18px; height:18px;"></label>
                </td>
                <td>
                    <select id="score" name="score">
                        <option value="">평점</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                </td>
            </tr>
            <tr style="height : 200px;">
                <td>
                    <label for="content">후기내용</label>
                </td>
                <td>
                    <textarea id="content" name="content" style="resize : none;" placeholder="5자이상 200자이하로 입력하세요" minlength="5" maxlength="200"></textarea>
                </td>
            </tr>
            <tr>
                <td></td>
                <td style="display : flex; justify-content: flex-end">
                    <input style="width : 100px;" class="button confirmBtn" type="submit" value="등록">
                </td>
            </tr>
        </table>
    </form>
<script>
    console.log(window.opener);
    window.onbeforeunload = function(){
        if(window.opener  && !window.opener.closed){
            window.opener.postMessage("childClosed", "*");
        }
    }
</script>
</body>
</html>

