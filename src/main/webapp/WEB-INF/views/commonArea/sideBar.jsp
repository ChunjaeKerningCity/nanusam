<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="fixedSidebar">
  <div class="item">
    <div class="sideBarItemArea">
      <a class="aHref" href="${pageContext.request.contextPath}/cart/list.do">
        찜한상품<br>
        <img src="https://m.bunjang.co.kr/pc-static/resource/11198bb2dc24672fee03.png" width="16" height="16" alt="찜 아이콘">
      </a>
    </div>
    <c:if test="${not empty sessionScope.memberId}" var="login">
      <div class="sideBarItemArea">
        <div id="alert" onclick="openAlertList()" style="cursor:pointer;">
          알림&nbsp;<span id="unreadCount">${unreadCount}</span><br/>
          <img src="/resources/public/notification.png" width="16" height="16" alt="notification">
        </div>
      </div>
      <div class="sideBarItemArea">
        <a class="aHref" href="${pageContext.request.contextPath}/review/list.do?memberType=buyer&memberId=${sessionScope.memberId}">
          내가쓴후기<br>
          <img src="/resources/public/myWriteReview.png" width="16" height="16" alt="myWriteReview">
        </a>
      </div>
      <div class="sideBarItemArea">
        <a class="aHref" href="${pageContext.request.contextPath}/review/list.do?memberType=seller&memberId=${sessionScope.memberId}">
          내가받은후기<br>
          <img src="/resources/public/peopleWriteReview.png" width="16" height="16" alt="peopleWriteReview">
        </a>
      </div>
      <div class="sideBarItemArea">
        <a class="aHref" href="${pageContext.request.contextPath}/goods/reservation.do">
          예약목록<br>
          <img src="/resources/public/reservation.png" width="16" height="16" alt="reservation">
        </a>
      </div>
    </c:if>
    <div class="sideBarItemArea">
      <button class="topButton">TOP</button>
    </div>
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
              const notificationIcon = document.querySelector('img[alt="notification"]');
              if (data.unreadCount !== 0) {
                notificationIcon.src = "/resources/public/notificationOn.png";
                unreadCount.textContent = '('+ data.unreadCount+')';
                notificationIcon.classList.add("Vibration");
              } else {
                notificationIcon.src = "/resources/public/notification.png";
                unreadCount.textContent = '('+ data.unreadCount+')';
                notificationIcon.classList.remove("Vibration");
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
  window.addEventListener("message",(e)=>{
    if(e.data==='childClosed'){
      getUnreadCount();
    }
  });
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
<script>
  document.addEventListener("scroll", () => {
    const sidebar = document.querySelector('.fixedSidebar');
    const scrollPosition = window.scrollY;

    if (scrollPosition > 150) {
      sidebar.style.bottom = '100px';
    } else {
      sidebar.style.bottom = '-63px';
    }
  });
</script>
