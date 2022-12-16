<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>      
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Insert title here</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="/footsalhaja/src/main/resources/assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
	
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/css/styles.css" type="text/css" rel="stylesheet" />
	
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<!--현재 member테이블 의 컬럼들 ( userId, name, password, nickName, email, birthYY, birthMM, birthDD, activityArea, phone, personalGender, permission ) -->
<my:navbar active=""></my:navbar>

<section class="page-section" id="contact">
            <div class="container">
                <!-- Contact Section Heading-->
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">${member.userId}님의 회원정보</h2>
                <!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                
                <!-- Contact Section Form-->
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-xl-7">
					<c:url value="/mypage/modify" var="modifyLink">
						<c:param name="userId" value="${member.userId}" />
					</c:url>

					<form action="${modifyLink}" method="get" id="contactForm" data-sb-form-api-token="API_TOKEN" enctype="multipart/form-data">
							<%-- 프로필 이미지 출력 --%>
						<div style="text-align : center;">
							<c:forEach items="${member.profileImg }" var="name">
								<div class= >
								<object data="${pageContext.request.contextPath}/기본프로필.png" type="image/png">
								<div>"${pageContext.request.contextPath}/user_profile/${member.userId }/${name}"</div>
									<img src="${pageContext.request.contextPath}/user_profile/${member.userId }/${name}">
								</object>
								</div>
							</c:forEach>		
						</div>	
							
							<!-- ID -->
							<div class="form-floating mb-3">
								<input class="form-control" id="userId" type="text"
									name="userId" value="${member.userId}"
									data-sb-validations="required" readonly /> <label for="userId">ID</label>
							</div>

							<!-- 비밀번호 -->
							<div class="form-floating mb-3">
								<input class="form-control" id="password" type="password"
									name="password" value="${member.password}"
									data-sb-validations="required" readonly/> <label for="password">비밀번호</label>
							</div>

							<!-- 이름 -->
							<div class="form-floating mb-3">
								<input class="form-control" id="name" type="text" name="name"
									value="${member.name}" data-sb-validations="required" readonly />
								<label for="name">이름</label>
							</div>

							<!-- 성별 -->
							<div class="form-floating mb-3">
								<input class="form-control" id="personalGender" type="text"
									name="personalGender" value="${member.personalGender}"
									data-sb-validations="required" readonly /> <label
									for="personalGender">성별</label>
							</div>

							<!-- 닉네임 -->
							<div class="form-floating mb-3">
								<input class="form-control" id="nickName" type="text"
									name="nickName" value="${member.nickName}"
									data-sb-validations="required" readonly/> <label for="nickName">닉네임</label>
							</div>

							<!-- 이메일 -->
							<div class="form-floating mb-3">
								<input class="form-control" id="email" type="email" name="email"
									value="${member.email}" data-sb-validations="required,email" readonly/>
								<label for="email">메일주소</label>
							</div>

						<!-- 회원권한 -->
						<input type="hidden" name="auth" value="${member.auth}" readonly>
						<div class="form-floating mb-3">
							<c:if test="${member.auth.get(0) eq 'user'}">
								<input class="form-control" id="permission" type="text"
									name="permission" value="일반회원" data-sb-validations="required"
									readonly />
							</c:if>
							<c:if test="${member.auth.get(0) eq 'manager'}">
								<input class="form-control" id="permission" type="text"
									name="permission" value="매니저" data-sb-validations="required"
									readonly />
							</c:if>
							<c:if test="${member.auth.get(0) eq 'admin'}">
								<input class="form-control" id="permission" type="text"
									name="permission" value="관리자" data-sb-validations="required"
									readonly />
							</c:if>
							<label for="permission">회원권한</label>
						</div>
						<!-- 생년월일 -->
						<div class="form-floating mb-3">
							<c:if test="${member.birthMM < 10}">
								<c:set var="zeroMM" value="0" />
							</c:if>
							<c:if test="${member.birthDD < 10}">
								<c:set var="zeroDD" value="0" />
							</c:if>

							<input class="form-control" type="text" id="birthYYMMDD"
								name="birthYY"
								value="${member.birthYY}${zeroMM}${member.birthMM}${zeroDD}${member.birthDD}"
								readonly /> <label for="birthYYMMDD">생년월일</label>
						</div>

						<div class="form-floating mb-3">
								<input class="form-control" type="text" name="activityArea"
									value="${member.activityArea}" readonly /> <label
									for="activityArea">활동지역</label>
							</div>

							<div class="form-floating mb-3">
								<input class="form-control" id="phone" type="text" name="phone"
									value="${member.phone}" data-sb-validations="required" /readonly> <label
									for="phone">전화번호</label>
							</div>
							
							<input class="btn btn-primary btn-xl" id="submitButton" type="submit" value="회원정보수정">
						</form>
					</div>
                </div>
            </div>
       </section>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>



</body>
</html>