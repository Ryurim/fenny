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
                    <input type="hidden" name="study_idx" id="study_idx" value="${studyDTO.study_idx}">
                    <div class="form-group">
                        <label for="study_title">제목</label>
                        <input class="form-control" name="study_title" id="study_title" value="${studyDTO.study_title}" readonly>
                    </div>
                    <div class="form-group">
                        <label for="study_title">좋아요 수</label>
                        <input class="form-control" name="study_like_count" id="study_like_count" value="${studyDTO.study_like_count}" readonly>
                    </div>
                <c:if test="${not empty studyDTO.study_image}">
                <div class="form-group">
                    <label>이미지</label>
                    <img height="600" width="400" src="/resources/resources/uploads/img/study/${studyDTO.study_image}" alt="">
                </div>
                </c:if>
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
                        <label for="study_category">분야</label>
                        <input class="form-control" name="study_category" id="study_category" value="${studyDTO.study_category}" readonly>
                    </div>
                    <div class="form-group">
                        <label for="study_hashtag">해시태그</label>
                        <input class="form-control" name="study_hashtag" id="study_hashtag" value="${studyDTO.study_hashtag}" readonly>
                    </div>

                    <div class="form-group">
                        <label for="study_hashtag">공유받은 사람</label>
                        <div class="d-flex flex-column gap-3 justify-content-center" >

                           <c:forEach items="${studyShareDTOList}" var="dto" varStatus="status">
                               <input type="hidden" name="to_id" id="to_id" value="${dto.to_id}">
                               <span id="share${status.index}">
                                       ${dto.to_id} (${dto.reg_date})
                                   <button class="btn text-danger" onclick="askDelete(${status.index}, '${dto.to_id}')">X</button>
                               </span>
                           </c:forEach>

                        </div>
                    </div>

                    <button class="btn btn-primary" type="button" onclick="location.href='/my/modify?study_idx=${studyDTO.study_idx}'">수정하기</button>
                    <button class="btn btn-secondary" type="button" onclick="location.href='/my/main'">목록으로</button>
                <form action="/my/delete" method="post">
                    <input type="hidden" name="study_idx" value="${studyDTO.study_idx}">
                    <button class="btn btn-danger" type="submit">삭제하기</button>
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



    function askDelete(index, to_id) {
        let deleteYN = confirm("공유를 취소하시겠습니까?");
        if (deleteYN) {
            deleteShare(index, to_id);
        }
    }

    function deleteShare(index, to_id){
        event.preventDefault();
        event.stopPropagation();
        var idx = $('#study_idx').val(); //id값이 "id"인 입력란의 값을 저장
        var spanInner = $('#share' + index);
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
                console.error("AJAX 요청 실패!");
                console.error("상태 코드: " + xhr.status); // HTTP 상태 코드
                console.error("상태 텍스트: " + xhr.statusText); // 상태 텍스트
                console.error("응답 텍스트: " + xhr.responseText); // 서버에서 반환된 응답 텍스트
                console.error("오류: " + error); // 오류 메시지
            }
        });

    }

</script>
</body>
</html>
