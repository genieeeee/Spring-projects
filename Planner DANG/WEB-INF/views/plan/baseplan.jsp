<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container">
	<div id="plandiv0" class="row">
		<div class="col-xs-12">
			<p style="text-align:center;">전체 예시 일정</p>
		</div>
	</div><!-- 0번째 row -->
	
	<div id="naradiv0" class="row" >
		   <div class="col-xs-12">
		   	<table style="border:2px solid #e1e1e1;">
		   		<thead>
		   		<tr>
		   			<th><img src="/pd/img/plan/gukgi/영국.PNG"><span><input type="text" name="scheitem[0].areaname" value="영국" id="naraName0" style='border:none'></span></th>
		   			
		   		</tr>
		   		</thead>
		   		
		   		<tbody>
		   		<tr>
		   			<td><span>머물날짜</span></td>
		   		</tr>
		   		<tr>
		   			<td>
		   				<input type="text" name="scheitem[0].sch_startdate" id="baseNaraStart" style="width:129px;border:none;" readonly="readonly">
		       			<input type="text" name="scheitem[0].sch_startday" id="baseNaraStartDay" style="border:none;" readonly="readonly">
		       			<input type="text" name="scheitem[0].sch_enddate" id="baseNaraEnd" style="width:129px;border:none;" readonly="readonly">
		       			<input type="text" name="scheitem[0].sch_endday" id="baseNaraEndDay" style="border:none;" readonly="readonly">
		       			<!--영국 hidden값 -->
						<input type="hidden" name="scheitem[0].event_id" value="1">
						<input type="hidden" name="scheitem[0].sch_section" value="1">
						<input type="hidden" name="scheitem[0].fil_code" value="10">
				        <input type="hidden" name="scheitem[0].lat" value="30.4">
				        <input type="hidden" name="scheitem[0].lng" value="30.48">
		   			</td>
		   		</tr>
		   		</tbody>
		   		
		   		<tfoot>
		   		<tr>
					<td>
							<div id="areadiv0" class="row" style="padding:7px;">
								<div class="col-xs-12">
									<table style="border:2px dashed #e1e1e1;">
										<thead>
											<tr>
												<td><span><input type="text" name="scheitem[1].areaname" value="런던" style="border:none" id="naraName0"></span></td>
											</tr>
										</thead>

										<tbody>
											<tr>
												<td><span>머물날짜</span></td>
											</tr>
											<tr>
												<td>
													<input type="text" name="scheitem[1].sch_startdate" id="baseAreaStart" style="width: 129px; border: none;" readonly="readonly"> 
													<input type="text" name="scheitem[1].sch_startday" id="baseAreaStartDay" style="border: none;" readonly="readonly">
													<input type="text" name="scheitem[1].sch_enddate"id="baseAreaEnd" style="width: 129px; border: none;"readonly="readonly"> 
													<input type="text" name="scheitem[1].sch_endday" id="baseAreaEndDay" style="border: none;" readonly="readonly">
													<!-- 런던 hidden 값 -->
													<input type="hidden" name="scheitem[1].event_id"value="2"> 
													<input type="hidden" name="scheitem[1].sch_section" value="1"> 
													<input type="hidden" name="scheitem[1].fil_code" value="20">
													<input type="hidden" name="scheitem[1].lat" value="31.4">
													<input type="hidden" name="scheitem[1].lng" value="31.48">
												</td>
											</tr>
											<tr>
												<td><span>명소</span></td>
											</tr>
											<tr>
												<td>
													<div id="planDiv_tourist">
														<input type="text" name="scheitem[2].areaname" value="런던아이" readonly style="border:none" size="5px">
														<!-- 런던아이 hidden -->
														<input type="hidden" name="scheitem[2].event_id" value="3"> 
														<input type="hidden" name="scheitem[2].sch_section" value="1"> 
														<input type="hidden" name="scheitem[2].fil_code" value="30">
														<input type="hidden" name="scheitem[2].sch_startdate" id="baseTouristStart"> 
														<input type="hidden" name="scheitem[2].sch_startday" id="baseTouristStartDay">
														<input type="hidden" name="scheitem[2].sch_enddate" id="baseTouristEnd"> 
														<input type="hidden" name="scheitem[2].sch_endday" id="baseTouristEndDay">
														<input type="hidden" name="scheitem[2].lat" value="32.4">
														<input type="hidden" name="scheitem[2].lng" value="32.48">
													</div>
												</td>
											</tr>
											<tr>
												<td><span>맛집</span></td>
											</tr>
											<tr>
												<td>
													<div id="planDiv_food">
														<input type="text" name="scheitem[3].areaname" value="바이런" readonly style="border: none" size="5px">
														<!-- 맛집 hidden  -->
														<input type="hidden" name="scheitem[3].event_id" value="4"> 
														<input type="hidden" name="scheitem[3].sch_section" value="1"> 
														<input type="hidden" name="scheitem[3].fil_code" value="40">
														<input type="hidden" name="scheitem[3].sch_startdate" id="baseFoodStart"> 
														<input type="hidden" name="scheitem[3].sch_startday" id="baseFoodStartDay">
														<input type="hidden" name="scheitem[3].sch_enddate" id="baseFoodEnd"> 
														<input type="hidden" name="scheitem[3].sch_endday" id="baseFoodEndDay">
														<input type="hidden" name="scheitem[3].lat" value="32.4">
														<input type="hidden" name="scheitem[3].lng" value="32.48">
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div> <!-- 2ROW -->
						</td>
				</tr>
		   		</tfoot>
		   	</table>	
		 </div>
	</div><!-- 1번째 row -->
</div>	
