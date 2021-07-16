<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<div class="row" style="margin:auto;">
	<div class="col-xs-12">
		<div class="esconde" id="opdRetro">
			<table class="table table-striped table-hover ">
				<thead>
					<tr style="text-color:#3cb5f9;">
						<th>여행지</th>
						<th>지역명</th>
						<th>나라명</th>
						<th>시작날</th>
						<th>마지막날</th>
						
					</tr>
				</thead>
				<c:forEach var="getlist" items="${getlist}">
					<tbody>
						<tr>
							<td>#${getlist.cald_place}</td>
							<td>${getlist.cald_area}</td>
							<td>${getlist.cald_nara}</td>
							<c:set var="sd" value="${getlist.cald_startdate }" />
							<td>${fn:substring(sd,0,11)} ${getlist.cald_startday}</td>
							<c:set var="ed" value="${getlist.cald_enddate }" />
							<td>${fn:substring(ed,0,11)} ${getlist.cald_endday}</td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</div>
	</div>
</div>