<%--
  Created by IntelliJ IDEA.
  User: full5-3
  Date: 2024-11-11
  Time: 오후 2:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>goods modify</title>
</head>
<body>
<div style="width: 70%; margin: auto; padding: 5rem">


    <form action="/goods/regist.do" method="post" name="frmGoodsRegist" id="frmGoodsRegist" enctype="multipart/form-data">
        <div class="row">
            <div class="col">
                <label for="category" class="form-label">카테고리</label>
                <select name="category" id="category" class="form-select" aria-label="Default select example" required>
                    <option disabled selected>선택</option>
                    <c:forEach items="${categories}" var="category">
                        <option value="${category.code}" <c:if test="${item.category=category.code}">selected</c:if> >${category.value}</option>
                    </c:forEach>
                </select>
                <div id="div_err_category"></div>
            </div>
            <div class="col">
                <div class="mb-3">
                    <label for="name" class="form-label">상품명</label>
                    <input type="text" name="name" id="name" class="form-control" placeholder="상품명" required>
                    <div id="div_err_name"></div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col">
                <label for="quality" class="form-label">상품 상태</label>
                <select name="quality" id="quality" class="form-select" aria-label="Default select example" required>
                    <option disabled selected>상품 상태</option>
                    <option value="상">상</option>
                    <option value="중">중</option>
                    <option value="하">하</option>
                </select>
                <div id="div_err_quality"></div>
            </div>
            <div class="col">
                <div class="mb-3">
                    <label for="price" class="form-label">가격</label>
                    <input type="number" name="price" id="price" class="form-control" placeholder="가격" required>
                    <div id="div_err_price"></div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col">
                <div class="mb-3">
                    <label for="mainImage" class="form-label">대표 사진</label>
                    <input class="form-control" type="file" id="mainImage" name="mainImage" accept="image/*">
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col">
                <div class="mb-3">
                    <label for="detailImage" class="form-label">상품 사진</label>
                    <input class="form-control" type="file" id="detailImage" name="detailImage" accept="image/*" multiple>
                </div>
            </div>
        </div>

        <div class="mb-3">
            <label for="content" class="form-label">상품 설명</label>
            <textarea class="form-control" id="content" name="content" rows="3" placeholder="상품 설명"></textarea>
        </div>

        <div class="row">
            <div class="btn-toolbar justify-content-center" role="toolbar" aria-label="Toolbar with button groups">
                <div class="btn-group me-2" role="group" aria-label="First group">
                    <input type="submit" id="btnSubmit" class="btn btn-primary" value="등록" />
                </div>
                <div class="btn-group me-2" role="group" aria-label="Second group">
                    <input type="reset" id="btnReset" class="btn btn-secondary" value="초기화"/>
                </div>
                <div class="btn-group" role="group" aria-label="Third group">
                    <button type="button" class="btn btn-info">상품 목록</button>
                </div>
            </div>
        </div>
    </form>
</div>
</body>
</html>
