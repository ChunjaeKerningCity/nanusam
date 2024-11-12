<%@ page contentType="text/html; charset=UTF-8" %>
<div class="searchArea">
  <form class="searchContainer" action="/일반검색" method="post">
    <select
        class="searchSelect"
        onchange="changeAction(this.form, this)"
    >
      <option value="/일반검색" selected>중고거래</option>
      <option value="/it">IT</option>
    </select>
    <input
        type="text"
        class="searchInput"
        placeholder="검색어를 입력해주세요"
    />
    <button type="submit" class="searchButton">
      <img src="/resources/public/searchIcon.png" alt="" width="25px" />
    </button>
  </form>
</div>