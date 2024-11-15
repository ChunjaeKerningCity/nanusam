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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <style>
        /* 폼을 중앙에 정렬 */
        .form-container {
            max-width: 600px; /* 폼의 최대 너비 설정 */
            margin: 0 auto; /* 화면 중앙에 폼 배치 */
            padding: 100px;
            /*border: 1px solid;*/
            border-radius: 8px;
            /*background-color: #f9f9f9;*/
        }

        .input-group {
            margin-bottom: 1.5rem;
        }

        /* 입력 필드와 span이 붙어 있도록 */
        .input-group-prepend span {
            border-radius: 0;
        }

        .input-group input,
        .input-group textarea {
            border-radius: 0;
            box-sizing: border-box;
        }

        /* 버튼 스타일 */
        .btn {
            width: 100%; /* 버튼을 전체 너비로 설정 */
            padding: 10px;
            font-size: 1.1rem;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .btnRegist {
            background-color: #888888;
            border: none;
            color: white;
        }

        .btnRegist:hover {
            background-color: #555555;
        }

        .btnInit {
            background-color: #888888;
            border: none;
            color: white;
        }

        .btnInit:hover {
            background-color: #555555;
        }

        .btnDelete {
            background-color: #888888;
            border: none;
            color: white;
        }

        .btnDelete:hover {
            background-color: #555555;
        }

        /* 버튼 그룹 정렬 */
        .form-footer {
            display: flex;
            gap: 1rem;
        }

        /* 텍스트 영역 크기 */
        textarea {
            resize: vertical;
            min-height: 100px;
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
    <div class="card-body">
        <form action="/bbs/regist.do" method="post" class="form-container">
            <!-- 제목 입력 -->
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="title">제목</span>
                </div>
                <input style="width: 80%" type="text" class="form-control" name="title" aria-describedby="basic-addon1" required>
            </div>

            <div class="input-group mb-3" style="display:none">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="bbsCode">Category</span>
                </div>
                <input type="text" class="form-control" name="bbsCode" aria-describedby="basic-addon1" value="01" readonly>
            </div>
            <!-- 아이디 입력 -->
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="memberId">작성자</span>
                </div>
                <input style="width: 80%" type="text" class="form-control" name="memberId" aria-describedby="basic-addon1" value="${memberId}" readonly>
            </div>
            <!-- 내용 입력 -->
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">내용</span>
                </div>
                <textarea style="width: 80%" class="form-control" name="content" aria-label="content" required></textarea>
            </div>

            <!-- 버튼들 -->
            <div class="form-footer">
                <button type="submit" class="btn btnRegist">등록</button>
                <button type="reset" class="btn btnInit">초기화</button>
                <button type="button" class="btn btnDelete" onclick="javascript:location.href='/bbs/list.do'">취소</button>
            </div>
        </form>
    </div>
</main>
<footer class="footerContainer">
    <c:import url="/WEB-INF/views/commonArea/footerArea.jsp" />
</footer>


<c:import url="/WEB-INF/views/commonArea/swiperScriptTag.jsp" />
</body>
</html>
