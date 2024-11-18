<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</div>
<div class="navSign" style="white-space: nowrap">
  <c:choose>
    <c:when test="${not empty sessionScope.memberId}">
      <!-- 로그인된 상태 -->
      <a href="/member/pwdCheck.do">마이페이지</a>
      <a href="/payment/list.do">나의 결제내역</a>
      <a href="/login/logout.do">로그아웃</a>
    </c:when>
    <c:otherwise>
      <!-- 비로그인 상태 -->
      <a href="/login/login.do">로그인</a>
      <a href="/login/registCheck.do">회원가입</a>
    </c:otherwise>
  </c:choose>
</div>
</div>