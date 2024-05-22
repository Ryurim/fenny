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
    <form role="search" id="frmSearch">
        <div class="mb-3 row">
            <label class="col-sm-2 col-form-label">검색 범위</label>
            <div class="col-sm-2">
                <input class="form-check-input" type="checkbox" name="search_type" id="search_type1" value="t" <c:if test="${qnaList['search_type_string'].contains('t')}">checked</c:if>>
                <label class="form-check-label" for="search_type1">제목</label>
                <input class="form-check-input" type="checkbox" name="search_type" id="search_type2" value="c" <c:if test="${qnaList['search_type_string'] != 'null' && qnaList['search_type_string'].contains('c')}">checked</c:if>>
                <label for="search_type2">내용</label>
            </div>
            <div class="col">
                <input class="form-check-label" type="search" name="search_word"  id="search_word" placeholder="Search" aria-label="Search" value="${qnaList.search_word}">
            </div>
        </div>


        <div class="mb-3 row">
            <label class="col-sm-2 col-form-label">검색 기간</label>
            <div class="col-sm-2">
                <input type="date" class="form-control" name="search_date1" id="search_date1" value="${qnaList.search_date1}">
            </div>
            <div class="col-sm-2">
                <span class="justify-content-center">~</span>
            </div>
            <div class="col-sm-2">
                <input type="date" class="form-control" name="search_date2" id="search_date2" value="${qnaList.search_date2}">
            </div>

            <div class="col-sm-2">
                <button class="btn btn-outline-success" type="submit">Search</button>
                <button class="btn btn-outline-success" id="btnReset" type="reset" onclick="location.href='/my/main'">reset</button>
            </div>
        </div>
        <div class="bg-light ps-3 py-3 rounded d-flex justify-content-between mb-4">
            <label for="sortMethod">정렬 순서:</label>
            <select id="sortMethod" name="sortMethod" onchange="goList()" class="border-0 form-select-sm bg-light me-3">
                <option value="">선택</option>
                <option value="study_reg_date||DESC" <c:if test="${qnaList.sortField eq 'study_reg_date' && qnaList.sortDir eq 'DESC'}"> selected</c:if>>최신순</option>
                <option value="study_reg_date||ASC" <c:if test="${qnaList.sortField eq 'study_reg_date' && qnaList.sortDir eq 'ASC'}"> selected</c:if>>오래된순</option>
                <option value="study_like_count||DESC" <c:if test="${qnaList.sortField eq 'study_like_count' && qnaList.sortDir eq 'DESC'}"> selected</c:if>>좋아요 많은순</option>
                <option value="study_like_count||ASC" <c:if test="${qnaList.sortField eq 'study_like_count' && qnaList.sortDir eq 'ASC'}"> selected</c:if>>좋아요 적은순</option>
            </select>
        </div>
    </form>

    <div>
        <button onclick="location.href='/share/main'">내가 한 공유</button>
        <button onclick="location.href='/share/main2'">내가 받은 공유</button>
        <button></button>
    </div>

    <div class="pd-ltr-20 xs-pd-20-10">
        <div class="min-height-200px">


            <!-- Bordered table  start -->
            <div class="pd-20 card-box mb-30">
                <div class="clearfix mb-20">
                    <div class="pull-left">
                        <h4 class="text-blue h4">Bordered table</h4>
                        <p>Add <code>.table .table-bordered</code> for borders on all sides of the table and cells.</p>
                    </div>

                </div>
                <table class="table table-bordered">
                    <thead>

                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>공유자</th>
                        <th>등록일</th>
                    </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">

                    <c:choose>
                        <c:when test="${not empty qnaList.dtoList}">
                            <c:forEach items="${qnaList.dtoList}" var="dto" varStatus="status">
                                <tr>
                                    <td class="text-nowrap">${qnaList.total_count - ((qnaList.page-1)*qnaList.page_size + (status.count-1))}</td>
                                    <td class="text-nowrap"><a
                                            href="/share/view?study_idx=${dto.study_idx}">${dto.study_title}</a>
                                    </td>
                                    <td class="text-nowrap">${dto.share_id1} ${dto.share_id2} ${dto.share_id3} ${dto.share_id4} ${dto.share_id5}</td>
                                    <td class="text-nowrap">${dto.study_reg_date}</td>
                                </tr>

                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td>내용이 없습니다.</td>
                            </tr>
                        </c:otherwise>
                    </c:choose>

                    </tbody>
                </table>


            </div>
            <!-- Bordered table End -->
            <div class="col">
                <div class="demo-inline-spacing">
                    <!-- Basic Square Pagination -->
                    <nav aria-label="Page navigation">
                        <ul class="pagination pagination-round pagination-primary  d-flex justify-content-center">
                            <li class="page-item <c:if test="${qnaList.prev_page_flag ne true}"> disabled</c:if> first">
                                <a class="page-link"
                                   data-num="<c:choose><c:when test="${qnaList.prev_page_flag}">${qnaList.page_block_start-1}</c:when><c:otherwise>1</c:otherwise></c:choose>"
                                   href="<c:choose><c:when test="${qnaList.prev_page_flag}">${qnaList.linkParams}&page=${qnaList.page_block_start-10}</c:when><c:otherwise>#</c:otherwise></c:choose>"><i class="ion-chevron-left"></i></a>
                            </li>
                            <c:forEach begin="${qnaList.page_block_start}"
                                       end="${qnaList.page_block_end}"
                                       var="page_num">
                                <li class="page-item<c:if test="${qnaList.page == page_num}"> active</c:if>">
                                    <a class="page-link" data-num="${page_num}"
                                       href="<c:choose><c:when test="${qnaList.page == page_num}">#</c:when><c:otherwise>${qnaList.linkParams}&page=${page_num}</c:otherwise></c:choose>">${page_num}</a>
                                </li>
                            </c:forEach>
                            <li class="page-item <c:if test="${qnaList.next_page_flag ne true}"> disabled</c:if> last">
                                <a class="page-link"data-num="<c:choose><c:when test="${qnaList.next_page_flag}">${qnaList.page_block_end+1}</c:when><c:otherwise>${qnaList.page_block_end}</c:otherwise></c:choose>"
                                   href="<c:choose><c:when test="${qnaList.next_page_flag}">${qnaList.linkParams}&page=${qnaList.page_block_end+1}</c:when><c:otherwise>#</c:otherwise></c:choose>"><i class="ion-chevron-right"></i></a>
                            </li>
                        </ul>
                    </nav>
                    <!--/ Basic Square Pagination -->
                </div>
            </div>

            <div>
                <c:if test="${not empty sessionScope.member_id}">
                    <button class="btn btn-primary" type="button" onclick="location.href='/my/regist'">등록하기</button>
                </c:if>
            </div>
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
        console.log(document.getElementById("search_word").value);
        frmSearch.submit();
    }
</script>
</body>
</html>
