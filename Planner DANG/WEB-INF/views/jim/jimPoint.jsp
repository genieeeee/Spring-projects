<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>담은 명소 목록</title>

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
           		<div class="panel-heading">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab1default" data-toggle="tab">명소</a></li>
                        <li><a href="#tab2default" data-toggle="tab">레스토랑</a></li>
                    </ul>
                </div><!-- #PANEL HEADING -->
                <div class="panel-body" style="overflow-y: auto;">
                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="tab1default">
                        	<c:if test="${empty jimPList}">
								
							</c:if>
							<c:forEach items="${jimPList}" var="point">
	                        	<div class="box">          	
									<div class="offer offer-radius offer-danger" align="center">
									<a href="jimpDel.pd?jim_pidx=${point.jim_pidx }&page=2">
										<div class="shape">
											<div class="shape-text">
												X							
											</div>
										</div>
										</a>	
										<div class="offer-content" id="boxContent" ><br>
												<h3 class="lead" >
														<table style="margin: 0px auto;">
															<tr>
																<td text-align="center" rowspan="6" width="200px">
																	<img src="${point.jim_img}" style="width:200px ;height:150px;margin-right: 30px;">
																</td>
															</tr>
															<tr>
																<td colspan="3"><h3>${point.jim_placename }</h3></td>
															</tr>
															<tr>
																<td>주소</td>
																<td colspan="2">${point.jim_addr }</td>
															</tr>
															<tr>
																<td>평가점수</td>
																<td colspan="2">${point.jim_score }</td>
															</tr>
														</table>
												</h3>
											</div>
									</div>
								</div><!-- BOX -->
							</c:forEach>
                    </div><!-- #default1 :: 예약대기 -->
                    <div class="tab-pane fade" id="tab2default">
							<c:forEach  items="${jimPList2}" var="res">
	                        	<div class="box">          	
									<div class="offer offer-radius offer-danger" >
									<a href="jimpDel.pd?jim_pidx=${res.jim_pidx }&page=3">
										<div class="shape">
											<div class="shape-text">
												X							
											</div>
										</div>
										</a>	
										<div class="offer-content" id="boxContent" ><br>
												<h3 class="lead" >
														<table style="margin: 0px auto;">
															<tr>
																<td text-align="center" rowspan="6" width="200px">
																	<img src="${res.jim_img}" style="width:200px ;height:150px ;margin-right: 30px;">
																</td>
															</tr>
															<tr>
																<td colspan="3"><h3>${res.jim_placename }</h3></td>
															</tr>
															<tr>
																<td>주소</td>
																<td colspan="2">${res.jim_addr }</td>
															</tr>
															<tr>
																<td>전화번호</td>
																<td colspan="2">${res.jim_call }</td>
															</tr>
															<tr>
																<td>평가점수</td>
																<td colspan="2">${res.jim_score }</td>
															</tr>
															<tr>
																<td>가격</td>
																<td colspan="2">${res.jim_price }$</td>
															</tr>
														</table>
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
</html>