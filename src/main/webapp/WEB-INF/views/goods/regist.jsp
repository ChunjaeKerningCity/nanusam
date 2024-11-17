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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
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
            <div>
                <form action="/goods/regist.do" method="post" name="frmGoodsRegist" id="frmGoodsRegist"
                      enctype="multipart/form-data" autocomplete="off">
                    <div class="row">
                        <div class="col">
                            <label for="category" class="form-label">카테고리</label>
                            <select name="category" id="category" class="form-select"
                                    aria-label="Default select example"
                                    required>
                                <option disabled selected>선택</option>
                                <c:forEach items="${categories}" var="category">
                                    <option value="${category.code}" ${item.category==category.code ? 'selected':''}>${category.value}</option>
                                </c:forEach>
                            </select>
                            <div id="div_err_category"></div>
                        </div>
                        <div class="col">
                            <div class="mb-3">
                                <label for="name" class="form-label">상품명</label>
                                <input type="text" name="name" id="name" class="form-control" placeholder="상품명"
                                       value="${item.name}" required>
                                <div id="div_err_name"></div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <label for="quality" class="form-label">상품 상태</label>
                            <select name="quality" id="quality" class="form-select" aria-label="Default select example"
                                    required>
                                <option disabled selected>상품 상태</option>
                                <option value="상" ${item.quality=='상'?'selected' :''}>상</option>
                                <option value="중" ${item.quality=='중'?'selected' :''}>중</option>
                                <option value="하" ${item.quality=='하'?'selected' :''}>하</option>
                            </select>
                            <div id="div_err_quality"></div>
                        </div>
                        <div class="col">
                            <div class="mb-3">
                                <label for="price" class="form-label">가격</label>
                                <input type="number" name="price" id="price" class="form-control" placeholder="가격"
                                       required>
                                <div id="div_err_price"></div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <div class="mb-3">
                                <label for="mainImage" class="form-label">대표 사진</label>
                                <input class="form-control" type="file" id="mainImage" name="mainImage" accept="image/*"
                                       required>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <div class="mb-3">
                                <label for="detailImage" class="form-label">상품 사진</label>
                                <input class="form-control" type="file" id="detailImage" name="detailImage"
                                       accept="image/*"
                                       multiple>
                            </div>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="content" class="form-label">상품 설명</label>
                        <textarea class="form-control" id="content" name="content" rows="3"
                                  placeholder="상품 설명"></textarea>
                    </div>

                    <div class="row">
                        <div class="btn-toolbar justify-content-center" role="toolbar"
                             aria-label="Toolbar with button groups">
                            <div class="btn-group me-2" role="group" aria-label="First group">
                                <input type="submit" id="btnSubmit" class="button confirmBtn" value="등록"/>
                            </div>
                            <div class="btn-group me-2" role="group" aria-label="Second group">
                                <input type="reset" id="btnReset" class="button cancelBtn" value="초기화"/>
                            </div>
                            <div class="btn-group" role="group" aria-label="Third group">
                                <button onclick="location.href='/goods/list.do'" type="button" class="button confirmBtn"
                                        style="background-color: #F0F0F0">상품 목록
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="commonRight">
        <c:import url="/WEB-INF/views/commonArea/footerArea.jsp"/>
    </div>
    </div>
</main>

<footer class="footerContainer marginTop">
    <c:import url="/WEB-INF/views/commonArea/footerArea.jsp"/>
</footer>

<c:import url="/WEB-INF/views/commonArea/swiperScriptTag.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<script>
    const svrValidateResult = {};
    <c:forEach items="${formerrors}" var="err">
    if (document.getElementById("div_err_${err.getField()}") != null) {
        console.log("1");
        document.getElementById("div_err_${err.getField()}").innerHTML = "<span style='color: red;'>${err.defaultMessage}</span>";
        document.getElementById("div_err_${err.getField()}").style.display = "block";
    }
    svrValidateResult['${err.getField()}'] = '${err.defaultMessage}';
    </c:forEach>
</script>
<script>
    // 파일이 선택될 때마다 실행되는 이벤트 리스너
    const fileInput = document.getElementById("detailImage");
    fileInput.addEventListener('change', function () {
        // 선택된 파일의 개수
        const files = fileInput.files;

        // 파일 개수가 3개를 초과하면
        if (files.length > 3) {
            alert('최대 3개의 파일만 선택할 수 있습니다.');
            // 선택된 파일 개수를 3개로 제한
            fileInput.value = ''; // 파일 선택 초기화
        }
    });
</script>

</body>
</html>
