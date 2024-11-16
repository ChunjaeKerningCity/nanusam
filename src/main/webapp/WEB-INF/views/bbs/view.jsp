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
</head>
<body>
<header class="center">
    <c:import url="/WEB-INF/views/commonArea/headerArea1.jsp" charEncoding="UTF-8" />
    <c:import url="/WEB-INF/views/commonArea/headerArea2.jsp" charEncoding="UTF-8" />
</header>

<div class="line"></div>

<main>
    <div>
        <!-- 상세 내용 -->
        <div>
            <div>
                <!-- 제목 및 작성자 정보 -->
                <h2>${dto.title}</h2>
                <div>
                    <span><strong>작성자:</strong> ${dto.memberId}</span>
                    <span><strong>작성일:</strong> ${dto.regDate}</span>
                    <span><strong>조회수:</strong> ${dto.readCnt}</span>
                </div>
                <!-- 본문 내용 -->
                <div>
                    ${dto.content}
                </div>

                <a href="/bbs/list.do" class="btn-back">목록보기</a>

                <c:if test="">

                </c:if>
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
