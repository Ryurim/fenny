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
                        <h4 class="text-blue h4">나의 학습 수정</h4>

                    </div>
                </div>

                <form action="/my/modify" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="member_id" value="${sessionScope.member_id}">
                    <input type="hidden" name="study_idx" value="${studyDTO.study_idx}">
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
                        <input type="radio" class="custom-radio" name="study_reveal" <c:if test="${studyDTO.study_reveal eq 'Y'}" >checked</c:if> value="Y"><label>&nbsp;Y</label>
                        <input type="radio" class="custom-radio" name="study_reveal" <c:if test="${studyDTO.study_reveal eq 'N'}" >checked</c:if> value="N"><label>&nbsp;N</label>
                    </div>
                    <div class="form-group">
                        <label>오늘의 학습 공유 여부</label>
                        <input type="radio" class="custom-radio" name="study_share" <c:if test="${studyDTO.study_share eq 'Y'}" >checked</c:if> value="Y"><label>&nbsp;Y</label>
                        <input type="radio" class="custom-radio" name="study_share" <c:if test="${studyDTO.study_share eq 'N'}" >checked</c:if> value="N"><label>&nbsp;N</label>
                    </div>

                    <div class="form-group">
                        <c:if test="${not empty studyDTO.study_image}">
                        <div id="orgImg">
                            <img height="600" width="400" src="/resources/resources/uploads/img/study/${studyDTO.study_image}" alt="" id="preview">
                            <input type="hidden" name="file" value="${studyDTO.study_image}">
                        </div>
                        </c:if>
                        <label>이미지</label>
                        <input type="file" name="upload" class="form-control-file form-control height-auto"  accept="image/png, image/jpeg" onchange="readURL(this)"  >
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
<%--                    <div class="form-group">--%>
<%--                        <label>공유할 사람1</label>--%>
<%--                        <select class="form-control" name="share_id1">--%>
<%--                            <option value="" >선택</option>--%>
<%--                            <c:forEach var="dto" items="${memberDTOList}">--%>
<%--                                <option value="${dto.member_id}" <c:if test="${dto.member_id eq studyDTO.share_id1}">selected</c:if>>${dto.member_id}</option>--%>
<%--                            </c:forEach>--%>
<%--                        </select>--%>
<%--                    </div>--%>
<%--                    <div class="form-group">--%>
<%--                        <label>공유할 사람2</label>--%>
<%--                        <select class="form-control"  name="share_id2" >--%>
<%--                            <option value="">선택</option>--%>
<%--                            <c:forEach var="dto" items="${memberDTOList}">--%>
<%--                                <option value="${dto.member_id}" <c:if test="${dto.member_id eq studyDTO.share_id2}">selected</c:if>>${dto.member_id}</option>--%>
<%--                            </c:forEach>--%>
<%--                        </select>--%>
<%--                    </div>--%>
<%--                    <div class="form-group">--%>
<%--                        <label>공유할 사람3</label>--%>
<%--                        <select class="form-control"  name="share_id3">--%>
<%--                            <option value="">선택</option>--%>
<%--                            <c:forEach var="dto" items="${memberDTOList}">--%>
<%--                                <option value="${dto.member_id}" <c:if test="${dto.member_id eq studyDTO.share_id3}">selected</c:if>>${dto.member_id}</option>--%>
<%--                            </c:forEach>--%>
<%--                        </select>--%>
<%--                    </div>--%>
<%--                    <div class="form-group">--%>
<%--                        <label>공유할 사람4</label>--%>
<%--                        <select class="form-control" name="share_id4">--%>
<%--                            <option value="">선택</option>--%>
<%--                            <c:forEach var="dto" items="${memberDTOList}">--%>
<%--                                <option value="${dto.member_id}" <c:if test="${dto.member_id eq studyDTO.share_id4}">selected</c:if>>${dto.member_id}</option>--%>
<%--                            </c:forEach>--%>
<%--                        </select>--%>
<%--                    </div>--%>
<%--                    <div class="form-group">--%>
<%--                        <label>공유할 사람5</label>--%>
<%--                        <select class="form-control"  name="share_id5">--%>
<%--                            <option value="">선택</option>--%>
<%--                            <c:forEach var="dto" items="${memberDTOList}">--%>
<%--                                <option value="${dto.member_id}" <c:if test="${dto.member_id eq studyDTO.share_id5}">selected</c:if>>${dto.member_id}</option>--%>
<%--                            </c:forEach>--%>
<%--                        </select>--%>
<%--                    </div>--%>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Multiple Select</label>
                            <select class="custom-select2 form-control" multiple="multiple" style="width: 100%;" name="share">
                                <option value="" >선택</option>
                                <c:forEach var="dto" items="${memberDTOList}">
                                    <option value="${dto.member_id}">${dto.member_id}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <button class="btn btn-primary" type="submit">수정하기</button>
                    <button class="btn btn-secondary" type="reset">취소하기</button>
                </form>
                <div class="form-group">
                    <label for="study_hashtag">공유받은 사람</label>
                    <div class="d-flex flex-column gap-3 justify-content-center" >

                        <c:forEach items="${studyShareDTOList}" var="dto" varStatus="status">
                            <input type="hidden" name="to_id" id="to_id" value="${dto.to_id}">
                            <span id="share${status}">${dto.to_id} ${dto.reg_date} <button class="btn text-danger"  id="btnDelete1" onclick="askDelete()">X</button></span>
                        </c:forEach>
                       
                    </div>
                </div>


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


    //사진 미리보기
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                document.getElementById('preview').src = e.target.result;
            };
            reader.readAsDataURL(input.files[0]);
        } else {
            document.getElementById('preview').src = "";
        }
    }

    function askDelete() {
        let deleteYN = confirm("공유를 취소하시겠습니까?");
        if (deleteYN) {
            deleteShare();
        }
    }

    function deleteShare(){
        event.preventDefault();
        event.stopPropagation();
        var idx = $('#study_idx').val(); //id값이 "id"인 입력란의 값을 저장
        var to_id = $('#to_id').val();
        var spanInner = $('#share${status}');
        $.ajax({
            url:'/study/deleteShare', //Controller에서 요청 받을 주소
            type:'post', //POST 방식으로 전달
            data:{study_idx:idx, to_id:to_id},
            dataType : 'text',
            success:function(result){ //컨트롤러에서 넘어온 cnt값을 받는다
                spanInner.remove();
                console.log(result);
            },
            error : function(xhr, status, error) {
                console.log("xhr! : " + xhr);
                console.log("status! : " + status);
                console.log("error! : " + error);
            }
        })

    }

</script>
</body>
</html>
