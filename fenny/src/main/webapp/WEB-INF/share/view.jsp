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
                        <h4 class="text-blue h4">나의 학습 조회</h4>

                    </div>
                </div>


                    <input type="hidden" name="member_id" value="${sessionScope.member_id}">
                    <input type="hidden" name="study_idx" value="${studyDTO.study_idx}">
                    <div class="form-group">
                        <label for="study_title">제목</label>
                        <input class="form-control" name="study_title" id="study_title" value="${studyDTO.study_title}" readonly>
                    </div>
                    <div class="form-group">
                        <label for="study_title">좋아요 수</label>
                        <input class="form-control" name="study_title" id="study_title" value="${studyDTO.study_like_count}" readonly>
                    </div>
                    <div class="form-group">
                        <label for="study_content">내용</label>
                        <textarea class="form-control" name="study_content" id="study_content" readonly>${studyDTO.study_content}</textarea>
                    </div>

                    <div class="form-group">
                        <label>오늘의 학습 노출 여부 : </label>
                        <span>${studyDTO.study_reveal}</span>
                    </div>
                <div class="form-group">
                    <label>오늘의 학습 공유 여부 : </label>
                    <span>${studyDTO.study_share}</span>
                </div>
                    <div class="form-group">
                        <label>등록일</label>
                        <span>${studyDTO.study_reg_date}</span>
                    </div>
                    <div class="form-group">
                        <label>노출 기간 </label>
                        <input type="date" class="form-control col-md-4" value="${studyDTO.study_display_date_start}" name="study_display_date_start" placeholder="선택" readonly> ~
                        <input type="date" class="form-control col-md-4" value="${studyDTO.study_display_date_end}" name="study_display_date_end" placeholder="선택" readonly >
                    </div>
                    <div class="form-group">
                        <label>이미지</label>
                        <input type="file" name="upload" class="form-control-file form-control height-auto"  accept="image/png, image/jpeg" readonly >
                    </div>
                    <div class="form-group">
                        <label for="study_category">분야</label>
                        <input class="form-control" name="study_category" id="study_category" value="${studyDTO.study_category}" readonly>
                    </div>
                    <div class="form-group">
                        <label for="study_hashtag">해시태그</label>
                        <input class="form-control" name="study_hashtag" id="study_hashtag" value="${studyDTO.study_hashtag}" readonly>
                    </div>

                    <div class="form-group">
                        <label for="study_hashtag">공유한 사람</label>
                        <c:if test="${not empty studyDTO.share_id1}">
                            <input class="form-control" type="text" name="share_id1" value="${studyDTO.share_id1}" readonly>
                        </c:if>
                        <c:if test="${not empty studyDTO.share_id2}">
                            <input class="form-control" ="text" name="share_id1" value="${studyDTO.share_id2}" readonly>
                        </c:if>
                        <c:if test="${not empty studyDTO.share_id3}">
                            <input class="form-control" type="text" name="share_id1" value="${studyDTO.share_id3}" readonly>
                        </c:if>
                        <c:if test="${not empty studyDTO.share_id4}">
                            <input class="form-control" type="text" name="share_id1" value="${studyDTO.share_id4}" readonly>
                        </c:if>
                        <c:if test="${not empty studyDTO.share_id5}">
                            <input class="form-control" type="text" name="share_id1" value="${studyDTO.share_id5}" readonly>
                        </c:if>
                    </div>

<%--                    <button class="btn btn-primary" type="button" onclick="location.href='/my/modify?study_idx=${studyDTO.study_idx}'">수정하기</button>--%>
                    <button class="btn btn-secondary" type="button" onclick="location.href='/share/main'">목록으로</button>
                <c:if test="${sessionScope.member_id eq studyDTO.member_id}">
                    <button class="btn btn-primary" type="button"  onclick="location.href='/my/modify?study_idx=${studyDTO.study_idx}'">수정하기</button>
                </c:if>


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
