<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Modal View Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.13.1/jquery.validate.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.payment/1.2.3/jquery.payment.min.js"></script>

<style>
body { margin-top:20px; }

/* CSS for Credit Card Payment form */
.credit-card-box .panel-title {
    display: inline;
    font-weight: bold;
}
.credit-card-box .form-control.error {
    border-color: red;
    outline: 0;
    box-shadow: inset 0 1px 1px rgba(0,0,0,0.075),0 0 8px rgba(255,0,0,0.6);
}
.credit-card-box label.error {
  font-weight: bold;
  color: red;
  padding: 2px 8px;
  margin-top: 2px;
}
.credit-card-box .payment-errors {
  font-weight: bold;
  color: red;
  padding: 2px 8px;
  margin-top: 2px;
}
.credit-card-box label {
    display: block;
}
/* The old "center div vertically" hack */
.credit-card-box .display-table {
    display: table;
}
.credit-card-box .display-tr {
    display: table-row;
}
.credit-card-box .display-td {
    display: table-cell;
    vertical-align: middle;
    width: 50%;
}
/* Just looks nicer */
.credit-card-box .panel-heading img {
    min-width: 180px;
}
</style>
<script>
function cardSelect(name){
	var c = document.getElementById('cards');
	var ctype = document.cardPayForm.air_cardType;
	ctype.value =name;
	c.innerHTML = name;
	card();
}

/**카드 유효성 검사*/
function card(){
	var ctype = document.cardPayForm.air_cardType;
	var cVal = document.getElementById('cardSelVal');
	if(ctype.value==''){
		cVal.style.display='';
	}else{
		cVal.style.display='none';
	}
}

function goPay(){
	card();
	document.cardPayForm.action='airPayForm.pd';
	document.cardPayForm.method='post';
	document.cardPayForm.submit();
}
</script>
</head>
<body>
<div class="container">
    <div class="row">
        <!-- You can make it whatever width you want. I'm making it full width
             on <= small devices and 4/12 page width on >= medium devices -->
        <div class="col-xs-12 col-md-4">  
            <!-- CREDIT CARD FORM STARTS HERE -->
            <div class="panel panel-default credit-card-box">
            <form name="cardPayForm" method="post" action="javascript:goPay()">
            <input type="hidden" name="air_bookNum" value="${payNum }">
               	<h3>항공권 결제</h3>
               	<hr>
               	<div class="col-xs-12"><label id="cardSelVal" style="display: none">카드를 선택해주세요 </label></div>
                <div class="col-xs-12" >                       
                    <a href="javascript:cardSelect('VISA')"><img class="img-responsive pull-left"  src="/pd/img//air/card/visaCard.png"></a>
                    <a href="javascript:cardSelect('MASTER')"><img class="img-responsive pull-left" id="card" src="/pd/img//air/card/masterCard.png"></a>
                    <a href="javascript:cardSelect('DISCOVER')"><img class="img-responsive pull-left" id="card" src="/pd/img//air/card/discoverCard.png"></a>
                    <a href="javascript:cardSelect('AMERICAEXPRESS')"><img class="img-responsive pull-left" id="card" src="/pd/img/air/card/americaexpressCard.png"></a>
                    <br><br>
                    <span id="cards"></span><input type="hidden" name="air_cardType">
                </div>     
                <div class="panel-body"> 
                   <div class="row">
                      <div class="col-xs-12">
                        <div class="form-group">
                            <label for="cardNumber">CARD NUMBER</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="air_cardNum" placeholder="Valid Card Number" required autofocus />
                                        <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                                    </div>
                                </div>                            
                            </div>
                   </div>
                <div class="row">
                            <div class="col-xs-7 col-md-7">
                                <div class="form-group">
                                    <label for="cardExpiry"><span class="hidden-xs">EXPIRATION</span><span class="visible-xs-inline">EXP</span> DATE</label>
                                    <input type="text" class="form-control" name="air_cardDate" placeholder="MM / YY" required autofocus />
                                </div>
                            </div>
                            <div class="col-xs-5 col-md-5">
                                <div class="form-group">
                                    <label for="cardCVC">CV CODE</label>
                                    <input type="tel" class="form-control" name="air_cardCCv" placeholder="CVC" required/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                        	<div>
							이 구매를 완료함으로써, 고객님께서는 <a href="javascript:void(0)" data-toggle="modal" data-target="#myModal">항공사의 운임 방침</a>에 동의하며 이 예약의 전체비용을 걸제할 것을 약속합니다.<br>
							</div>
                            <div class="col-xs-12">
                                <button class="subscribe btn btn-success btn-lg btn-block" type="submit">결제</button>
                            </div>
                        </div>
                </div><!-- panel body -->
            </form>
            </div>   
        </div>
     </div>           
</div>
<!-- Modal View :: 항공사의 운임 규칙 -->
<section>
<div class="container">	  
<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
	  <div class="modal-dialog">
	  <!-- Modal content-->
	    <div class="modal-content">
	    	<div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          	항공사의 운임 규칙   
	        </div>
	     	<div class="modal-body">
	         <img alt="airPolicy01" src="/pd/img/air/airPolicy/airPolicy1.PNG" style="width:100%; align:center;"><br>
	         <img alt="airPolicy02" src="/pd/img/air/airPolicy/airPolicy2.PNG" style="width:100%; align:center;"><br>
	         <img alt="airPolicy03" src="/pd/img/air/airPolicy/airPolicy3.PNG" style="width:100%; align:center;"><br>
	         <img alt="airPolicy04" src="/pd/img/air/airPolicy/airPolicy4.PNG" style="width:100%; align:center;"><br>
	        </div>
	        <div class="modal-footer">
	        <label id="air_price"></label>
	          <button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
	        </div>
	    </div>
	  	</div>
	 </div>  
</div>
</section>
 </body>
</html>