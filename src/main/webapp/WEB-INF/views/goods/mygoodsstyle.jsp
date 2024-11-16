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
        font-size: 14px;
        color: #495057;
        border-bottom: 1px solid #dee2e6;
    }

    /* 이미지 크기 조정 */
    td img {
        width: 80px; /* 가로 크기 */
        height: 80px; /* 세로 크기 */
        object-fit: cover; /* 비율 유지하며 크기 맞춤 */
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    tr:hover {
        background-color: #f8f9fa;
    }

    .btn {
        padding: 5px 10px;
        font-size: 14px;
        border-radius: 4px;
    }

    .btn-info {
        background-color: #17a2b8;
        color: white;
        border: none;
    }

    .btn-info:hover {
        background-color: #138496;
    }

    button {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 5px 10px;
        border-radius: 4px;
        cursor: pointer;
    }

    button:hover {
        background-color: #0056b3;
    }

    .alert-secondary {
        color: #6c757d;
        background-color: #e2e3e5;
        border-color: #d3d6d8;
        text-align: center;
        font-size: 16px;
        padding: 15px;
        border-radius: 8px;
    }
</style>