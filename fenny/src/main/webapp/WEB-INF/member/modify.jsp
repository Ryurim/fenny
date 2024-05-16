<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Basic Page Info -->
    <meta charset="utf-8">
    <title>DeskApp - Bootstrap Admin Dashboard HTML Template</title>

    <!-- Site favicon -->
    <link rel="apple-touch-icon" sizes="180x180" href="/resources/resources/vendors/images/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/resources/resources/vendors/images/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/resources/resources/vendors/images/favicon-16x16.png">

    <!-- Mobile Specific Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
          rel="stylesheet">
    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="/resources/resources/vendors/styles/core.css">
    <link rel="stylesheet" type="text/css" href="/resources/resources/vendors/styles/icon-font.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/resources/src/plugins/cropperjs/dist/cropper.css">
    <link rel="stylesheet" type="text/css" href="/resources/resources/vendors/styles/style.css">

    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
    <script>
        window.dataLayer = window.dataLayer || [];

        function gtag() {
            dataLayer.push(arguments);
        }

        gtag('js', new Date());

        gtag('config', 'UA-119386393-1');
    </script>
</head>
<body>
<jsp:include page="../common/header.jsp"/>


<div class="container-sm">
    <div class="pd-ltr-20 xs-pd-20-10">
        <div class="min-height-200px">
            <div class="page-header">
                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <div class="title">
                            <h4>Profile</h4>
                        </div>
                        <nav aria-label="breadcrumb" role="navigation">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="/">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Profile</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 mb-30">
                    <div class="pd-20 card-box height-100-p">

                        <h5 class="text-center h5 mb-0">마이페이지</h5>
                        <p class="text-center text-muted font-14">${memberDTO.member_id}님, 환영합니다.</p>
                        <div class="profile-info">
                            <h5 class="mb-20 h5 text-blue">나의 정보 수정</h5>

                            <form id="frmModify" action="/member/modify" method="post">

                                <div class="form-group row">
                                    <label class="col-sm-12 col-md-2 col-form-label">아이디</label>
                                    <div class="col-sm-12 col-md-10">
                                        <input class="form-control" type="text" name="member_id"
                                               value="${memberDTO.member_id}" readonly>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-12 col-md-2 col-form-label">이메일</label>
                                    <div class="col-sm-12 col-md-10">
                                        <input class="form-control" type="email" name="member_email"
                                               value="${memberDTO.member_email}" readonly>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-12 col-md-2 col-form-label">이름</label>
                                    <div class="col-sm-12 col-md-10">
                                        <input class="form-control" placeholder="Search Here" type="text"
                                               name="member_name" value="${memberDTO.member_name}" readonly>
                                    </div>
                                </div>
                                <input type="hidden" name="member_pwd" value="${memberDTO.member_pwd}">
                                <div class="form-group row">
                                    <label class="col-sm-12 col-md-2 col-form-label">비밀번호</label>
                                    <div class="col-sm-12 col-md-10">
                                        <input class="form-control" type="password" onclick="modifyPwd()" name="modify_pwd">
                                    </div>
                                </div>
                                <div id="div_err_member_pwd" style="display: none"></div>
                                <div class="form-group row">
                                    <label class="col-sm-12 col-md-2 col-form-label">비밀번호 확인</label>
                                    <div class="col-sm-12 col-md-10">
                                        <input class="form-control" type="password" name="check_pwd">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-12 col-md-2 col-form-label">휴대폰번호</label>
                                    <div class="col-sm-12 col-md-10">
                                        <input class="form-control" type="tel" name="member_phone"
                                               value="${memberDTO.member_phone}">
                                    </div>
                                </div>
                                <div id="div_err_member_phone" style="display: none"></div>

                                <div class="row">
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 mb-30">
                                        <button type="submit" id="btnLogin" class="btn btn-primary"
                                                onclick="location.href='/member/modify?member_id=${sessionScope.member_id}'">
                                            회원정보수정 완료
                                        </button>
                                    </div>
                                </div>
                            </form>

                        </div>

                    </div>
                </div>

            </div>
        </div>

        <div class="footer-wrap pd-20 mb-20 card-box">
            DeskApp - Bootstrap 4 Admin Template By <a href="https://github.com/dropways" target="_blank">Ankit
            Hingarajiya</a>
        </div>
    </div>
</div>
<!-- js -->
<script src="/resources/resources/vendors/scripts/core.js"></script>
<script src="/resources/resources/vendors/scripts/script.min.js"></script>
<script src="/resources/resources/vendors/scripts/process.js"></script>
<script src="/resources/resources/vendors/scripts/layout-settings.js"></script>
<script src="/resources/resources/src/plugins/cropperjs/dist/cropper.js"></script>
<script>
    window.addEventListener('DOMContentLoaded', function () {
        var image = document.getElementById('image');
        var cropBoxData;
        var canvasData;
        var cropper;

        $('#modal').on('shown.bs.modal', function () {
            cropper = new Cropper(image, {
                autoCropArea: 0.5,
                dragMode: 'move',
                aspectRatio: 3 / 3,
                restore: false,
                guides: false,
                center: false,
                highlight: false,
                cropBoxMovable: false,
                cropBoxResizable: false,
                toggleDragModeOnDblclick: false,
                ready: function () {
                    cropper.setCropBoxData(cropBoxData).setCanvasData(canvasData);
                }
            });
        }).on('hidden.bs.modal', function () {
            cropBoxData = cropper.getCropBoxData();
            canvasData = cropper.getCanvasData();
            cropper.destroy();
        });
    });
</script>
<script>

    //서버 validation 체크
    const serverValidResult = {}; //JSON 객체 빈값으로 선언
    <c:forEach items="${errors}" var="err">
    if (document.getElementById("div_err_${err.getField()}") != null) {
        document.getElementById("div_err_${err.getField()}").innerHTML = "<span style='color:red'>${err.defaultMessage}</span>";
        document.getElementById("div_err_${err.getField()}").style.display = "block";
    }
    serverValidResult['${err.getField()}'] = '${err.defaultMessage}';
    </c:forEach>
    console.log(serverValidResult);


    if(${!empty error}) {
        alert("${error}");
    }

    function modifyPwd() {
        let pwd = document.getElementById("member_pwd");
        let check_pwd = document.getElementById("check_pwd");
        pwd.disabled = false;
        check_pwd.disabled = false;
    }

</script>
</body>
</html>