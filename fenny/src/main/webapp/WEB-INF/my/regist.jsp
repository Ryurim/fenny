<%--
  Created by IntelliJ IDEA.
  User: ryuri
  Date: 2024-04-25
  Time: PM 3:29
  To change this template use File | Settings | File Templates.
--%>
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

    <style>
        .container-sm {
            margin-top: 40px;
        }
    </style>
</head>

<body>

<jsp:include page="../common/header.jsp"/>

<div class="container-sm">



    <div class="pd-ltr-20 xs-pd-20-10">
        <div class="min-height-200px">


            <!-- Bordered table  start -->
            <div class="pd-20 card-box mb-30">
                <div class="clearfix mb-20">
                    <div class="pull-left">
                        <h4 class="text-blue h4">나의 학습 등록</h4>

                    </div>
                </div>

                <form action="/my/regist" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="member_id" value="${sessionScope.member_id}">
                    <div class="form-group">
                        <label for="study_title">제목</label>
                        <input class="form-control" name="study_title" id="study_title" value="${studyDTO.study_title}">
                    </div>
                    <div class="form-group">
                        <label for="study_content">내용</label>
                        <textarea class="form-control" name="study_content" id="study_content">${studyDTO.study_content}</textarea>
                    </div>

                    <div class="form-group">
                        <label>오늘의 학습 노출 여부</label>
                        <input type="radio" class="custom-radio" name="study_reveal" value="Y"><label>&nbsp;Y</label>
                        <input type="radio" class="custom-radio" name="study_reveal" value="N"><label>&nbsp;N</label>
                    </div>

                    <div class="form-group">
                        <label>오늘의 학습 공유 여부</label>
                        <input type="radio" class="custom-radio" name="study_share" value="Y"><label>&nbsp;Y</label>
                        <input type="radio" class="custom-radio" name="study_share" value="N"><label>&nbsp;N</label>
                    </div>

                    <div class="form-group">
                        <label>이미지</label>
                        <input type="file" name="upload" class="form-control-file form-control height-auto"  accept="image/png, image/jpeg" >
                    </div>
                    <div class="form-group">
                        <label for="study_category">분야</label>
                        <input class="form-control" name="study_category" id="study_category" value="${studyDTO.study_category}">
                    </div>
                    <div class="form-group">
                        <label for="study_hashtag">해시태그</label>
                        <input class="form-control" name="study_hashtag" id="study_hashtag" value="${studyDTO.study_hashtag}">
                    </div>
                    <div class="form-group">
                        <label>노출 기간 시작</label>
                        <input type="date" class="form-control col-md-4" name="study_display_date_start" placeholder="선택">
                    </div>
                    <div class="form-group">
                        <label>노출 기간 끝</label>
                        <input type="date" class="form-control col-md-4" name="study_display_date_end" placeholder="선택" >
                    </div>
                    <div class="form-group">
                        <label>공유할 사람1</label>
                        <select class="form-control"  name="share_id1">
                            <option value="" name="share_id1">선택</option>
                            <c:forEach var="dto" items="${memberDTOList}">
                                <option value="${dto.member_id}">${dto.member_id}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>공유할 사람2</label>
                        <select class="form-control"  name="share_id2">
                            <option value="" name="share_id2">선택</option>
                            <c:forEach var="dto" items="${memberDTOList}">
                                <option value="${dto.member_id}">${dto.member_id}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>공유할 사람3</label>
                        <select class="form-control"  name="share_id3">
                            <option value="" name="share_id3">선택</option>
                            <c:forEach var="dto" items="${memberDTOList}">
                                <option value="${dto.member_id}">${dto.member_id}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>공유할 사람4</label>
                        <select class="form-control" name="share_id4">
                            <option value="" name="share_id4">선택</option>
                            <c:forEach var="dto" items="${memberDTOList}">
                                <option value="${dto.member_id}">${dto.member_id}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>공유할 사람5</label>
                        <select class="form-control"  name="share_id5">
                            <option value="" name="share_id5">선택</option>
                            <c:forEach var="dto" items="${memberDTOList}">
                                <option value="${dto.member_id}">${dto.member_id}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <button class="btn btn-primary" type="submit">등록하기</button>
                    <button class="btn btn-secondary" type="reset">취소하기</button>
                </form>



            </div>
            <!-- Bordered table End -->


        </div>

    </div>
</div>
<!-- js -->
<script src="/resources/resources/vendors/scripts/core.js"></script>
<script src="/resources/resources/vendors/scripts/script.min.js"></script>
<script src="/resources/resources/vendors/scripts/process.js"></script>
<script src="/resources/resources/vendors/scripts/layout-settings.js"></script>
<script>
    //정렬 필터
    function goList() {
        const frmSearch = document.getElementById("frmSearch");
        frmSearch.submit();
    }
</script>
</body>
</html>
