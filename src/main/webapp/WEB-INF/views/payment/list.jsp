<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>NanuSam</title>
    <c:import url="/WEB-INF/views/commonArea/commonStyleScriptGroup.jsp"/>
    <c:import url="/WEB-INF/views/commonArea/swiperLinkTag.jsp"/>
    <c:import url="/WEB-INF/views/goods/mygoodsstyle.jsp"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        th {text-align: center;}
    </style>
</head>
<body>
<c:import url="/WEB-INF/views/commonArea/errPrintJs.jsp"/>

<header class="center">
    <c:import url="/WEB-INF/views/commonArea/headerArea1.jsp" charEncoding="UTF-8"/>
    <c:import url="/WEB-INF/views/commonArea/headerArea2.jsp" charEncoding="UTF-8"/>
</header>
<div class="line"></div>
<main class="marginTop">
    <div class="commonContainer">
        <div class="commonLeft"></div>
        <div class="commonMain">
            <table>
                <thead>
                <tr>
                    <th scope="col">주문번호</th>
                    <th scope="col"></th>
                    <th scope="col">판매자</th>
                    <th scope="col">구매자</th>
                    <th scope="col">상품명</th>
                    <th scope="col">배송상태</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${pageinfo.dtoList}" var="item">
                    <tr>
                        <td><a href="/payment/view.do?idx=${item.idx}">${item.payDateStr}</a></td>
                        <td class="td-img"><img src="/resources/image/${item.goodsInfo.mainImageName}" alt="상품이미지"></td>
                        <td>${item.seller}</td>
                        <td>${item.buyer}</td>
                        <td>${item.goodsInfo.name}</td>
                        <td>
                            <c:choose>
                                <c:when test="${item.deliveryStatus == '0'}">
                                    배송 전
                                </c:when>
                                <c:when test="${item.deliveryStatus == '1'}">
                                    배송 중
                                </c:when>
                                <c:otherwise>
                                    <c:if test="${item.review eq 'N'}" var="N">
                                    <span onclick="window.open('${pageContext.request.contextPath}/review/regist.do?idx=${item.idx}&seller=${item.seller}&goodsIdx=${item.goodsIdx}'
                                            ,'_blank','width=800,height=600,resizable=no')">배송 완료 <br>
                                    (구매후기작성하기)</span>
                                    </c:if>
                                    <c:if test="${not N}">
                                        배송완료<br>
                                        (구매후기작성완료)
                                    </c:if>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${pageinfo.dtoList == null || pageinfo.dtoList.size() == 0}">
                    <div class="col">
                        <div class="alert alert-secondary center" role="alert">
                            결제 내역 없음
                        </div>
                    </div>
                </c:if>

                </tbody>
            </table>


            <%--    페이징--%>
            <div class="row" style="margin-top: 1rem;">
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
                        <c:if test="${pageinfo.prev_page_flag}">
                            <li class="page-item">
                                <a class="page-link"
                                   href="/payment/list.do?page_no=${pageinfo.page_block_start - pageinfo.page_size}&searchCategory=${pageinfo.searchCategory}"
                                   aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <c:forEach var="no" begin="${pageinfo.page_block_start}" end="${pageinfo.page_block_end}"
                                   step="1">
                            <li class="page-item"><a class="page-link"
                                                     href="/payment/list.do?page_no=${no}&searchCategory=${pageinfo.searchCategory}">${no}</a>
                            </li>
                        </c:forEach>
                        <c:if test="${pageinfo.next_page_flag}">
                            <li class="page-item">
                                <a class="page-link"
                                   href="/payment/list.do?page_no=${pageinfo.page_block_end + 1}&searchCategory=${pageinfo.searchCategory}"
                                   aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="commonRight"></div>
    </div>
</main>

<footer class="footerContainer">
    <c:import url="/WEB-INF/views/commonArea/footerArea.jsp"/>
</footer>

<script>
    window.addEventListener("message",(e)=>{
        if(e.data==='childClosed'){
            console.log('childClosed');
            location.reload();
        }
    });
</script>

<c:import url="/WEB-INF/views/commonArea/swiperScriptTag.jsp"/>
</body>
</html>