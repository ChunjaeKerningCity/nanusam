<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="fixedSidebar">
  <div class="item">
    <a href="${pageContext.request.contextPath}/cart/list.do">찜한상품</a><br>
    <a href="${pageContext.request.contextPath}/payment/list.do">결제내역</a><br>
    <c:if test="${not empty sessionScope.memberId}">
      <a href="${pageContext.request.contextPath}/review/list.do?memberType=buyer&memberId=${sessionScope.memberId}">내가쓴후기</a><br>
      <a href="${pageContext.request.contextPath}/review/list.do?memberType=seller&memberId=${sessionScope.memberId}">내가받은후기</a><br>
    </c:if>
  </div>
  <div class="line"></div>
  <div class="item">
    <button class="topButton">TOP</button>
  </div>
</div>

