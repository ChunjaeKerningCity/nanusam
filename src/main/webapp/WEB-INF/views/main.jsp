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
            </div>
            <c:import url="/WEB-INF/views/commonArea/sideBar.jsp" charEncoding="UTF-8" />
            <div class="cardContainer" id="cardContainer">
                <c:forEach items="${mainViewGoodsList}" var="item">
                    <a href="/goods/view.do?idx=${item.idx}" class="card">
                        <img
                            src="/resources/image/${item.mainImageName}"
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
        </div>
    </div>
</main>

<footer class="footerContainer">
    <c:import url="/WEB-INF/views/commonArea/footerArea.jsp" charEncoding="UTF-8" />
</footer>
<c:import url="/WEB-INF/views/commonArea/swiperScriptTag.jsp" />

<script>
    let currentPage = 1; // 현재 페이지 번호
    const PAGE_SIZE = 5; // 한 페이지에 로드할 아이템 수
    console.log(currentPage);
    console.log(PAGE_SIZE);

    // 스크롤 이벤트 리스너 등록
    window.addEventListener('scroll', () => {
        // 페이지의 총 높이
        const documentHeight = document.documentElement.scrollHeight;
        // 현재 스크롤 위치 (보이는 영역의 최상단)
        const scrollTop = document.documentElement.scrollTop;
        // 보이는 영역의 높이
        const windowHeight = window.innerHeight;

        if (scrollTop + windowHeight >= documentHeight * 0.95) {
            loadMoreGoods();
        }
    });

    // 추가 데이터 로드 중인지 여부를 확인하기 위한 변수
    let isLoading = false;

    function loadMoreGoods() {
        if (isLoading) return; // 이미 로딩 중이면 중복 호출 방지
        isLoading = true;
        currentPage++;

        fetch("/loadMoreGoods?page=" + currentPage)
        .then(response => response.json())
        .then(data => {
            if (data && data.length > 0) {
                appendGoods(data);
                isLoading = false;
            } else {
                window.removeEventListener('scroll', onScroll);
            }
        })
        .catch(error => {
            console.error('Error fetching more goods:', error);
            isLoading = false;
        });
    }

    function appendGoods(goodsList) {
        const cardContainer = document.getElementById('cardContainer');
        goodsList.forEach(item => {
            const card = document.createElement('a');
            card.href = '/goods/view.do?idx=' + item.idx;
            card.className = 'card';

            const img = document.createElement('img');
            img.src = '/resources/image/goods_' + item.idx +'_0.png';
            img.className = 'cardImage';
            img.alt = 'cardImage';

            const cardName = document.createElement('p');
            cardName.className = 'cardName';
            cardName.textContent = item.name;

            const cardInfo = document.createElement('div');
            cardInfo.className = 'cardInfo';

            const cardPrice = document.createElement('p');
            cardPrice.className = 'cardPrice';
            cardPrice.textContent = item.price;

            const regDate = document.createElement('p');
            regDate.className = 'regDate';
            regDate.textContent = item.regDateStr;

            cardInfo.appendChild(cardPrice);
            cardInfo.appendChild(regDate);

            card.appendChild(img);
            card.appendChild(cardName);
            card.appendChild(cardInfo);

            cardContainer.appendChild(card);
            console.log("==========");
            console.log(currentPage);
            console.log(PAGE_SIZE);
            console.log("ㅇㅇ")
            console.log("gd")
            console.log("==========");
        });
    }
</script>

</body>
</html>
