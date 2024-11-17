<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="navTop">
  <div>
    <a href="/">
      <img src="/resources/public/nanusamLogo.png" class="mainLogo" />
    </a>
  </div>
  <div>
    <div class="navGnb" style="min-width: 570px">
      <a href="/main/cpInfo.do">회사 소개글</a>
      <a href="/main/directions.do">오시는 길</a>
      <a href="/bbs/list.do">공지사항</a>
      <a href="/goods/list.do">상품</a>
      <a href="/goods/mygoods.do">내 상품</a>
      <a id="chatList" href="#">셀파톡</a>
    </div>
<c:import url="/WEB-INF/views/commonArea/openChatListScript.jsp"/>
