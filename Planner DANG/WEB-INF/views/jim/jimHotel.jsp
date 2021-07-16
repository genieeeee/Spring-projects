<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>담은 호텔 목록</title>
<link rel="stylesheet" type="text/css" href="css/airMypage.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<div class="page-container wrapper">
<div class="content-main">
	<div class="col-xs-9 col-sm-10 col-md-11" style="margin-left: 50px;">
		<div class="col-xs-6 col-xs-offset-3 visible-xs" ><%@include file="/WEB-INF/views/mypage/mobileMenu.jsp"%></div>
			<%@include file="/WEB-INF/views/mypage/topMenu.jsp" %>
		<div class="hidden-xs"><%@include file="/WEB-INF/views/mypage/sideMenu.jsp"%></div>
		<div class="col-xs-11 col-sm-11 portfolioContainer">
           <div class="panel with-nav-tabs panel-default">
                <div class="panel-body" style="overflow-y: auto;">
                    <div class="tab-content">
                        <div class="tab-pane fade in active">
                       	 	<c:if test="${empty jimPList}">
							</c:if>
							<c:forEach  items="${jimPList}" var="hotel">
	                        	<div class="box">          	
									<div class="offer offer-radius offer-danger" >
									<a href="jimpDel.pd?jim_pidx=${hotel.jim_pidx }&page=1">
										<div class="shape">
											<div class="shape-text">
												X							
											</div>
										</div>
										</a>	
										<div class="offer-content" id="boxContent" ><br>
												<h3 class="lead" >
													<form name="yeyakDel" action="yeyak.pd">
														<table style="margin: 0px auto;">
															<tr>
																<td rowspan="6" width="200px">
																	<img src="${hotel.jim_img}" style="width:150px ;height:200px ;margin-right: 30px;">
																</td>
															</tr>
															<tr>
																<td colspan="3"><h3>${hotel.jim_placename }</h3></td>
															</tr>
															<tr>
																<td>호텔주소</td>
																<td colspan="2">${hotel.jim_addr }</td>
															</tr>
															<tr>
																<td>평가점수</td>
																<td colspan="2">${hotel.jim_score }</td>
															</tr>
															<tr>
																<td>호텔가격</td>
																<td colspan="2">${hotel.jim_price }$</td>
															</tr>
															<tr>				
																<td colspan="3" style="text-align:right;">
																	<input type="hidden" name="hot_lat" value="${hotel.jim_latitude}">
																	<input type="hidden" name="hot_lng" value="${hotel.jim_longitude}">
																	<input type="hidden" name="hot_photo" value="${hotel.jim_img }">
																	<input type="hidden" name="hot_name" value="${hotel.jim_placename }">
																	<input type="hidden" name="hot_address" value="${hotel.jim_addr }">
																	<input type="hidden" name="hot_rating" value="${hotel.jim_score }">
																	<input type="hidden" name="ye_price" value="${hotel.jim_price }">
																	<input type="submit" value="예약">					
																</td>
															</tr>
														</table>
													</form>
												</h3>
											</div>
									</div>
								</div><!-- BOX -->
							</c:forEach>
                    </div><!-- #default1 :: 예약대기 -->
                   </div><!-- #PANEL content -->
                </div><!-- #PANEL BODY -->
            </div><!-- #NAV PANDEL -->
        </div><!--  -->
</div><!-- .content -->
</div>
	<%@include file="/WEB-INF/views/header.jsp" %>
</div><!-- page-Container -->
</body>
</html>