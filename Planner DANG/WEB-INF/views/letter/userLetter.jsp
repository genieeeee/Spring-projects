<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/mypage.css">
<style>
body * {
  box-sizing: border-box;
}

.table-users {
  border-radius: 10px;
  box-shadow: 3px 3px 0 rgba(0, 0, 0, 0.1);
  max-width: calc(100% - 2em);
  margin: 1em auto;
  overflow: hidden;
  width: 1600px;
}

table {
  width: 100%;
}
table td, table th {
  text-align: center;
  padding: 10px;
}
table td {
  text-align: center;
  vertical-align: middle;
}
table td:last-child {
  font-size: 0.95em;
  line-height: 1.4;
  text-align: left;
}
table th {
  font-weight: 300;
}
table tr:nth-child(2n) {
  background-color: white;
}
table tr:nth-child(2n+1) {
  background-color: #edf7f8;
}

</style>
<script type="text/javascript">
	function checkAll() {

		cb = document.userAllDel.check;
		if (cb.length) {
			for (var i = 0; i < cb.length; i++) {
				cb[i].checked = document.userAllDel.checking.checked;
			}
		} else {
			cb.checked = document.userAllDel.checking.checked;
		}

	}
	function content(letidx) {
		var popupX= (window.screen.width / 2) - (550/2);
	    var popupY= (window.screen.height / 2) - (300/2);
	    window.open('userLetterContent.pd?let_idx='+letidx, 'letterContent', 'width=550, height=280, left='+popupX+', top='+popupY+', screenX='+popupX+', screenY='+popupY);
	}
</script>
</head>
<body>
<div class="page-container">
	<div class="content">
		<div class="col-xs-9 col-sm-10 col-md-11" style="margin-left: 50px;">
			<div class="col-xs-6 col-xs-offset-3 visible-xs" ><%@include file="/WEB-INF/views/mypage/mobileMenu.jsp"%></div>
			<%@include file="/WEB-INF/views/mypage/topMenu.jsp" %>
			<div class="hidden-xs"><%@include file="/WEB-INF/views/mypage/sideMenu.jsp"%></div>			
			<div class="col-xs-11 col-sm-11 portfolioContainer">
				<form name="userAllDel" action="userAllDel.pd" method="post">
					<div class="table-users">
						<table>
							<tr>
								<th width="100px"><input type="checkbox" name="checking" onclick="checkAll()"></th>
								<th width="150px">글번호</th>
								<th width="200px">보낸 사람</th>
								<th>제목</th>
								<th width="150px">날짜</th>
							</tr>
							<c:if test="${empty letter}">
							</c:if>
							<c:forEach var="dto" items="${letter }" begin="0">
								<tr>
									<td><input type="checkbox" name="check"
										value="${dto.let_idx }"></td>
									<td>${dto.let_idx }</td>
									<td>admin</td>
									<td><a href="javascript:content('${dto.let_idx }')">${dto.let_subject}</a></td>
									<td>${dto.let_writedate }</td>
								</tr>
							</c:forEach>
							<tr style="border-top: 1px solid darkblue;">
								<td colspan="4" align="center">${page }</td>
								<td><input type="submit" value="삭제"></td>
							</tr>
						</table>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="../header.jsp"%>
</div>
</body>
</html>




