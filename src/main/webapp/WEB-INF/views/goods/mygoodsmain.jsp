<%--
  Created by IntelliJ IDEA.
  User: full5-3
  Date: 2024-11-11
  Time: 오후 2:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--    상품 목록--%>
        <table>
            <tr>
                <th>상품이미지</th>
                <th>상품명</th>
                <th>가격</th>
                <th>상세보기</th>
                <th>관리</th>
                <th>결제정보</th>
            </tr>
        <c:forEach items="${pageinfo.dtoList}" var="item">

                <tr>
                    <td>
                        <img src="/resources/image/${item.mainImageName}" class="card-img-top"
                             alt="상품이미지">
                    </td>
                    <td>${item.name}</td>
                    <td>${item.price}</td>
                    <td>
                        <a href="/goods/view.do?idx=${item.idx}" class="btn btn-info">상세보기</a>
                    </td>
                    <td>
                        <c:if test="${item.status eq 'N' and item.payInfo.deliveryStatus eq '0'}">
                            <button onclick="location.href='/payment/deliveryStart.do?idx=${item.payInfo.idx}&page_no=${pageinfo.page_no}'">배송시작</button>
                        </c:if>
                        <c:if test="${item.status eq 'R'}">
                            예약자-${item.reservationId}
                            <button onclick="location.href='/goods/direct.do?idx=${item.idx}&page_no=${pageinfo.page_no}'">직거래</button>
                            <button onclick="location.href='/goods/cancel.do?idx=${item.idx}&page_no=${pageinfo.page_no}'">예약취소</button>
                        </c:if>
                        <c:if test="${item.status eq 'Y'}">
                            <button onclick="location.href='/goods/delete.do?idx=${item.idx}&page_no=${pageinfo.page_no}'">상품 삭제</button>
                        </c:if>
                    </td>
                    <td>
                        <c:if test="${item.status eq 'N'}">
                            <c:choose>
                                <c:when test="${not empty item.payInfo.buyer}">
                                    <button onclick="location.href='/payment/view.do?idx=${item.payInfo.idx}&page_no=${pageinfo.page_no}'">결제정보</button>
                                </c:when>
                                <c:otherwise>
                                    직거래
                                </c:otherwise>
                            </c:choose>
                        </c:if>
                    </td>
                </tr>


            </c:forEach>
            </table>
    <c:if test="${pageinfo.dtoList == null || pageinfo.dtoList.size() == 0}">
        <div class="col">
            <div class="alert alert-secondary" role="alert">
                등록된 상품이 없습니다.
            </div>
        </div>
    </c:if>
<%--    페이징--%>
    <div class="row" style="margin-top: 1rem;">
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
                <c:if test="${pageinfo.prev_page_flag}">
                    <li class="page-item">
                        <a class="page-link" href="/goods/mygoods.do?page_no=${pageinfo.page_block_start - pageinfo.page_size}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>
                <c:forEach var="no" begin="${pageinfo.page_block_start}" end="${pageinfo.page_block_end}" step="1">
                    <li class="page-item"><a class="page-link" href="/goods/mygoods.do?page_no=${no}">${no}</a></li>
                </c:forEach>
                <c:if test="${pageinfo.next_page_flag}">
                    <li class="page-item">
                        <a class="page-link" href="/goods/mygoods.do?page_no=${pageinfo.page_block_end + 1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
            </ul>
        </nav>
    </div>

