<%--
  Created by IntelliJ IDEA.
  User: full5-3
  Date: 2024-11-11
  Time: 오후 2:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>goods regist</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<h1>goods regist</h1>

<form action="/goods/regist.do" method="post" name="frmGoodsRegist" id="frmGoodsRegist">
    <div class="row">
        <div class="col">
            <label for="category" class="form-label">카테고리</label>
            <select name="category" id="category" class="form-select" aria-label="Default select example">
                <option disabled>선택</option>
                <c:forEach items="${categories}" var="category">
                    <option value="${category.code}">${category.value}</option>
                </c:forEach>
                <option value="00">기타</option>
            </select>
        </div>
        <div class="col">
            <div class="mb-3">
                <label for="name" class="form-label">상품명</label>
                <input type="text" name="name" id="name" class="form-control" placeholder="상품명">
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col">
            <label for="category" class="form-label">상품 상태</label>
            <select name="quality" id="quality" class="form-select" aria-label="Default select example">
                <option disabled>상품 상태</option>
                <option value="상">상</option>
                <option value="중">중</option>
                <option value="하">하</option>
            </select>
        </div>
        <div class="col">
            <div class="mb-3">
                <label for="name" class="form-label">가격</label>
                <input type="text" name="price" id="price" class="form-control" placeholder="가격">
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col">
            <div class="mb-3">
                <label for="mainImage" class="form-label">상품 대표 사진</label>
                <input class="form-control" type="file" id="mainImage" name="mainImage">
            </div>
        </div>
        <div class="col">
            <div class="mb-3">
                <label for="detailImages" class="form-label">상세 사진</label>
                <input class="form-control" type="file" id="detailImages" name="detailImages" multiple>
            </div>
        </div>
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
