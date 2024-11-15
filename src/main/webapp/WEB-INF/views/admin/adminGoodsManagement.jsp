<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="">
<!--<![endif]-->
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <title>Ela Admin - HTML5 Admin Template</title>
  <meta name="description" content="Ela Admin - HTML5 Admin Template" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png" />
  <link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png" />

  <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css"
  />
  <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
  />
  <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css"
  />
  <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css"
  />
  <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css"
  />
  <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css"
  />
  <link
      rel="stylesheet"
      href="/resources/adminG/assets/css/cs-skin-elastic.css"
  />
  <link
      rel="stylesheet"
      href="/resources/adminG/assets/css/lib/datatable/dataTables.bootstrap.min.css"
  />

  <link rel="stylesheet" href="/resources/adminG/assets/css/style.css" />

  <link
      href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800"
      rel="stylesheet"
      type="text/css"
  />

  <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->

  <style>
    .badge-complete {
      background: #00c292;
    }

    .badge {
      color: white;
      padding: 10px;
      text-transform: uppercase;
      font-weight: normal;
    }

    .badge {
      display: inline-block;
      padding: 0.25em 0.4em;
      font-size: 100%;
      font-weight: 700;
      line-height: 1;
      text-align: center;
      white-space: nowrap;
      vertical-align: baseline;
      border-radius: 0.25rem;
    }
    .badge-pending {
      background: #fb9678;
    }

    /* 발바닥 시작 */

    .footerContainer {
      width: 100%;
      border-top: 1px solid #ddd;
      padding-top: 50px;
      padding-bottom: 50px;
      display: flex;
      justify-content: center;
    }

    .footerContent {
      display: flex;
      width: 1500px;
      justify-content: space-around;
    }

    .footerContent p {
      color: rgb(102, 102, 102);
      margin: 0;
    }

    .footerLink {
      padding-bottom: 10px;
      color: rgb(102, 102, 102);
    }

    .footerLink a {
      color: black;
      text-decoration: none;
    }

    .footerLink a {
      padding-left: 20px;
      padding-right: 20px;
    }

    #footerLogo {
      width: 129px;
      height: 33px;
    }

    .developerList a {
      text-decoration: none;
      color: rgb(102, 102, 102);
      cursor: pointer;
    }
    /* 발바닥 끝 */

    .defaultA {
      text-decoration: none;
      color: black;
      border: none;
      background-color: transparent;
      cursor: pointer;
      transition: transform 0.2s ease-in-out;
    }

    .defaultA:hover {
      transform: scale(1.05);
    }

    td {
      text-align: center;
    }
  </style>
</head>

<body>
<!-- Left Panel -->
<aside id="left-panel" class="left-panel">
  <nav class="navbar navbar-expand-sm navbar-default">
    <div id="main-menu" class="main-menu collapse navbar-collapse">
      <ul class="nav navbar-nav">
        <li class="active">
          <a href="/admin/main.do"
          ><i class="menu-icon fa fa-laptop"></i>Dashboard
          </a>
        </li>
        <li class="menu-title">UI elements</li>
        <!-- /.menu-title -->

        <li class="menu-item-has-children dropdown">
          <a
              href="#"
              class="dropdown-toggle"
              data-toggle="dropdown"
              aria-haspopup="true"
              aria-expanded="false"
          >
            <i class="menu-icon fa fa-table"></i>Management</a
          >
          <ul class="sub-menu children dropdown-menu">
            <li>
              <i class="fa fa-table"></i
              ><a href="/admin/noticeMm.do">공지사항 관리</a>
            </li>
            <li>
              <i class="fa fa-table"></i
              ><a href="/admin/memberMm.do">회원 관리</a>
            </li>
            <li>
              <i class="fa fa-table"></i
              ><a href="/admin/goodsMm.do">상품 관리</a>
            </li>
          </ul>
        </li>
      </ul>
    </div>
    <!-- /.navbar-collapse -->
  </nav>
</aside>
<!-- /#left-panel -->
<!-- Right Panel -->
<div id="right-panel" class="right-panel">
  <!-- Header-->
  <header id="header" class="header">
    <div class="top-left">
      <div class="navbar-header">
        <a class="navbar-brand" href="/admin/main.do"
        ><img src="/resources/adminG/images/nanusamLogoLong.png" alt="Logo"
        /></a>
        <a class="navbar-brand hidden" href="/admin/main.do"
        ><img src="/resources/adminG/images/logo2.png" alt="Logo"
        /></a>
        <a id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
      </div>
    </div>
    <div class="top-right">
      <div class="header-menu">
        <div class="user-area dropdown float-right">
          <a
              href="#"
              class="dropdown-toggle active"
              data-toggle="dropdown"
              aria-haspopup="true"
              aria-expanded="false"
          >
            <img
                class="user-avatar rounded-circle"
                src="/resources/adminG/images/adminIcon.png"
                alt="User Avatar"
            />
          </a>

          <div class="user-menu dropdown-menu">
            <a class="nav-link" href="/admin/logout.do"
            ><i class="fa fa-power -off"></i>Logout</a
            >
          </div>
        </div>
      </div>
    </div>
  </header>
  <!-- /#header -->

  <!-- .content -->
  <div class="breadcrumbs">
    <div class="breadcrumbs-inner">
      <div class="row m-0">
        <div class="col-sm-4">
          <div class="page-header float-left">
            <div class="page-title">
              <h1>Dashboard</h1>
            </div>
          </div>
        </div>
        <div class="col-sm-8">
          <div class="page-header float-right">
            <div class="page-title">
              <ol class="breadcrumb text-right">
                <li><a href="#">Dashboard</a></li>
                <li><a href="#">Table</a></li>
                <li class="active">Data table</li>
              </ol>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="content">
    <div class="animated fadeIn">
      <div class="row">
        <div class="col-md-12">
          <div class="card">
            <div class="card-header">
              <strong class="card-title">Data Table</strong>
            </div>
            <div class="card-body">
              <table id="bootstrap-data-table" class="table table-striped table-bordered">
                <thead>
                <tr>
                  <th>Idx</th>
                  <th>MemberId</th>
                  <th>Name</th>
                  <th>Price</th>
                  <th>Quality</th>
                  <th>RegDate</th>
                  <th>Status</th>
                  <th>Delete</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="goods" items="${goodsList}">
                  <tr>
                    <td>${goods.idx}</td>
                    <td>${goods.memberId}</td>
                    <td>${goods.name}</td>
                    <td>${goods.price}</td>
                    <td>${goods.quality}</td>
                    <td>${goods.regDateStr}</td>
                    <td>
                      <c:choose>
                        <c:when test="${goods.status == 'Y'}">
                          <span class="badge badge-complete">판매중</span>
                          <form action="/admin/updateGoodsStatus.do" method="post" style="display: inline;">
                            <input type="hidden" name="idx" value="${goods.idx}" />
                            <input type="hidden" name="status" value="${goods.status}" />
                            <button type="submit" onclick="return confirmModify();" class="defaultA"><- 변경</button>
                          </form>
                        </c:when>
                        <c:when test="${goods.status == 'R'}">
                          <span class="badge badge-complete">예약</span>
                          <form action="/admin/updateGoodsStatus.do" method="post" style="display: inline;">
                            <input type="hidden" name="idx" value="${goods.idx}" />
                            <input type="hidden" name="status" value="${goods.status}" />
                            <button type="submit" onclick="return confirmModify();" class="defaultA"><- 변경</button>
                          </form>
                        </c:when>
                        <c:when test="${goods.status == 'N'}">
                          <span class="badge badge-complete">거래 완료</span>
                          <form action="/admin/updateGoodsStatus.do" method="post" style="display: inline;">
                            <input type="hidden" name="idx" value="${goods.idx}" />
                            <input type="hidden" name="status" value="${goods.status}" />
                            <button type="submit" onclick="return confirmModify();" class="defaultA"><- 변경</button>
                          </form>
                        </c:when>
                        <c:otherwise>
                          <span class="badge badge-danger">거래 불가</span>
                          <form action="/admin/updateGoodsStatus.do" method="post" style="display: inline;">
                            <input type="hidden" name="idx" value="${goods.idx}" />
                            <input type="hidden" name="status" value="${goods.status}" />
                            <button type="submit" onclick="return confirmModify();" class="defaultA"><- 변경</button>
                          </form>
                        </c:otherwise>
                      </c:choose>
                    </td>
                    <td>
                      <form action="/admin/deleteGoods.do" method="post" style="display: inline;">
                        <input type="hidden" name="idx" value="${goods.idx}" />
                        <button type="submit" onclick="return confirmDelete();" class="defaultA">삭제</button>
                      </form>
                    </td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- .animated -->
  </div>
  <!-- .content -->
  <div class="clearfix"></div>
  <!-- Footer -->
  <footer class="footerContainer">
    <c:import url="/WEB-INF/views/commonArea/footerArea.jsp" charEncoding="UTF-8" />
  </footer>
  <!-- /.site-footer -->
</div>
<!-- /#right-panel -->

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
<script src="/resources/adminG/assets/js/main.js"></script>

<script src="/resources/adminG/assets/js/lib/data-table/datatables.min.js"></script>
<script src="/resources/adminG/assets/js/lib/data-table/dataTables.bootstrap.min.js"></script>
<script src="/resources/adminG/assets/js/lib/data-table/dataTables.buttons.min.js"></script>
<script src="/resources/adminG/assets/js/lib/data-table/buttons.bootstrap.min.js"></script>
<script src="/resources/adminG/assets/js/lib/data-table/jszip.min.js"></script>
<script src="/resources/adminG/assets/js/lib/data-table/vfs_fonts.js"></script>
<script src="/resources/adminG/assets/js/lib/data-table/buttons.html5.min.js"></script>
<script src="/resources/adminG/assets/js/lib/data-table/buttons.print.min.js"></script>
<script src="/resources/adminG/assets/js/lib/data-table/buttons.colVis.min.js"></script>
<script src="/resources/adminG/assets/js/init/datatables-init.js"></script>

<script type="text/javascript">
  $(document).ready(function () {
    $("#bootstrap-data-table-export").DataTable();
  });
</script>

<c:if test="${not empty errors}">
  <script>
    alert("${errors}");
  </script>
</c:if>

<script>
  function confirmDelete() {
    if (confirm('삭제하시겠습니까?')) {
      return true;
    } else {
      alert('취소되었습니다.');
      return false;
    }
  }

  function confirmModify() {
    if (confirm('상품 정보를 변경하시겠습니까?')) {
      let newStatus = prompt('변경할 새로운 상태 값을 입력하세요\n(Y:판매중,R:예약, N:거래완료, D:거래불가):');
      if (newStatus !== null && newStatus.trim() !== '') {
        newStatus = newStatus.trim().toUpperCase();
        if (['Y', 'R', 'N', 'D'].includes(newStatus) && newStatus.length === 1) {
          document.querySelector('input[name="status"]').value = newStatus;
          return true;
        } else {
          alert('잘못된 입력입니다. Y, R, N, D 중 하나의 한 글자만 입력 가능합니다.');
          return false;
        }
      } else {
        alert('변경 값이 입력되지 않았거나 잘못되었습니다.');
        return false;
      }
    } else {
      alert('취소되었습니다.');
      return false;
    }
  }

</script>

</body>
</html>