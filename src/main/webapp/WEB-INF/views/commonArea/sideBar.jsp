<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="fixedSidebar">
  <div class="item">
    <a class="aHref" href="${pageContext.request.contextPath}/cart/list.do">찜한상품</a><br>
    <a class="aHref" href="${pageContext.request.contextPath}/payment/list.do">결제내역</a><br>
    <c:if test="${not empty sessionScope.memberId}" var="login">
      <div id="alert" onclick="openAlertList()">알림<span id="unreadCount">${unreadCount}</span></div>
      <a class="aHref" href="${pageContext.request.contextPath}/review/list.do?memberType=buyer&memberId=${sessionScope.memberId}">내가쓴후기</a><br>
      <a class="aHref" href="${pageContext.request.contextPath}/review/list.do?memberType=seller&memberId=${sessionScope.memberId}">내가받은후기</a><br>
    </c:if>
  </div>
  <div class="line"></div>
  <div class="item">
    <button class="topButton">TOP</button>
  </div>
</div>
<c:if test="${login}">
<script>
  document.addEventListener("DOMContentLoaded",()=>{
    getUnreadCount();
  });
  function getUnreadCount() {
    const memberId = '${memberId}';
    fetch("/alert/unreadCount.do?memberId="+memberId, {
      method: "GET",
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      }
    })
            .then(response => response.json())
            .then(data => {
              const unreadCount = document.getElementById("unreadCount");
              if (data.unreadCount!=='0') {
                unreadCount.textContent = '('+ data.unreadCount+')';
              }
            })
            .catch(error => {
              console.log(error);
            });
  }


  let childWindow;
  function openAlertList(){
    childWindow = window.open("/alert/list.do","_blank","width=800,height=600,resizable=no");
  }



  function getAlertList(){
    fetch("/alert/getList.do", {
      method: "GET",
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      }
    })
            .then(response => response.json())
            .then(data => {
                console.log(data);
            })
            .catch(error => {
              console.log(error);
            });
  }
</script>
</c:if>
