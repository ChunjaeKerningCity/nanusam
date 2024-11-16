<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2024-11-16
  Time: 오후 12:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
  document.getElementById("chatList").addEventListener("click",(e)=>{
      e.preventDefault();
      e.stopPropagation();
      window.open("/chat/list.do","_blank","width=800,height=600,resizable=no");
  });
</script>
