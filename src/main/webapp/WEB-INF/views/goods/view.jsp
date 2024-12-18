<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>NanuSam</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <c:import url="/WEB-INF/views/commonArea/commonStyleScriptGroup.jsp" />
    <c:import url="/WEB-INF/views/commonArea/swiperLinkTag.jsp" />
    <style>
        .carousel-img-container {
            width: 800px;
            height: 800px;
            display: flex;
            align-items: center;
            /*justify-content: center;*/
            padding: 0;
            background-color: #f1f1f1;
        }
        .c-img-size {
            margin: 0 auto;
            max-width: 800px;
            max-height: 800px;
            object-fit: contain;
        }
        .card:hover {
            transform: none;
        }
    </style>
</head>
<body>
<c:import url="/WEB-INF/views/commonArea/errPrintJs.jsp"/>
<header class="center">
    <c:import url="/WEB-INF/views/commonArea/headerArea1.jsp" charEncoding="UTF-8" />
    <c:import url="/WEB-INF/views/commonArea/headerArea2.jsp" charEncoding="UTF-8" />
</header>
<div class="line"></div>
<main>
    <div class="commonContainer">
        <div class="commonLeft"></div>
        <div class="commonMain">
            <body>
            <c:import url="/WEB-INF/views/commonArea/errPrintJs.jsp"/>
            <div class="container">
                <div class="row">
                    <div class="col">
                        <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel" style="height: 800px">
                            <div class="carousel-inner carousel-img-container">
                                <c:forEach items="${item.images}" var="img" varStatus="s">
                                    <div class="carousel-item ${s.count==1?'active':''}">
                                        <img src="/resources/image/${img.fileName}" class="d-block c-img-size" alt="...">
                                    </div>
                                </c:forEach>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>
                    <div class="col-md-auto">
                        <div class="card" style="width: 300px;">
                            <div class="card-body">
                                <h5 class="card-title">${item.name}&nbsp;
                                    <c:choose>
                                        <c:when test="${item.status eq 'R'}">
                                            <span class="badge text-bg-success">예약중</span>
                                        </c:when>
                                        <c:when test="${item.status eq 'N'}">
                                            <span class="badge text-bg-secondary">판매완료</span>
                                        </c:when>
                                    </c:choose>
                                </h5>
                                <h6 class="card-subtitle mb-2 text-body-secondary">${item.price} - ${item.quality}</h6>
                                <div class="row" style="margin-top: 20px;">
                                    <div onclick='location.href="/cart/add.do?goodsIdx=${item.idx}&memberId=${memberId}"' class="col button confirmBtn" >찜</div>&nbsp;
                                    <div onclick='location.href="/payment/regist.do?goodsIdx=${item.idx}"' class="col button confirmBtn" >바로구매</div>
                                </div>

                                <div class="row button confirmBtn center" style="margin-top: 20px" onclick="openChat('${item.memberId}',${item.idx})">셀파톡</div>
                            </div>
                        </div>
                        <div class="card" style="width: 300px;">
                            <div class="card-body">
                                <p class="card-text">${item.content}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        </div>
        <div class="commonRight">
            <c:import url="/WEB-INF/views/commonArea/sideBar.jsp" charEncoding="UTF-8" />
        </div>
    </div>
</main>

<footer class="footerContainer">
    <c:import url="/WEB-INF/views/commonArea/footerArea.jsp" />
</footer>
<script>
    function openChat(memberId,idx){
        window.open("/chat/fromGoods.do?seller="+memberId+"&goodsIdx="+idx,"_blank","width=800,height=600,resizable=no");
    }
</script>
<c:import url="/WEB-INF/views/commonArea/swiperScriptTag.jsp" />
</body>
</html>
