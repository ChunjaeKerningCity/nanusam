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
<c:import url="/WEB-INF/views/commonArea/errPrintJs.jsp"/>
<header class="center">
  <c:import url="/WEB-INF/views/commonArea/headerArea1.jsp" charEncoding="UTF-8" />
  <c:import url="/WEB-INF/views/commonArea/headerSearchArea.jsp" charEncoding="UTF-8" />
  <c:import url="/WEB-INF/views/commonArea/headerArea2.jsp" charEncoding="UTF-8" />
</header>

<main class="marginTop">
  <div class="commonContainer">
    <div class="commonLeft">왼쪽 내용</div>
    <div class="commonMain">메인 내용</div>
    <div class="commonRight">오른쪽 내용</div>
  </div>
  <div>걍 한 줄 쓰고 싶으면 이거 쓰고</div>
  라인 넣고 싶으면
  <div class="line"></div>
  이거 넣고
  <div class="flex">flex만 할거면 이거</div>
  <div class="center">센터 정렬 하고 싶으면 이거 쓰고</div>
  <div style="width: 100vw; height: 1000px">
    <div class="ccenter">완전 센터 정렬 하고 싶으면 이거 쓰고</div>
  </div>
  <div class="textCenter">텍스트만 중앙 정렬 할거면 이거 쓰고</div>
  만약 콘텐츠 요소가 화면 완전 중앙에 보이기만 하면 된다면
  <main class="center">
    <div class="mainContent">
      <div class="center">
        이거 쓰셈
      </div>
    </div>
  </main>
  <div>검색창 필요 없으면 commonArea2 쓰고</div>

  <button class="button confirmBtn">확인</button>
  <button class="button cancelBtn">취소</button>
  <a href="#" class="aHref">a태그 스타일 초기화</a>
  <div style="width: 100px; height: 20px;" class="ccenter">
    <a href="#" class="aHref">a태그 hover</a>
  </div>
  버튼 쓰고 싶은데 다른 버튼들 색 수정 방법
  <button class="button confirmBtn" style="background-color: #00aced">이것처럼</button>
  <button class="button confirmBtn" style="background-color: #4dbd74">내부스타일</button>
  <button class="button confirmBtn" style="background-color: #833ab4">바꾸셈</button>

<div>
  input
</div>
</main>

<footer class="footerContainer">
  <c:import url="/WEB-INF/views/commonArea/footerArea.jsp" />
</footer>

<c:import url="/WEB-INF/views/commonArea/swiperScriptTag.jsp" />
</body>
</html>
