<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>NanuSam</title>
    <c:import url="/WEB-INF/views/commonArea/commonStyleScriptGroup.jsp" />
    <c:import url="/WEB-INF/views/commonArea/swiperLinkTag.jsp" />
    <style>
        @import url('https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css');
        p {
            margin: 0;
        }

        .h1 {
            font-size: 48px;
            margin: 0;
        }

        .underH1 {
            font-size: 18px;
            display: flex;
            justify-content: space-between;
        }

        .regDate {
            font-size: 18px;
        }

        .lineA {
            width: 100%;
            border-bottom: 1px solid #ddd;
            margin: 50px 0 50px 0;
        }

        .bbsContent {
            color: black;
            font-size: 20px;
            font-family: Pretendard, "Noto Sans Korea", "Apple SD Gothic Neo", "Malgun Gothic", sans-serif;
            padding: 20px;
        }

        #a {
            display: inline-block;
            margin-bottom: 20px;
            font-size: 20px;
            font-weight: bold;
            transition: background-color 0.3s, transform 0.2s;
        }

        #a:hover {
            transform: scale(1.05); /* 약간 확대 */
        }

        .mainContent {
            min-height: 0;
        }
    </style>
</head>
<body>
<header class="center">
    <c:import
        url="/WEB-INF/views/commonArea/headerArea1.jsp"
        charEncoding="UTF-8"
    />
    <c:import
        url="/WEB-INF/views/commonArea/headerArea2.jsp"
        charEncoding="UTF-8"
    />
</header>

<div class="line"></div>

<main class="center">
    <div>
        <div class="mainContent">
            <h1 class="h1">[공지사항] ${dto.title}</h1>
            <div class="underH1">
                <div class="regDate">${dto.regDate}</div>
                <div>
                    <span>작성자: ${dto.memberId}</span>
                    <span>조회수: ${dto.readCnt}</span>
                </div>
            </div>

            <div class="lineA"></div>
            <div class="bbsContent">
                ${dto.content}
            </div>
        </div>
        <div class="lineA"></div>
        <div style="margin-bottom: 20px; width: 250px; height: 50px; margin-left: 20px">
            <a class="aHref" id="a" href="/bbs/list.do">◀ 목록으로</a>
        </div>
    </div>
</main>

<footer class="footerContainer">
    <c:import url="/WEB-INF/views/commonArea/footerArea.jsp" />
</footer>

<c:import url="/WEB-INF/views/commonArea/swiperScriptTag.jsp" />

<script>
    document.addEventListener("DOMContentLoaded", () => {
        document.querySelectorAll('.regDate').forEach(element => {
            let content = element.textContent.trim();
            if (content.length > 10) {
                element.textContent = content.substring(0, 10);
            }
        });
    });
</script>

</body>
</html>
