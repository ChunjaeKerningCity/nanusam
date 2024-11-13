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
    <title>goods modify</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
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
                    <input type="text" name="name" id="name" class="form-control" placeholder="상품명" value="${item.name}" required>
                    <div id="div_err_name"></div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col">
                <label for="quality" class="form-label">상품 상태</label>
                <select name="quality" id="quality" class="form-select" aria-label="Default select example" required>
                    <option disabled>상품 상태</option>
                    <option value="상" <c:if test="${item.quality='상'}">selected</c:if>>상</option>
                    <option value="중" <c:if test="${item.quality='중'}">selected</c:if>>중</option>
                    <option value="하" <c:if test="${item.quality='하'}">selected</c:if>>하</option>
                </select>
                <div id="div_err_quality"></div>
            </div>
            <div class="col">
                <div class="mb-3">
                    <label for="price" class="form-label">가격</label>
                    <input type="number" name="price" id="price" class="form-control" placeholder="가격" value="${item.price}" required>
                    <div id="div_err_price"></div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col">
                <div class="mb-3">
                    <label for="mainImage" class="form-label">대표 사진</label>
                    <input class="form-control" type="file" id="mainImage" name="mainImage" accept="image/*">
                    <ul>
                        <li id="fileorg">
                            <input style="display:none;" type="checkbox" name="deleteFile" id="orgMainImage" value="${orgMainImage.fileName}" onchange="toggleDelete('org')">
                            <span>${orgMainImage.orgFileName}</span> <label style="display: inline;" for="orgMainImage">x</label>
                        </li>
                    </ul>
                </div>

            </div>
        </div>

        <div class="row">
            <div class="col">
                <div class="form-group">
                    <label for="detailImage" class="form-label">상품 사진</label>
                    <input class="form-control" type="file" id="detailImage" name="detailImage" accept="image/*" multiple max="3">
                    <ul id="existing-files">
                        <c:forEach var="img" items="${images}" varStatus="s">
                            <li id="file${s.count}">
                                <input style="display:none;" type="checkbox" name="deleteFile" id="deleteFile${s.count}" value="${file.fileName}" onchange="toggleDelete(${s.count})">
                                <span>${img.orgFileName}</span> <label style="display: inline;" for="deleteFile${s.count}">x</label>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>

        <div class="mb-3">
            <label for="content" class="form-label">상품 설명</label>
            <textarea class="form-control" id="content" name="content" rows="3" placeholder="상품 설명">${item.content}</textarea>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script>
    function toggleDelete(no) {
        const liFile = document.getElementById('file'+no);
        liFile.style.display = 'none';
    }

    const fileInput = document.getElementById('detailImage');

    // 파일이 선택될 때마다 실행되는 이벤트 리스너
    fileInput.addEventListener('change', function() {
        // 선택된 파일의 개수

        const files = fileInput.files;

        // 파일 개수가 3개를 초과하면
        if (files.length > 3) {
            alert('최대 3개의 파일만 선택할 수 있습니다.');
            // 선택된 파일 개수를 3개로 제한
            fileInput.value = ''; // 파일 선택 초기화
        }
    });

    const fileInputOrg = document.getElementById('orgMainImage');

    // 파일이 선택될 때마다 실행되는 이벤트 리스너
    fileInputOrg.addEventListener('change', function() {
        // 선택된 파일의 개수

        const files = fileInput.files;

        // 파일 개수가 3개를 초과하면
        if (files.length >= 1) {
            alert('최대 3개의 파일만 선택할 수 있습니다.');
            // 선택된 파일 개수를 3개로 제한
            fileInput.value = ''; // 파일 선택 초기화
        }
    });
</script>
</body>
</html>
