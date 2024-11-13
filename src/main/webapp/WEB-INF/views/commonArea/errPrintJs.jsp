<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2024-11-13
  Time: 오후 5:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${not empty errors}">
  <script>
    alert('${errors}');
  </script>
</c:if>
