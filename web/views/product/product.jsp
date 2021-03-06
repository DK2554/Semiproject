<%@page import="oracle.net.aso.l"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List,com.semi.product.model.vo.Books"%>
<%
	List<Books> book = (List) request.getAttribute("list");
	String type = request.getParameter("searchType");
	String keyword = request.getParameter("searchkey");
	String numPerPage = request.getParameter("numPerPage");
	String item=(String)session.getAttribute("item");
	System.out.print(item);
%>
<%@ include file="/views/common/header.jsp"%>
<%
	if (logginedMember == null) {
		request.setAttribute("msg", "로그인이 이후 사용가능합니다");
		request.setAttribute("loc", "/");
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}
%>


<style>
div>.product_list {
	display: flex;
	justify-content: space-around;
	flex-flow: wrap;
	width: 960px;
	margin: 0 auto;
	height: 100%;
	align-content: space-around;
}

#numPerpage-container {
	margin: 0 auto;
	width: 960px;
	margin-bottom: 20px;
	display: flex;
	justify-content: flex-end;
}
input[type='radio']{

display:none;
margin:10px;
}

#push {
	height: 100px;
}

.product_list>li {
	align-items: center;
}

hr {
	margin-bottom: 25px;
	margin-top: 25px
}

.content {
	overflow: scroll;
}

<%if(item!=null){%>

 <%if(item.equals("all")){%>
.all{
background-color:#6ec6ff;
}
<%}else if(item.equals("social")){%> 
.Social{
background-color:#6ec6ff;
}		
<%}else if(item.equals("science")){%> 
.Science{
background-color:#6ec6ff;
}		
<%}else if(item.equals("it")){%> 
.it{
background-color:#6ec6ff;
}		
<%}else if(item.equals("literature")){%> 
.literature{
background-color:#6ec6ff;
}		
<%}else if(item.equals("development")){%> 
.Self-development{
background-color:#6ec6ff;
}		
<%}
 }%>



.product_list li {
	position: relative;
	width: 200px;
	height: 350px;
	border: 1px solid #d9d9d9;
	margin-bottom: 50px;
}

.product_list li:hover {
	border-color: black;
}

.product_list dl {
	padding: 150px 0 0 0;
}

.product_list dt {
	border-top: 1px solid #f0f0f0;
	padding: 11px 10px 14px;
}

.product_list a {
	font-size: 16px;
	color: #1a1a1a;
}

a {
	text-decoration: none;
}

.product_list .img {
	position: absolute;
	left: 0;
	top: 0;
}

.product_list .price {
	position: absolute;
	font-size: 21px;
	bottom: 80px;
	left: 90px;
	font-weight: bold;
	padding: 0 0 0 10px;
	color: #f06292;
}

.maincategory {
	display: flex;
	justify-content: space-around;
	margin: 0 auto;
	width: 960px;
	margin-top: 30px;
}

.product_list .author {
	position: absolute;
	font-size: 11px;
	left: 80px;
	bottom: 60px;
	color: #1a1a1a;
	font-weight: bold;
	padding: 0 0 0 10px;
}

.product_list .btm {
	position: absolute;
	left: 0px;
	bottom: 0px;
	border-top: 1px solid #f0f0f0;
	background: #f0f0f0;
	width: 100%;
}

.product_list .btm div {
	text-align: center;
	height: 30px;
	font-size: 12px;
	color: #767676;
}

.cartbtn {
	margin-top: 1px;
	padding: 5px 55px 1px 55px;
	border: 0;
	outline: 0;
}

.content::-webkit-scrollbar {
	display: none;
}

.product_list .title a {
	color: #2196f3;
}

.item {

	border-radius: 10px;
	padding: 10px;
}

.item:hover {
	background-color: #0069c0;
	border-radius: 10px;
}

.maincategory {
	border: 1px solid black;
	border-radius: 15px;
	padding: 10px;
}

#pageBar {
	width: 300px;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
	display: flex;
	justify-content: space-between;
	/*flex안에 자식들의 텍스트의 높이를 똑같이 지정해준다.*/
	align-items:baseline;
	/* border:1px solid #bfd4df; */
	border-radius:5px;
	
	
	
}
</style>
<section>
	<div class="content">
		<form action="<%=request.getContextPath()%>/product/searchtype"
			id="searchfrom">

			<div id="input_inbt">
				<select id="searchType" name="searchType">
					<option value="book_title">제목</option>
					<option value="book_author">지은이</option>
				</select>
				<!--name에 공백이 있으면 값이 안넘어간다-->
				<input type="hidden" name="numPerPage"
					value='<%=numPerPage == null ? "4" : numPerPage%>'> <input
					type="text" name="searchkey" id="searchinput"
					placeholder="searchbook" /> <input id="search" type="submit"
					value="&#xf002" />

			</div>
		</form>
		<form name="categoryfrm" id="categoryfrm"
			action="<%=request.getContextPath()%>/product/radioproduct">
			<ul class="maincategory">
				<li class="item all"><input class="radiov" type="radio"
					name="item" value="all" id="all" checked/><label for="all">전체보기</label></li>
				<li class="item Social"><input class="radiov" type="radio"
					name="item" id="social" value="social" /><label for="social">인문사회</label></li>
				<li class="item Science"><input class="radiov" type="radio"
					name="item" id="science" value="science" /><label for="science">자연과학</label></li>
				<li class="item it"><input class="radiov" type="radio"
					name="item" id="it" value="it" /><label for="it">정보통신</label></li>
				<li class="item literature"><input class="radiov" type="radio"
					name="item" id="literature" value="literature" /><label
					for="literature">문학</label></li>
				<li class="item Self-development"><input type="radio"
					name="item" id="development" class="radiov" value="development" /><label
					for="development">자기계발</label></li>
			</ul>
			<input type="hidden" name="numPerPage"
				value='<%=numPerPage == null ? "4" : numPerPage%>'>
		</form>
		<hr>
		<div id="numPerpage-container">
			<form id="numperPageFrm" name="numPerPagetFrm"
				action="<%=request.getContextPath()%>/product/productmain">
				<input type="hidden" name="cPage"
					value='<%=request.getParameter("cPage")%>'><select
					name="numPerPage" id="numPerPage">
					<option value="8"
						<%=numPerPage != null && numPerPage.equals("8") ? "selected" : ""%>>8</option>
					<option value="4"
						<%=numPerPage == null || numPerPage.equals("4") ? "selected" : ""%>>4</option>
				</select>
			</form>
		</div>
		<ul class="product_list">
			<%
				for (Books bk : book) {
			%>
			<li>
				<dl>
					<dt class="title" id="title" name="title">
						<a href=""><%=bk.getTitle()%></a>
					</dt>
					<dd class="img" name="img">
						<a href="<%=request.getContextPath()%>/product/productDetail?no=<%=bk.getBookNo()%>"><img id="img" width="200" height="250"
							src="<%=request.getContextPath()%>/image/book/<%=bk.getBookimg()%>"
							alt="" /></a>
					</dd>
					<dd class="price" id="price" name="price"><%=bk.getPrice()%>원
					</dd>
					<dd class="author" name="author"><%=bk.getAuthor()%>(지은이)
					</dd>
					<dd class="btm">
						<div>
							<!--클릭시 매개변수로 책번호를 넘겨줘서 그해당 독서의 정보를 장바구니에 저장한다-->
							<!-- 비회원일때 는 어떻게 처리를 할것인가  비회원인경우 null이 발생한다-->
							<button class="cartbtn"
								onclick="cart(<%=bk.getBookNo()%>,<%=logginedMember.getMemberNo()%>)">장바구니
							</button>
						</div>
					</dd>
				</dl>
			</li>
			<%
				}
			%>
		</ul>
	</div>
	<div id="pageBar">
		<%=request.getAttribute("pageBar")%>
	</div>
	<!-- 페이징처리 부분 스타일 -->
	<style>
span.page-btn {
	/* border: 1px solid #bfd4df; */
	border-radius: 5px 0px 0px 5px;
	padding: 3px;
 	background-color:#bbdefb; 
}

#pageBar>a:nth-child(1) {
/* 	border: 1px solid #bfd4df; */
	border-radius: 5px;
	padding: 3px;
 	background-color:#bbdefb; 
}

#pageBar>a:nth-child(7) {
/* 	border: 1px solid #bfd4df; */
	border-radius: 0px 5px 5px 0px;
	padding: 3px;
	background-color:#bbdefb; 
}

.pageno {
	/* border: 1px solid #bfd4df; */
	border-radius: 5px;
	padding: 3px;
 	background-color:#bbdefb; 
}
</style>
	<div id="push"></div>
	<form action="" name="checkcart">
		<input type="hidden" name="cproductno" /> <input type="hidden"
			name="memberno" />
	</form>
	<div id="push"></div>
</section>
<script>
    function cart(num,userno) {
      const url = "<%=request.getContextPath()%>/product/checkcart";
      const subtitle = "checkcart";
      var popupWidth = "550";
      var popupHeight = "200";
      console.log(userno);
      // 듀얼 모니터 고려한 윈도우 띄우기
      var left = (screen.availWidth - popupWidth) / 2;
      if (window.screenLeft < 0) {
        left += window.screen.width * -1;
      } else if (window.screenLeft > window.screen.width) {
        left += window.screen.width;
      }
      var top = (screen.availHeight - popupHeight) / 2 - 10;
      var options =
        "resizable=no,left=" +
        left +
        ",top=" +
        top +
        ", width=" +
        popupWidth +
        ",height=" +
        popupHeight +
        ",menubar=no, status=no, toolbar=no, location=no, scrollbars=no";
      open("", subtitle, options);
      checkcart.target = subtitle;
      checkcart.action = url;
      checkcart.method = "post";
      checkcart.cproductno.value=num;
      checkcart.memberno.value=userno;
    
      checkcart.submit();
    }
    $("input:radio[name=categoryfrm]").on('change',function(){
    	var x=$(this).val();
    	alert(x);
    })
   	$('.radiov').on('click',function(){
   		$('.radiov:checked').prop('checked',true);
   		$("#categoryfrm").submit();
   		
   		//라디오버튼을 눌렀을때 해당 라디오버튼의 값을 가져온다
   	});
    $("#numPerPage").change(e => {
		$("#numperPageFrm").submit();
	});

  </script>
<%@ include file="/views/common/footer.jsp"%></Books>
