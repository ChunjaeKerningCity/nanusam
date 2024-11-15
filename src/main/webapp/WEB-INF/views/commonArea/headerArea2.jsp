<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</div>
<div class="navSign" style="white-space: nowrap">
  <c:choose>
    <c:when test="${not empty sessionScope.memberId}">
      <!-- 로그인된 상태 -->
      <a href="#">마이페이지</a>
      <a href="#">나의 결제내역</a>
      <a href="/logout">로그아웃</a>
    </c:when>
    <c:otherwise>
      <!-- 비로그인 상태 -->
      <a href="/member/login.do">로그인</a>
      <a href="/member/registCheck.do">회원가입</a>
    </c:otherwise>
  </c:choose>
</div>
</div>