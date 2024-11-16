<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2024-11-15
  Time: 오후 9:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    table {
        width: 100%;
        border-collapse: collapse;
        background-color: #ffffff;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        overflow: hidden;
        margin-top: 20px;
    }

    th, td {
        padding: 15px;
        text-align: center;
    }

    th {
        background-color: #f1f3f5;
        color: #495057;
        font-weight: bold;
        font-size: 16px;
        border-bottom: 2px solid #dee2e6;
        text-align : center;
    }

    td {
        padding: 0;
        font-size: 14px;
        color: #495057;
        border-bottom: 1px solid #dee2e6;
    }

    .td-img {
        width: 150px;
        height: 150px;
    }

    /* 이미지 크기 조정 */
    td img {
        max-width: 150px;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    tr:hover {
        background-color: #f8f9fa;
    }
</style>