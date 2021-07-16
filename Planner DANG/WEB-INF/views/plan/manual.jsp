<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.carousel-fade .carousel-inner .item {

  opacity: 0;
  transition-property: opacity;
    overflow:hidden;
}
.item.active img {
    transition: transform 300ms linear 0s;
    /* This should be based on your carousel setting. For bs, it should be 5second*/
    /* transform: scale(2.05, 2.05); */
}
.carousel-fade .carousel-inner .active {
  opacity: 1;
}

.carousel-fade .carousel-inner .active.left,
.carousel-fade .carousel-inner .active.right {
  left: 0;
  opacity: 0;
  z-index: 1;
}

.carousel-fade .carousel-inner .next.left,
.carousel-fade .carousel-inner .prev.right {
  opacity: 1;
}

.carousel-fade .carousel-control {
  z-index: 2;
}

/*
WHAT IS NEW IN 3.3: "Added transforms to improve carousel performance in modern browsers."
now override the 3.3 new styles for modern browsers & apply opacity
*/
@media all and (transform-3d), (-webkit-transform-3d) {
    .carousel-fade .carousel-inner > .item.next,
    .carousel-fade .carousel-inner > .item.active.right {
      opacity: 0;
      -webkit-transform: translate3d(0, 0, 0);
              transform: translate3d(0, 0, 0);
    }
    .carousel-fade .carousel-inner > .item.prev,
    .carousel-fade .carousel-inner > .item.active.left {
      opacity: 0;
      -webkit-transform: translate3d(0, 0, 0);
              transform: translate3d(0, 0, 0);
    }
    .carousel-fade .carousel-inner > .item.next.left,
    .carousel-fade .carousel-inner > .item.prev.right,
    .carousel-fade .carousel-inner > .item.active {
      opacity: 1;
      -webkit-transform: translate3d(0, 0, 0);
              transform: translate3d(0, 0, 0);
    }
} 

</style>
<div id="manualform" style="text-align:center;  padding:10px;">
	<b style="text-color:#337ab7;">사용 메뉴얼</b><br><br><br>
	<div id="carousel" class="carousel slide carousel-fade" data-ride="carousel">
	    <ol class="carousel-indicators">
	        <li data-target="#carousel" data-slide-to="0" class="active"></li>
	        <li data-target="#carousel" data-slide-to="1"></li>
	        <li data-target="#carousel" data-slide-to="2"></li>
	    </ol>
	    <!-- Carousel items -->
	    <div class="carousel-inner carousel-zoom">
	        <div class="active item"><img class="img-responsive" src="img/plan/기본사용메뉴얼.PNG"style="height: 250px;">
	          <div class="carousel-caption">

	          </div>
	        </div>
	        <div class="item"><img class="img-responsive" src="img/plan/기본사용메뉴얼.PNG"style="height: 250px;">
	          <div class="carousel-caption">

	          </div>
	        </div>
	        <div class="item"><img class="img-responsive" src="img/plan/기본사용메뉴얼.PNG"style="height: 250px;">
	          <div class="carousel-caption">

	          </div>
	        </div>
	       </div>
	    <!-- Carousel nav -->
	    <a class="carousel-control left" href="#carousel" data-slide="prev"> < </a>
	    <a class="carousel-control right" href="#carousel" data-slide="next">></a>
	</div>
	<input type="button" id="planstart" value="플래너 시작 " class="btn btn-danger" onclick="planStart()" style="width:275px;background-color:#337ab7;border-color:#337ab7;">
</div>
