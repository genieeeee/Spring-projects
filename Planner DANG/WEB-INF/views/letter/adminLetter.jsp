<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
body * {
  box-sizing: border-box;
}

.table-users {
  border: 1px solid #327a81;
  border-radius: 10px;
  box-shadow: 3px 3px 0 rgba(0, 0, 0, 0.1);
  max-width: calc(100% - 2em);
  margin: 1em auto;
  overflow: hidden;
  width: 1200px;
}

table {
  width: 100%;
}
table td, table th {
  text-align: center;
  color: #2b686e;
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
  background-color: #66CCFF;
  font-weight: 300;
}
table tr:nth-child(2n) {
  background-color: white;
}
table tr:nth-child(2n+1) {
  background-color: #edf7f8;
}

</style>
<script>
function content(letidx) {
	var popupX= (window.screen.width / 2) - (550/2);
    var popupY= (window.screen.height / 2) - (300/2);
    window.open('adminLetterContent.pd?let_idx='+letidx, 'content', 'width=550, height=280, left='+popupX+', top='+popupY+', screenX='+popupX+', screenY='+popupY);
}
function write() {
	var popupX= (window.screen.width / 2) - (550/2);
    var popupY= (window.screen.height / 2) - (300/2);
    window.open('adminLetterWrite.pd', 'write', 'width=700, height=450, left='+popupX+', top='+popupY+', screenX='+popupX+', screenY='+popupY);
}
function writeAll() {
	var popupX= (window.screen.width / 2) - (550/2);
    var popupY= (window.screen.height / 2) - (300/2);
    window.open('adminLetterWriteAll.pd', 'writeAll', 'width=700, height=450, left='+popupX+', top='+popupY+', screenX='+popupX+', screenY='+popupY);
}
</script>
<body>
<%@ include file="../pdmm/header.jsp" %>
<section>
	<article>
		<div class="container-fluid" style="margin-top:50px">
			<div class="panel panel-default">
				<%@ include file="../pdmm/member/memberHeader.jsp" %>
			    <div class="panel-body">
			    	<div class="container-fluid">
						<div style="text-align: center;">
							<form name="adminLetter" action="userSearch.pd">
								<input type="text" name="mem_id" placeholder="회원 ID">
								<input type="submit" value="검색"> <a href="adminLetter.pd">
								<input type="button" value="전체보기"></a>
							</form>
						</div>
							<div class="table-users">
								<table>
									<thead>
										<tr>
											<th width="150px">글번호</th>
											<th width="200px">User ID</th>
											<th>제목</th>
											<th width="200px">날짜</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${empty letter}">
											<tr>
												<td colspan="4">등록된 글이 없습니다.</td>
											</tr>
										</c:if>
										<c:forEach var="dto" items="${letter}">
											<tr>
												<td>${dto.let_idx}</td>
												<td>${dto.mem_id}</td>
												<td><a href="javascript:content('${dto.let_idx}')">${dto.let_subject}</a></td>
												<td>${dto.let_writedate}</td>
											</tr>
										</c:forEach>
									</tbody>
									<tfoot>
										<tr>
											<td colspan="3" align="center">${page}</td>
											<td align="center">
												<a href="javascript:write()"><input type="button" value="쪽지쓰기"></a>
												<a href="javascript:writeAll()"><input type="button" value="전체보내기"></a>
											</td>
										</tr>
									</tfoot>
								</table>
							</div>
						</div>
			    	</div>
			    <div class="panel-footer"></div>
		  	</div>
		</div>
	</article>
</section>
</body>
</html>