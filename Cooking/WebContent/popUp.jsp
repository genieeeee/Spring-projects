<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팝업창</title>
<link rel="shortcut icon" type="imge/x-icon" href="/project/img/index/메인아이콘.PNG">

<link rel="stylesheet" type="text/css" href="css/popup.css">
</head>

<body>
		<form name="popform" action="popUp_ok.jsp" >		
			<table  cellspacing="0">
				<tbody>
					<tr>
						<th id="pop_td1" colspan="3">시스템 점검 </th>
					<tr>
					
					<tr>
						<td id="temp_td">&nbsp;</td>
						<th id="pop_td2" >
							<h4>매주(일요일)</h4>
							<h3>00시 30분 ~ 01시 30분</h3>
						</th>
						<td id="temp_td">&nbsp;</td>
					</tr>
					<tr>
						<td id="temp_td2">&nbsp;</td>
						<td id="pop_td3">
						서비스 업그레이드 작업으로 인하여<br>
						<b id="point">매주(일요일) 00시 30분 ~ 01시 30분(1시간)</b><br>
						사이트 접속이 불가능하며,그 이후 시간에는 간헐적으로 사이트 접속이 불안정 할 수 도 있습니다.
						</td>
						<td id="temp_td2">&nbsp;</td>
					</tr>
					<tr>
						<td id="pop_td4" colspan="3">
							이용에 불편을 드려 죄송합니다.<br>
							더욱 안정화된 시스템으로 찾아뵙겠습니다.
						
						</td>
					</tr>

				</tbody>
				<tfoot>
					<tr >
						<td id="pop_td5" colspan="2">
							<input type="checkbox" name="popUp_cb" value="on" >오늘 하루 안보기
						</td>
						
						<td id="pop_td6">	
							<input type="submit" value="x" >
						</td>
					</tr>
				</tfoot>
			</table>
		</form>	
</body>
</html>