<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/resources/styles/style.css" />
<div class="fixedSidebar">
  <div class="item">
    <a class="aHref" href="${pageContext.request.contextPath}/cart/list.do">찜한상품</a><br>
    <a class="aHref" href="${pageContext.request.contextPath}/payment/list.do">결제내역</a><br>
    <c:if test="${not empty sessionScope.memberId}" var="login">
      <div>알림<span id="unreadCount">${unreadCount}</span></div>
      <a class="aHref" href="${pageContext.request.contextPath}/review/list.do?memberType=buyer&memberId=${sessionScope.memberId}">내가쓴후기</a><br>
      <a class="aHref" href="${pageContext.request.contextPath}/review/list.do?memberType=seller&memberId=${sessionScope.memberId}">내가받은후기</a><br>
    </c:if>
  </div>
  <div class="line"></div>
  <div class="item">
    <button class="topButton">TOP</button>
  </div>
</div>
