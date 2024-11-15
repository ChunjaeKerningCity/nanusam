<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>NanuSam</title>
    <c:import url="/WEB-INF/views/commonArea/commonStyleScriptGroup.jsp" />
    <c:import url="/WEB-INF/views/commonArea/swiperLinkTag.jsp" />
</head>
<body>
<script>
    document.addEventListener("DOMContentLoaded", () => {
        let page = 1;
        let isLoading = false;

        const loadMoreItems = () => {
            if (isLoading) return;
            isLoading = true;

            fetch(`/loadMoreGoods?page=${page}`)
            .then(response => response.text())
            .then(data => {
                document.querySelector('.cardContainer').insertAdjacentHTML('beforeend', data);
                page++;
                isLoading = false;
            })
            .catch(error => {
                console.error('Error loading more items:', error);
                isLoading = false;
            });
        };

        window.addEventListener('scroll', () => {
            if (window.innerHeight + window.scrollY >= document.body.offsetHeight - 100) {
                loadMoreItems();
            }
        });
    });
</script>

<c:import url="/WEB-INF/views/commonArea/errPrintJs.jsp"/>
<header class="center">
    <c:import url="/WEB-INF/views/commonArea/headerArea1.jsp" charEncoding="UTF-8" />
    <c:import url="/WEB-INF/views/commonArea/headerSearchArea.jsp" charEncoding="UTF-8" />
    <c:import url="/WEB-INF/views/commonArea/headerArea2.jsp" charEncoding="UTF-8" />
</header>

<main>
    <div class="sliderArea">
        <div class="swiper2 mySwiper underSlide">
            <div class="swiper-wrapper">
                <div class="swiper-slide" id="slider1">
                    <div class="center">
                        <div class="sliderTextArea">
                            <h1 class="sliderH1">
                                교육의 가치를 더하는<br />
                                중고거래
                            </h1>
                            <div class="sliderP">
                                선생님들이 교육 현장에서 필요한 물품을 신뢰할 수 있는
                                이웃들과
                                <br />따뜻하게 거래하세요.
                            </div>
                        </div>
                        <img src="/resources/public/slider1.png" alt="" />
                    </div>
                </div>
                <div class="swiper-slide" id="slider2">
                    <div class="center">
                        <div class="sliderTextArea">
                            <h1 class="sliderH1">
                                세상 모든 물건에 가치를<br />
                                소비를 지속가능하게
                            </h1>
                            <div class="sliderP">
                                To make consumption sustainable by giving a second life to everything;
                                <br />waste nothing for planet & for your lifestyle
                            </div>
                        </div>
                        <img src="/resources/public/slider2.png" alt="" />
                    </div>
                </div>
                <div class="swiper-slide" id="slider3">
                    <div class="center">
                        <div class="sliderTextArea">
                            <h1 class="sliderH1">
                                교육의 가치를 더하는<br />
                                중고거래
                            </h1>
                            <div class="sliderP">
                                선생님들이 교육 현장에서 필요한 물품을 신뢰할 수 있는
                                이웃들과
                                <br />따뜻하게 거래하세요.
                            </div>
                        </div>
                        <img src="/resources/public/slider3.jpg" alt="" />
                    </div>
                </div>
                <div class="swiper-slide" id="slider4">
                    <div class="center">
                        <div class="sliderTextArea">
                            <h1 class="sliderH1">
                                교육의 가치를 더하는<br />
                                중고거래
                            </h1>
                            <div class="sliderP">
                                선생님들이 교육 현장에서 필요한 물품을 신뢰할 수 있는
                                이웃들과
                                <br />따뜻하게 거래하세요.
                            </div>
                        </div>
                        <img src="/resources/public/slider4.jpg" alt="" />
                    </div>
                </div>
            </div>
            <div
                class="swiper-button-next"
                style="color: black; right: 250px"
            ></div>
            <div
                class="swiper-button-prev"
                style="color: black; left: 250px"
            ></div>
            <div
                class="swiper-pagination"
                style="position: relative; bottom: 20px; z-index: 12"
            ></div>
        </div>
    </div>
    <div class="mainContainer">
        <div class="mainContent">
            <div class="cardContainerTop">
                <h2>오늘의 상품 추천</h2>
                <a href="#">더보기 ▶</a>
            </div>
            <c:import url="/WEB-INF/views/commonArea/sideBar.jsp" charEncoding="UTF-8" />
            <div class="cardContainer">
                <c:forEach items="${mainViewGoodsList}" var="item">
                    <a href="/goods/view.do?idx=${item.idx}" class="card">
                        <img
                            src="/resources/image/goods_${item.idx}_0.png"
                            class="cardImage"
                            alt="cardImage"
                        />
                        <p class="cardName">${item.name}</p>
                        <div class="cardInfo">
                            <p class="cardPrice">${item.price}</p>
                            <p class="regDate">${item.regDateStr}</p>
                        </div>
                    </a>
                </c:forEach>
            </div>
            <div class="line" style="margin: 20px 0 10px 0"></div>
        </div>
    </div>
</main>

<footer class="footerContainer">
    <c:import url="/WEB-INF/views/commonArea/footerArea.jsp" charEncoding="UTF-8" />
</footer>
<c:import url="/WEB-INF/views/commonArea/swiperScriptTag.jsp" />
</body>
</html>
