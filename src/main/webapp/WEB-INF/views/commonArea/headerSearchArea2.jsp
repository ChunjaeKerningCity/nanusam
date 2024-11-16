<%@ page pageEncoding="UTF-8"%>
<div>
  <form class="searchContainer2" action="/goods/list.do" method="get">
    <select name="searchCategory" id="searchCategory"
        class="searchSelect">
      <option value="">전체</option>
      <c:forEach items="${categories}" var="category">
        <option value="${category.code}" ${pageinfo.searchCategory eq category.code ? 'selected' : ''}>${category.value}</option>
      </c:forEach>
    </select>
    <input
        type="text"
        class="searchInput"
        name="searchKeyword" id="searchKeyword"
        placeholder="검색어를 입력해주세요" value="${pageinfo.searchKeyword}"
    />
    <button type="submit" class="searchButton">
      <img src="/resources/public/searchIcon.png" alt="" width="25px" />
    </button>
  </form>
</div>