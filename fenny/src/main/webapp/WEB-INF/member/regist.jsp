<%--
  Created by IntelliJ IDEA.
  User: ryuri
  Date: 2024-05-14(Tue)
  Time: PM 7:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <!-- Basic Page Info -->
    <meta charset="utf-8">
    <title>Sign Up</title>

    <!-- Site favicon -->
    <link rel="apple-touch-icon" sizes="180x180" href="/resources/resources/vendors/images/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/resources/resources/vendors/images/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/resources/resources/vendors/images/favicon-16x16.png">

    <!-- Mobile Specific Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="/resources/resources/vendors/styles/core.css">
    <link rel="stylesheet" type="text/css" href="/resources/resources/vendors/styles/icon-font.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/resources/src/plugins/jquery-steps/jquery.steps.css">
    <link rel="stylesheet" type="text/css" href="/resources/resources/vendors/styles/style.css">

    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());

        gtag('config', 'UA-119386393-1');
    </script>
    <style>
        .id_ok{
            color:#008000;
            display: none;
        }

        .id_already{
            color:#6A82FB;
            display: none;
        }
        .email_ok{
            color:#008000;
            display: none;
        }

        .email_already{
            color:#6A82FB;
            display: none;
        }
    </style>
    <script src="/resources/resources/jquery/jquery-3.7.1.min.js"></script>
</head>

<body class="login-page">
<div class="login-header box-shadow">
    <div class="container-fluid d-flex justify-content-between align-items-center">
        <div class="brand-logo">
            <a class="navbar-brand text-success logo h1 align-self-center" href="/">
                FENNY
            </a>
        </div>
        <div class="login-menu">
            <ul>
                <li><a href="/login/login">LogIn</a></li>
            </ul>
        </div>
    </div>
</div>

<div class="register-page-wrap d-flex align-items-center flex-wrap justify-content-center">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-6 col-lg-7">
                <img src="/resources/resources/vendors/images/register-page-img.png" alt="">
            </div>
            <div class="col-md-6 col-lg-5">
                <div class="register-box bg-white box-shadow border-radius-10">
                    <div class="wizard-content">
                        <form class="tab-wizard2 wizard-circle wizard" id="frmRegist" action="/member/regist" method="post">

                        <h5>Basic Account Credentials</h5>
                            <section>
                                <div class="form-wrap max-width-600 mx-auto">

                                    <div class="form-group row">
                                        <label class="col-sm-4 col-form-label">UserID*</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control"  name="member_id" id="member_id">
                                            <span class="id_ok">사용 가능한 아이디입니다.</span>
                                            <span class="id_already">누군가 이 아이디를 사용하고 있어요.</span>
                                        </div>
                                    </div>
                                    <div id="div_err_member_id" style="display: none"></div>
                                    <div class="form-group row">
                                        <button type="button" class="btn btn-info" onclick="checkId()">아이디 중복체크</button>
                                    </div>

                                    <div class="form-group row">
                                        <label class="col-sm-4 col-form-label">Password*</label>
                                        <div class="col-sm-8">
                                            <input type="password" class="form-control"  name="member_pwd" id="member_pwd" value="">
                                        </div>
                                    </div>
                                    <div id="div_err_member_pwd" style="display: none"></div>

                                    <div class="form-group row">
                                        <label class="col-sm-4 col-form-label">Confirm Password*</label>
                                        <div class="col-sm-8">
                                            <input type="password" class="form-control"  name="check_pwd" id="check_pwd" value="">
                                        </div>
                                    </div>
                                </div>

                                <div class="form-wrap max-width-600 mx-auto">
                                    <div class="form-group row">
                                        <label class="col-sm-4 col-form-label">UserName*</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control"  name="member_name" id="member_name" value="">
                                        </div>

                                    </div>
                                    <div id="div_err_member_name" style="display: none"></div>
                                    <div class="form-group row">
                                        <label class="col-sm-4 col-form-label">UserPhone*</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control"  name="member_phone" id="member_phone" value="">
                                        </div>
                                    </div>
                                    <div id="div_err_member_phone" style="display: none"></div>
                                    <div class="form-group row">
                                        <label class="col-sm-4 col-form-label">Email Address*</label>
                                        <div class="col-sm-8">
                                            <input type="email" class="form-control"  name="member_email" id="member_email" value="">
                                            <span class="email_ok">사용 가능한 이메일입니다.</span>
                                            <span class="email_already">누군가 이 이메일을 사용하고 있어요.</span>
                                        </div>
                                    </div>
                                    <div id="div_err_member_email" style="display: none"></div>
                                    <div class="form-group row">
                                            <button type="button" class="btn btn-info" onclick="checkEmail()">이메일 중복체크</button>
                                    </div>
                                </div>
                            </section>
                            <!-- Step 3 -->

                            <!-- Step 4 -->
                            <button type="submit" id="success-modal-btn" hidden data-toggle="modal" data-target="#success-modal" data-backdrop="static">Launch modal</button>
<%--                            <div class="modal fade" id="success-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">--%>
<%--                                <div class="modal-dialog modal-dialog-centered max-width-400" role="document">--%>
<%--                                    <div class="modal-content">--%>
<%--                                        <div class="modal-body text-center font-18">--%>
<%--                                            <h3 class="mb-20">회원가입 완료!</h3>--%>
<%--                                            <div class="mb-30 text-center"><img src="/resources/resources/vendors/images/success.png"></div>--%>
<%--                                            저희의 가족이 되어주셔서 감사합니다!<br>로그인 페이지로 이동합니다 :)--%>
<%--                                        </div>--%>
<%--                                        <div class="modal-footer justify-content-center">--%>
<%--                                            <a href="/login/login" class="btn btn-primary">Done</a>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- success Popup html Start -->


<!-- success Popup html End -->
<!-- js -->
<script src="/resources/resources/vendors/scripts/core.js"></script>
<script src="/resources/resources/vendors/scripts/script.min.js"></script>
<script src="/resources/resources/vendors/scripts/process.js"></script>
<script src="/resources/resources/vendors/scripts/layout-settings.js"></script>
<script src="/resources/resources/src/plugins/jquery-steps/jquery.steps.js"></script>
<script src="/resources/resources/vendors/scripts/steps-setting.js"></script>
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

    //아이디 중복체크
    function checkId(){
        event.preventDefault();
        event.stopPropagation();
        var id = $('#member_id').val().trim(); //id값이 "id"인 입력란의 값을 저장
        $.ajax({
            url:'/member/checkId', //Controller에서 요청 받을 주소
            type:'post', //POST 방식으로 전달
            data:{member_id:id},
            dataType : 'text',
            success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다
                console.log(cnt);
                if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디
                    $('.id_ok').css("display","inline-block");
                    $('.id_already').css("display", "none");
                } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                    $('.id_already').css("display","inline-block");
                    $('.id_ok').css("display", "none");
                    // $('#member_id').val('');
                }
            },
            error : function(xhr, status, error) {
                console.log("xhr! : " + xhr);
                console.log("status! : " + status);
                console.log("error! : " + error);
            }
        })

    }
    //이메일 중복체크
    function checkEmail() {
        event.preventDefault();
        event.stopPropagation();
        var email = $('#member_email').val().trim(); //id값이 "id"인 입력란의 값을 저장
        $.ajax({
            url: '/member/checkEmail', //Controller에서 요청 받을 주소
            type: 'post', //POST 방식으로 전달
            data: {member_email: email},
            dataType: 'text',
            success: function (cnt) { //컨트롤러에서 넘어온 cnt값을 받는다
                console.log(cnt);
                if (cnt == 0) { //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디
                    $('.email_ok').css("display", "inline-block");
                    $('.email_already').css("display", "none");
                } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                    $('.email_already').css("display", "inline-block");
                    $('.email_ok').css("display", "none");
                    // $('#member_id').val('');
                }
            },
            error: function (xhr, status, error) {
                console.log("xhr! : " + xhr);
                console.log("status! : " + status);
                console.log("error! : " + error);
            }
        })
    }


    //비밀번호 재확인
    let pwd = document.getElementById("member_pwd");
    let pwdChk = document.getElementById("check_pwd");
    let frm = document.getElementById("frmRegist");


    //비밀번호 유효성 체크
    function strongPassword (pwd) {
        return /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/.test(pwd);
    }

    //비밀번호 맞지 않을 시, 전화번호 형식 안맞을 시, 이름 형식 안맞을 시, 빈칸일 시 제출 못함

    let idCheck = true;
    let pwCheck = false;
    let pwReCheck = true;
    let nameCheck = true;
    let emailCheck = true;
    let addressCheck = true;
    let phoneCheck = true;


    document.getElementById("success-modal-btn").addEventListener("click", (e) => {
        let id = document.getElementById("member_id");
        let phone = document.getElementById("phone").value;
        let regPhone = /^01([0|1|6|7|8|9])-([0-9]{3,4})-([0-9]{4})$/;
        let name = document.querySelector("#member_name");
        let email = document.querySelector("#member_email");


        if (name.value.length < 1) {
            alert("이름을 입력해 주세요.");
            nameCheck = false;
        } else {
            nameCheck = true;
        }

        if (pwCheck === false) {
            if ( strongPassword(pwd.value) === false) {
                alert("비밀번호는 특수문자 포함 8자리 이상입니다.");
                pwCheck = false;
            } else {
                pwCheck = true;
            }
            if (pwd.value === pwdChk.value) {
                pwReCheck = true;
            } else {
                alert("비밀번호가 일치하지 않습니다.");
                pwReCheck = false;
            }
        }


        if (!regPhone.test(phone)) {
            alert("전화번호 형식에 맞춰주세요. ex)010-1234-5678");
            phoneCheck = false;
        } else {
            phoneCheck = true;
        }

        if (idCheck && pwCheck && pwReCheck && nameCheck && emailCheck && addressCheck && phoneCheck) {
            alert("회원가입 성공");
            frm.submit();
        }

        e.preventDefault();
    });


</script>
</body>

</html>
