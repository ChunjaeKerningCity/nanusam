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

        .button {
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .formGroup {
            margin-bottom: 20px;
        }

        .noticeTitle {
            width: 200px;
            text-align: center;
        }

        .textInputWrapper {
            display: flex;
            align-items: center;
            border: 1px solid #ddd;
            padding: 10px;
        }

        .textInput {
            flex: 1;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .charCount {
            width: 100px;
            text-align: center;
            color: #666;
        }

        .textareaCountWrapper {
            display: flex;
            justify-content: flex-end;
            margin-top: 5px;
        }

        .confirmBtn {
            background-color: #fff1aa;
            color: black;
        }

        .confirmBtn:hover {
            background-color: #ffe97a;
        }

        .cancelBtn {
            background-color: #ff6f61;
            color: white;
        }

        .cancelBtn:hover {
            background-color: #e66055;
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
                            <h1 style="font-weight: bold">공지사항 수정</h1>
                        </div>
                    </div>
                </div>
                <div class="col-sm-8">
                    <div class="page-header float-right">
                        <div class="page-title">
                            <ol class="breadcrumb text-right">
                                <li class="active">작성자 : ${sessionScope.memberId}</li>
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
                            <strong class="card-title">Notice</strong>
                        </div>
                        <div class="card-body">
                            <form
                                action="/bbs/modify.do?idx=${dto.idx}"
                                method="post"
                                onsubmit="return validateForm()"
                            >
                                <div class="formGroup">
                                    <div class="textInputWrapper">
                                        <div class="noticeTitle"><span style="color: red">*</span>제목</div>
                                        <input
                                            type="text"
                                            id="title"
                                            name="title"
                                            class="textInput"
                                            maxlength="100"
                                            placeholder="제목을 입력하세요"
                                            oninput="updateCharCount(this, 'charCount')"
                                            value="${dto.title}"
                                            required
                                        />
                                        <span class="charCount" id="charCount">0/100</span>
                                    </div>
                                </div>

                                <input
                                    type="hidden"
                                    name="bbsCode"
                                    aria-describedby="basic-addon1"
                                    value="01"
                                    readonly
                                />

                                <input
                                    type="hidden"
                                    name="memberId"
                                    aria-describedby="basic-addon1"
                                    value="${dto.memberId}"
                                    readonly
                                />

                                <div class="formGroup">
                                    <div class="textareaCountWrapper">
                                        <span class="charCount" id="editorCharCount">0/3000</span>
                                    </div>
                                    <textarea
                                        name="content"
                                        id="editor1"
                                        rows="10"
                                        cols="80"
                                        maxlength="3000"
                                        required
                                    >${dto.content}</textarea>
                                </div>
                                <button type="submit" class="button confirmBtn">등록</button>
                                <button
                                    type="button"
                                    class="button cancelBtn"
                                    onclick="javascript:location.href='/bbs/view.do?idx=' + ${dto.idx}"
                                >
                                    취소
                                </button>
                            </form>
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
<script src="https://cdn.ckeditor.com/4.20.0/standard/ckeditor.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $("#bootstrap-data-table-export").DataTable();
    });
</script>

<script>
    CKEDITOR.replace("editor1");

    CKEDITOR.instances.editor1.on("contentDom", function () {
        CKEDITOR.instances.editor1.document.on("keyup", function () {
            updateEditorCharCount();
        });
        CKEDITOR.instances.editor1.document.on("paste", function () {
            setTimeout(updateEditorCharCount, 100);
        });
    });

    function updateCharCount(input, countId) {
        const charCount = document.getElementById(countId);
        const currentLength = input.value.length;
        const maxLength = input.getAttribute("maxlength");

        charCount.textContent = currentLength + "/" + maxLength;

        if (currentLength > maxLength) {
            charCount.style.color = "red";
        } else {
            charCount.style.color = "#666";
        }
    }

    function updateEditorCharCount() {
        const editorInstance = CKEDITOR.instances.editor1;
        const charCountElement = document.getElementById("editorCharCount");
        const contentLength = editorInstance
        .getData()
        .replace(/<[^>]*>/g, "").length;
        const maxLength = 3000;

        charCountElement.textContent = contentLength + "/" + maxLength;

        if (contentLength > maxLength) {
            charCountElement.style.color = "red";
        } else {
            charCountElement.style.color = "#666";
        }
    }

    function validateForm() {
        const titleInput = document.getElementById("title");
        const editorInstance = CKEDITOR.instances.editor1;
        const contentLength = editorInstance
        .getData()
        .replace(/<[^>]*>/g, "").length;

        if (titleInput.value.length > 100) {
            alert("제목은 100자를 넘을 수 없습니다. 글자를 줄여주세요.");
            return false;
        }

        if (contentLength > 3000) {
            alert("내용은 3000자를 넘을 수 없습니다. 글자를 줄여주세요.");
            return false;
        }

        if (contentLength <= 0) {
            alert("내용을 입력해주세요.");
            return false;
        }

        return true;
    }
</script>

<c:if test="${not empty errors}">
    <script>
        alert("${errors}");
    </script>
</c:if>

</body>
</html>