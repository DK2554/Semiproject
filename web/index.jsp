<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%session.removeAttribute("item"); %>

<script defer src="<%=request.getContextPath()%>/js/event.js"></script>
<section id="">
	<div id="mainimage">
		<div class="slideshow-container">
			<div class="mySlides fade">
	<a href="">
				<img src="<%=request.getContextPath()%>/image/main/main1.jpg"
					style="width: 100%" height="600px"/></a>

			</div>
			<div class="mySlides fade">
				<a href="<%=request.getContextPath()%>/seatMove"><img src="<%=request.getContextPath()%>/image/main/main2.jpg"
					style="width: 100%" height="600px"/></a>

			</div>
			<div class="mySlides fade">
			<a href="<%=request.getContextPath()%>/wording/wordingList">
				<img src="<%=request.getContextPath()%>/image/main/main3.jpg"
					style="width: 100%" height="600px"/>
					</a>

			</div>
			<div style="text-align: center">
				<span class="dot"></span> <span class="dot"></span> <span
					class="dot"></span>
			</div>
		</div>
		<br />
		<style>
* {
	box-sizing: border-box;
}

.mySlides {
	display: none;
}

img {
	vertical-align: middle;
}

/* Slideshow container */
.slideshow-container {
	max-width: auto;
	position: relative;
	margin: auto;
	margin-top: 50px;
}

/* Caption text */
.text {
	color: #000000;
	font-size: 15px;
	padding: 8px 12px;
	position: absolute;
	bottom: 8px;
	width: 100%;
	text-align: center;
}




/* The dots/bullets/indicators */
.dot {
	height: 8px;
	width: 8px;
	margin: 0 5px;
	background-color: #bbb;
	border-radius: 50%;
	display: inline-block;
	transition: background-color 0.6s ease;
}

.active {
	background-color: #717171;
}

/* Fading animation */
.fade {
	-webkit-animation-name: fade;
	-webkit-animation-duration: 2.5s;
	animation-name: fade;
	animation-duration: 2.5s;
}

@
-webkit-keyframes fade {from { opacity:0.4;
	
}

to {
	opacity: 1;
}

}
@
keyframes fade {from { opacity:0.4;
	
}

to {
	opacity: 1;
}
}
</style>
	</div>
	<!--깃허브 브런치 테스트  -->
	<style>

	</style>
	<div class="slides_wrapper">
		<ul class="slides">
			<li><a href="<%=request.getContextPath()%>/product/productDetail?no=100"><img src="<%=request.getContextPath()%>/image/best/best1.JPG" alt=""></a></li>
			<li><a href="<%=request.getContextPath()%>/product/productDetail?no=114"><img src="<%=request.getContextPath()%>/image/best/best2.JPG" alt=""></a></li>
			<li><a href="<%=request.getContextPath()%>/product/productDetail?no=129"><img src="<%=request.getContextPath()%>/image/best/best3.JPG" alt=""></a></li>
			<li><a href="<%=request.getContextPath()%>/product/productDetail?no=126"><img src="<%=request.getContextPath()%>/image/best/best4.JPG" alt=""></a></li>
			<li><a href="<%=request.getContextPath()%>/product/productDetail?no=136"><img src="<%=request.getContextPath()%>/image/best/best5.JPG" alt=""></a></li>
					<li><img  alt=""></li>
		</ul>
	</div>
	<p class="controls">
		<button class="prev cbtn" onclick="perBtn()">&lt</button>
		<button class="next cbtn" onclick="nextBtn1()">&gt</button>
	</p>
	<article id="section_text">
		<div class="slide">
			<ul>
				<li><img  align="middle"width=1280px src="<%=request.getContextPath()%>/image/live/live1.JPG"></li>
				<li><img  align="middle" width=1280px src="<%=request.getContextPath()%>/image/live/live2.JPG"></li>
				<li><img   align="middle"width=1280px src="<%=request.getContextPath()%>/image/live/live3.JPG"></li>
				<li><img  align="middle" width=1280px src="<%=request.getContextPath()%>/image/live/live4.JPG"></li>
				<li><img  align="middle" width=1280px src="<%=request.getContextPath()%>/image/live/live5.JPG"></li>			
			</ul>
		</div>
	</article>
</section>
<script>
	var slides = document.querySelector(".slides");
	var slide = document.querySelectorAll(".slides li");
	var currentIdx = 0;
	var slideWidth = 300;
	var slideMargin = 30;
	var slideCount = slide.length;
	var prevBtn = document.querySelector(".prev");
	var nextBtn = document.querySelector(".next");
	slides.style.width = (slideWidth + slideMargin) * slideCount - slideMargin
			+ "px";
	function moveSlide(num) {
		slides.style.left = -num * 300 + "px";
		currentIdx = num;
	}
	function perBtn() {
		if (currentIdx > 0) {
			moveSlide(currentIdx - 1);
		} else {
			moveSlide(slideCount - 3);
		}
	};
	function nextBtn1() {
		if (currentIdx < slideCount - 3) {
			moveSlide(currentIdx + 1);
		} else {
			moveSlide(0);
		}
	};
	var slideIndex = 0;
	showSlides();

	function showSlides() {
		var i;
		var slides2 = document.getElementsByClassName("mySlides");
		var dots = document.getElementsByClassName("dot");
		for (i = 0; i < slides2.length; i++) {
			slides2[i].style.display = "none";
		}
		slideIndex++;
		if (slideIndex > slides2.length) {
			slideIndex = 1;
		}
		for (i = 0; i < dots.length; i++) {
			dots[i].className = dots[i].className.replace(" active", "");
		}
		slides2[slideIndex - 1].style.display = "block";
		dots[slideIndex - 1].className += " active";
		setTimeout(showSlides, 5000); //
	}
</script>

<%@ include file="/views/common/footer.jsp"%>