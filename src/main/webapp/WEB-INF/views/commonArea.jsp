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
</main>

<footer class="footerContainer">
  <c:import url="/WEB-INF/views/commonArea/footerArea.jsp" />
</footer>

<c:import url="/WEB-INF/views/commonArea/swiperScriptTag.jsp" />
</body>
</html>
