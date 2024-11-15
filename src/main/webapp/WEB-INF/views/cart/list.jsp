<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>NanuSam</title>
    <c:import url="/WEB-INF/views/commonArea/commonStyleScriptGroup.jsp" />
    <c:import url="/WEB-INF/views/commonArea/swiperLinkTag.jsp" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* 전체 컨텐츠를 중앙 정렬 */
        .container-center {
            max-width: 1200px; /* 최대 너비 설정 */
            margin: 0 auto; /* 가로 중앙 정렬 */
            padding: 50px 15px;
        }
        .input-group-addon {
            cursor: pointer;
        }
        .hd {
            font-size: 22px;
            letter-spacing: -0.5px;
            color: dimgray;
        }
        .hd2 {
            font-size: 20px;
            color: dimgray;
        }
        .navbar {
            margin-bottom: 30px; /* 상단 네비바 여백 */
        }
        .table {
            table-layout: fixed;
            width: 100%;
        }
        .table th, .table td{
            text-align: center;
            padding: 10px;
        }
        .table th{
            width: 100%;
            min-width: 200px;
        }
        .table td{
            min-width: 200px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        .table th:nth-child(2), .table th:nth-child(3) {
            text-align: right;
        }
        .table td:nth-child(2), .table td:nth-child(3) {
            text-align: right;
        }
        .pagination {
            justify-content: center;
        }
        .btnRegist {
            margin-top: 20px;
            margin-bottom: 20px;
            padding: 10px 20px;
            background-color: #888888;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            float: right;
        }
        .btnRegist:hover {
            background-color: #0056b3;
            text-decoration: none;
        }
        hr {
            border: 0;
            width: 100%;
            height: 1px;
            background-color: #555555; /* 선 색상 */
            margin-bottom: 20px; /* 제목과 선 사이 간격 */
        }
    </style>
</head>
<body>
<c:import url="/WEB-INF/views/commonArea/errPrintJs.jsp"/>
<header class="center">
    <c:import url="/WEB-INF/views/commonArea/headerArea1.jsp" charEncoding="UTF-8" />
    <c:import url="/WEB-INF/views/commonArea/headerSearchArea.jsp" charEncoding="UTF-8" />
    <c:import url="/WEB-INF/views/commonArea/headerArea2.jsp" charEncoding="UTF-8" />
</header>
<main>
    <div class="container-center">
        <div>
            <hr/>
            <h2 class="hd">
                찜목록
            </h2>
            <!-- 리스트 영역 -->
            <table class="table table-hover">
                <thead>
                <tr class="hd2">
                    <!-- 전체 선택 체크박스 추가 -->
<%--                    <th scope="col">--%>
<%--                        <input type="checkbox" id="selectAll">--%>
<%--                    </th>--%>
                    <th scope="col">상품명</th>
                    <th scope="col"/>
                </tr>
                </thead>
                <tbody>
                <c:if test="${not empty cartList  && not empty cartList.dtoList}">
                    <c:forEach items="${cartList.dtoList}" var="list" varStatus="loop">
                        <tr>
<%--                            <td>--%>
<%--                                <input type="checkbox" name="select" id="select" value="${list.idx}">--%>
<%--                            </td>--%>
                                <td>
                                    <a href="/goods/view.do?idx=${list.goodsIdx}" class="aHref"><img src="/resources/image/goods_${list.goodsIdx}_0.png" class="card-img-top" alt="${list.name}" ></a>
                                </td>
                            <td><button type="button" name="btnPayment" id="btnPayment" class="button confirmBtn" onclick="javascript:location.href='#'">결제</button>
                            <form action="/cart/delete.do" method="get" id="deleteForm_1" style="display:inline;">
                                <input type="hidden" name="idx" value="${list.idx}"/>
                                <button type="button" name="btnDelete" id="btnDelete" class="button cancelBtn" onclick="confirmDelete('deleteForm_1')" >삭제</button>
                            </form>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
                <c:if test="${empty cartList.dtoList}">
                    <tr>
                        <td colspan="7" class="text-center">등록된 게시물이 존재하지 않습니다.</td>
                    </tr>
                </c:if>
                </tbody>
            </table>

<%--            <div class="d-flex justify-content-end mt-3">--%>
<%--                <button type="button" class="btn btn-primary mx-2">결제</button>--%>
<%--                <button type="button" class="btn btn-secondary mx-2">삭제</button>--%>
<%--            </div>--%>
            <!--// 리스트 영역 -->
        </div>

        <!-- 페이징 영역 -->
        <div class="row" style="margin-top: 1rem; justify-content: center">
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <c:if test="${cartList.prev_page_flag}">
                        <li class="page-item">
                            <a class="page-link" href="/cart/list.do?page_no=${cartList.page_block_start - 1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach var="no" begin="${cartList.page_block_start}" end="${cartList.page_block_end}" step="1">
                        <li class="page-item"><a class="page-link" href="/cart/list.do?page_no=${no}">${no}</a></li>
                    </c:forEach>
                    <c:if test="${cartList.next_page_flag}">
                        <li class="page-item">
                            <a class="page-link" href="/cart/list.do?page_no=${cartList.page_block_end + 1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>
        <!--// 페이징 영역 -->
    </div>
</main>

<footer class="footerContainer">
    <c:import url="/WEB-INF/views/commonArea/footerArea.jsp" />
</footer>

<c:import url="/WEB-INF/views/commonArea/swiperScriptTag.jsp" />
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<%--<script>--%>
<%--    // 전체 선택 체크박스 클릭 시, 모든 체크박스 선택/해제 기능--%>
<%--    document.getElementById("selectAll").addEventListener("click", function() {--%>
<%--        var checkboxes = document.getElementsByName("selectedItems");--%>
<%--        for (var checkbox of checkboxes) {--%>
<%--            checkbox.checked = this.checked;  // 전체 선택 체크박스 상태에 맞게 모든 체크박스 설정--%>
<%--        }--%>
<%--    });--%>
<%--</script>--%>
<script type="text/javascript">
    function confirmDelete(formId){
        if(confirm("삭제하시겠습니까?")){
            document.getElementById(formId).submit();
        }
    }
</script>
</body>
</html>
