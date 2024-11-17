<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2024-11-14
  Time: 오후 3:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    /* 후기 리스트 스타일 */
    .review-list {
        display: flex;
        flex-direction: column;
        gap: 20px;
        padding: 20px;
    }

    /* 각 후기 카드 */
    .review-card {
        display: flex;
        align-items: flex-start;
        gap: 20px;
        border: 1px solid #ddd;
        border-radius: 10px;
        padding: 20px;
        background-color: #fff;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    /* 텍스트 영역 */
    .review-content {
        flex: 1;
        display: flex;
        flex-direction: column;
        gap: 10px;
    }

    .review-writer {
        font-size: 16px; /* 작성자 폰트 크기 */
        color: #999; /* 작성자 폰트 색상 */
        font-weight: bold; /* 작성자를 강조하기 위해 굵게 설정 */
    }

    .review-content {
        font-size: 18px; /* 내용 폰트 크기 */
        color: #333; /* 내용 폰트 색상 */
        line-height: 1.6; /* 가독성을 높이기 위해 줄 간격 설정 */
    }

    /* 별점과 작성자 */
    .review-header {
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        align-items: center;
        font-size: 14px;
        color: dimgray;
    }

    .review-stars {
        color: gold;
        display: flex;
        align-items: center;
        gap: 5px;
    }

    .review-text {
        font-size: 16px;
        color: #333;
        line-height: 1.5;
    }

    /* 등록일 */
    .review-footer {
        font-size: 12px;
        color: #888;
    }

    .review-button {
        padding: 5px 10px;
        border: 1px solid #ddd;
        background-color: #f5f5f5;
        border-radius: 5px;
        font-size: 14px;
        cursor: pointer;
        transition: background-color 0.2s ease;
    }

    .review-button:hover {
        background-color: #e0e0e0;
    }

    .review-button.modify {
        color: #007bff;
        border-color: #007bff;
    }

    .review-button.modify:hover {
        background-color: #cce5ff;
    }
</style>
