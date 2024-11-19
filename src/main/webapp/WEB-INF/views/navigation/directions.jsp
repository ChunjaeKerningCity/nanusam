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
  <link rel="stylesheet" href="/resources/styles/nav/style.css" />
  <script
      type="text/javascript"
      src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=${clientId}"
  ></script>
</head>
<body>
<header class="center">
  <c:import url="/WEB-INF/views/commonArea/headerArea1.jsp" charEncoding="UTF-8" />
  <c:import url="/WEB-INF/views/commonArea/headerArea2.jsp" charEncoding="UTF-8" />

</header>

<main>
  <div class="line"></div>
  <div class="mainContainer">
    <div class="mainContent">
      <div class="flex">
        <div class="mapText">
          <h2 class="heading">찾아오시는 길</h2>
          <p class="subHeading">항상 최고의 서비스를 제공하겠습니다. ${clientId}</p>

          <div class="infoContainer">
            <h3 class="officeTitle">나누쌤 본사</h3>

            <div class="addressSection">
              <p class="addressLabel">ADDRESS</p>
              <p class="address">
                서울시 금천구 디지털로 9길 23<br />(가산디지털단지 6번 출구
                도보 10분 이내)
              </p>
            </div>

            <div class="contactSection">
              <p class="contactItem">
                <span class="label">TEL</span> 010-8904-4623
              </p>
              <p class="contactItem">
                <span class="label">FAX</span> 02-866-9309
              </p>
            </div>
          </div>
        </div>

        <div
            id="map"
            style="width: 100%; height: 500px; margin-bottom: 50px"
        ></div>
      </div>
      <div>
        <h3 class="textCenter">나누쌤을 더 가까이!</h3>
        <iframe
            src="https://www.youtube.com/embed/cbIwL40AtV8?si=6Yl-WoDOZiMZFNfG"
            frameborder="0"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
            allowfullscreen
            width="100%"
            height="675px"
        ></iframe>
      </div>
    </div>
  </div>
</main>

<footer class="footerContainer">
  <c:import url="/WEB-INF/views/commonArea/footerArea.jsp" />
</footer>

<c:import url="/WEB-INF/views/commonArea/swiperScriptTag.jsp" />

<!-- 네이버 지도 api -->
<script>
  var mapOptions = {
    center: new naver.maps.LatLng(37.4788, 126.886413),
    zoom: 15,
  };

  var map = new naver.maps.Map("map", mapOptions);
  window.navermap_authFailure = function () {
    console.log("asd");
  };

  var marker = new naver.maps.Marker({
    position: new naver.maps.LatLng(37.4788, 126.886413),
    map: map,
  });
</script>
</body>
</html>
