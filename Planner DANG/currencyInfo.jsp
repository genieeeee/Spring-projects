<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.2.1.js"
  integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
  crossorigin="anonymous">
</script>
<script>
$.ajax({
    url: 'http://apilayer.net/api/live?access_key=0746f9cc59bb7a0d2103b6632df3dd9e&amount=10',   
    dataType: 'jsonp',
    success: function(json) {       //USD->KRW
        document.all.currency.value=json.quotes.GBPKRW;
    }
});
</script>
</head>
<body>
1달러->원화 <input type="text" name="currency">
</body>
</html>