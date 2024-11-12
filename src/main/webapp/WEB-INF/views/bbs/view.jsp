<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>공지사항 상세</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        .hd {
            font-size: 24px;
            font-weight: bold;
            color: #333;
        }
        .sub-info {
            font-size: 14px;
            color: #888;
            margin-bottom: 20px;
        }
        .content {
            font-size: 16px;
            line-height: 1.8;
            margin-bottom: 30px;
        }
        .btn-back {
            margin-top: 20px;
            font-size: 16px;
            padding: 10px 20px;
            background-color: #888888;
            color: white;
            border: none;
            border-radius: 5px;
        }
        .btn-back:hover {
            background-color: dimgray;
        }
    </style>
</head>
<body>

<!-- 상단 네비바 -->
<nav class="navbar navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="#">공지사항</a>
    </div>
</nav>
<!--// 상단 네비바 -->

<div class="container mt-5">
    <!-- 상세 내용 -->
    <div class="row">
        <div class="col-12">
            <!-- 제목 및 작성자 정보 -->
            <h2 class="hd">${[dto.category]}&nbsp; ${dto.title}</h2>
            <div class="sub-info">
                <span><strong>작성자:</strong> ${dto.memberId}</span> |
                <span><strong>작성일:</strong> ${dto.regDate}</span> |
                <span><strong>조회수:</strong> ${dto.readCnt}</span>
            </div>
            <hr>
            <!-- 본문 내용 -->
            <div class="content">
                ${dto.content}
            </div>

            <hr>
            <a href="/bbs/list.do" class="btn-back">목록보기</a>
            <div class="form-group row justify-content-center mt-3">
                <div class="col">
                    <button type="button" class="btnModify" onclick="javascript:location.href='/bbs/modify.do?idx=${dto.idx}'">수정</button>
                    <button type="button" class="btnDelete" onclick="javascript:location.href='/bbs/delete.do?idx=${dto.idx}'">삭제</button>
                </div>
            </div>
        </div>
    </div>
    <!--// 상세 내용 -->
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
