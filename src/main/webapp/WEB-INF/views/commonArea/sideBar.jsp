<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<%--<c:if test="${login}">--%>
<%--<script>--%>
<%--  document.addEventListener("DOMContentLoaded",()=>{--%>
<%--// Call `fetch()`, passing in the URL.--%>
<%--    fetch("/alertRest/unreadCount/${memberId}")--%>
<%--            // fetch() returns a promise. When we have received a response from the server,--%>
<%--            // the promise's `then()` handler is called with the response.--%>
<%--            .then((response) => {--%>
<%--              // Our handler throws an error if the request did not succeed.--%>
<%--              if (!response.ok) {--%>
<%--                throw new Error(`HTTP error: ${response.status}`);--%>
<%--              }--%>
<%--              // Otherwise (if the response succeeded), our handler fetches the response--%>
<%--              // as text by calling response.text(), and immediately returns the promise--%>
<%--              // returned by `response.text()`.--%>
<%--              return response.json();--%>
<%--            })--%>
<%--            // When response.text() has succeeded, the `then()` handler is called with--%>
<%--            // the text, and we copy it into the `poemDisplay` box.--%>
<%--            .then((text) => {--%>
<%--              document.getElementById("unreadCount").textContent = text;--%>
<%--            })--%>
<%--            // Catch any errors that might happen, and display a message--%>
<%--            // in the `poemDisplay` box.--%>
<%--            .catch((error) => {--%>
<%--              document.getElementById("unreadCount").textContent = '';--%>
<%--            });--%>
<%--  });--%>

<%--</script>--%>
<%--</c:if>--%>
