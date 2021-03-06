<%@page import="com.semi.product.model.vo.BooksJoin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List,com.semi.product.model.vo.Books"%>
<%
	List<BooksJoin> list = (List) session.getAttribute("booklist");
	Books bs=(Books)session.getAttribute("books");
	int count=(int)session.getAttribute("count"); 
	int totalprice = 0;
	/* if(bs==null){ */
		if (!list.isEmpty()) {
			for (BooksJoin bk : list) {
				totalprice += (bk.getPrice() * bk.getCount());
				/* session.removeAttribute("books");
				session.removeAttribute("count"); */
			}
		}	
	/* } */
	
	

%>
<%@ include file="/views/common/header.jsp"%>
<section>
	<style>
.carttable {
	height: auto;
	margin: 0 auto;
	width: 960px;
}
.addcarttable{
height: auto;
	margin: 0 auto;
}

#button-box {
	display: flex;
	justify-content: space-around;
	padding-bottom: 3rem;
	margin-top:10px;
}

#headerfont {
	font-size: 25px;
	width: 960px;
	margin: 0 auto;
	padding-top: 50px;
}



.carttable>td>img{
border:1px solid black;
}



.carttable td {

	
	text-align:center;
}

hr {
	margin-bottom: 50px;
}

#cartcontainer {
	height: auto;
	padding-bottom: 2.5em;
}

td {
	width: auto;
	
}

#price-box {
	
	margin: 0 auto;
	margin-top:50px;
	margin-bottom:50px;
	width:960px;
	box-shadow:1px 1px 1px 1px
}

#totaltxt {
	margin:0 auto;
	margin-top:50px;
	margin-bottom: 50px;
	font-size:20px;
	display:flex;
	justify-content:flex-end;
	padding:20px;
	padding-right:20px;
	width:960px;
	box-shadow:1px 1px 1px 1px
	
}
th {
	flex-basis: 250px;
	height: 30px;
	border: 1px solid rgb(216, 211, 205);
	vertical-align: middle;
	background-color: rgb(239, 241, 243);
}

td {
	flex-basis: 250px;
	border: 1px solid rgb(216, 211, 205);
	text-align: center;
	vertical-align: middle;
}

button {
	background: #8fa3ad;
	color: #fff;
	border: none;
	position: relative;
	height: 50px;
	font-size: 15px;
	padding: 0 2em;
	cursor: pointer;
	transition: 800ms ease all;
	outline: none;
}

button:hover {
	background: #fff;
	color: #8fa3ad;
}
#flextable{
display:flex;
flex-flow:column;

}
#radiodiv{
width:960px;
margin:0 auto;
}


button:before, button:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #8fa3ad;
	transition: 400ms ease all;
}
#zero{
width:960px;
font-size:20px;
margin:0 auto;
}
#tdimg{
float:left
}
#tdtitle{
padding-top:70px;
}

button:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

button:hover:before, button:hover:after {
	width: 100%;
	transition: 800ms ease all;
}

</style>
	<section>
		<p id="headerfont">Order</p>
		<hr>
		<div id="cartcontainer">
			<form action=""
				method="post" id="buyfrm">
				<table class="carttable">
					<tr>
						<th colspan="2">상품명</th>
						<th class="price">가격</th>
						<th class="count">수량</th>
					</tr>
					<%if(bs!=null){ %>
					<tr>
						<input type="hidden" name="bookno" value="<%=bs.getBookNo()%>">
						<td><img height=150px name="img"
							src="<%=request.getContextPath()%>/image/book/<%=bs.getBookimg()%>"></td>
						<td><%=bs.getTitle()%></td>
						<td><%=bs.getPrice()%>원</td>
						<td><input type="hidden" name="count"
							value="<%=count%>"> <%=count%></td>
					</tr>
					<%}else{%>
					<%
						for (BooksJoin bk : list) {
							
					%>
					<tr>
						<input type="hidden" name="bookno" value="<%=bk.getBookno()%>">
						<td><img height=150px name="img"
							src="<%=request.getContextPath()%>/image/book/<%=bk.getBookimg()%>"></td>
						<td><%=bk.getTitle()%></td>
						<td><%=bk.getPrice()%>원</td>
						<td><input type="hidden" name="count"
							value="<%=bk.getCount()%>"> <%=bk.getCount()%></td>
					</tr>
					
					<%}%>
					<%} %>
					</table>
						<hr>
						<div id="totaltxt"> 
						<%if(bs!=null){%>
						<input type="hidden" name="totalprice" id="totalprice"
							value="<%=bs.getPrice()*count%>" /><p id="pricetext">총결제금액 :<%=bs.getPrice()*count%>원</p>
						<%}else{ %>
						<input type="hidden" name="totalprice" id="totalprice"
							value="<%=totalprice%>" /><p id="pricetext">총결제금액 :<%=totalprice%>원</p>
						<%} %>
						</div>
						<div id="radiodiv">
						<input type="radio" class="inputadd" checked="checked" name="inputadd" value="1" id="ra1"><label for="ra1">기존 주소지</label>
						<input type="radio" class="inputadd" name="inputadd"value="2" id="ra2"><label for="ra2">새로운 주소지</label>
						</div>
						<div id="addresstxt">
					<table class="addcarttable" id="table1">
						<tr>
							<th>주문인</th>
							<input type="hidden" name="userno"
								value="<%=logginedMember.getMemberNo()%>">
							<td id="username"><%=logginedMember.getMemberName()%></td>

						</tr>
						<tr>
							<th>받는사람</th>
							<td><input type="text" name="Recipient" /></td>
						</tr>
						<tr>
							<th>주소</th>
							<td><input type="text" id="sample6_postcode" value="<%=logginedMember.getPostcode()%>" name="postcode"
								/> <input type="button"
								onclick="sample6_execDaumPostcode()" value="우편번호 찾기" /><br />
								<input type="text" name="address" id="sample6_address"
								value="<%=logginedMember.getAddress()%>" /><br /> <input type="text"
								name="extraaddress" id="sample6_detailAddress"
								value="<%=logginedMember.getExtraAddress()%>" /><br /> <input type="text"
								name="detailaddress" id="sample6_extraAddress"
								value="<%=logginedMember.getDetailAddress()%>" /></td>
						</tr>
						<tr>
							<th>휴대폰 번호</th>
							<td><input type="tel" name="tel" id="tel"
								placeholder="-없이 입력해주세요" /></td>
						</tr>
						<tr>
							<th>배송시 요청사항</th>
							<td><textarea name="request" id="" cols="30" rows="6"></textarea><br /></td>
						</tr>
						
					</table>
					<table class="addcarttable" id="table2" style=display:none >
						<tr>
							<th>주문인</th>
							<input type="hidden" name="userno"
								value="<%=logginedMember.getMemberNo()%>">
							<td id="username"><%=logginedMember.getMemberName()%></td>

						</tr>
						<tr>
							<th>받는사람</th>
							<td><input type="text" name="Recipient" /></td>
						</tr>
						<tr>
							<th>주소</th>
							<td><input type="text" id="sample6_postcode" name="postcode"
								placeholder="우편번호" /> <input type="button"
								onclick="sample6_execDaumPostcode()" value="우편번호 찾기" /><br />
								<input type="text" name="address" id="sample6_address"
								placeholder="주소" /><br /> <input type="text"
								name="extraaddress" id="sample6_detailAddress"
								placeholder="상세주소" /><br /> <input type="text"
								name="detailaddress" id="sample6_extraAddress"
								placeholder="참고항목" /></td>
						</tr>
						<tr>
							<th>휴대폰 번호</th>
							<td><input type="tel" name="tel" id="tel"
								placeholder="-없이 입력해주세요" /></td>
						</tr>
						<tr>
							<th>배송시 요청사항</th>
							<td><textarea name="request" id="" cols="30" rows="6"></textarea><br /></td>
						</tr>
						
					</table>
					<div id="button-box">
						<button type="button" class="orderbtn"onclick="buy()">주문하기</button>
						</div>
				</div>
			</form>
			<!--주문하기 누르면 아임포트api이용하기-->
		</div>


		<script>
	  	$('.inputadd').on('click',function(){
	   		$('.inputadd:checked').prop('checked',true);
	   		let radio=$('input[name="inputadd"]:checked').val();
	   		if(radio==1){
	   			$("#table2").css("display","none");
	   			$("#table1").css({display:"block",
	   			"margin-left": "565px"
	   			});
	   		}else{
	   			$("#table1").css("display","none");
	   			$("#table2").css({display:"block",
		   			"margin-left":" 565px"
		   			});
	   		}
	   		
	  
	   		
	   		//라디오버튼을 눌렀을때 해당 라디오버튼의 값을 가져온다
	   	});
		
		
			function sample6_execDaumPostcode() {
				new daum.Postcode(
						{
							oncomplete : function(data) {
								// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

								// 각 주소의 노출 규칙에 따라 주소를 조합한다.
								// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
								var addr = ""; // 주소 변수
								var extraAddr = ""; // 참고항목 변수

								//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
								if (data.userSelectedType === "R") {
									// 사용자가 도로명 주소를 선택했을 경우
									addr = data.roadAddress;
								} else {
									// 사용자가 지번 주소를 선택했을 경우(J)
									addr = data.jibunAddress;
								}

								// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
								if (data.userSelectedType === "R") {
									// 법정동명이 있을 경우 추가한다. (법정리는 제외)
									// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
									if (data.bname !== ""
											&& /[동|로|가]$/g.test(data.bname)) {
										extraAddr += data.bname;
									}
									// 건물명이 있고, 공동주택일 경우 추가한다.
									if (data.buildingName !== ""
											&& data.apartment === "Y") {
										extraAddr += extraAddr !== "" ? ", "
												+ data.buildingName
												: data.buildingName;
									}
									// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
									if (extraAddr !== "") {
										extraAddr = " (" + extraAddr + ")";
									}
									// 조합된 참고항목을 해당 필드에 넣는다.
									document
											.getElementById("sample6_extraAddress").value = extraAddr;
								} else {
									document
											.getElementById("sample6_extraAddress").value = "";
								}

								// 우편번호와 주소 정보를 해당 필드에 넣는다.
								document.getElementById("sample6_postcode").value = data.zonecode;
								document.getElementById("sample6_address").value = addr;
								// 커서를 상세주소 필드로 이동한다.
								document
										.getElementById("sample6_detailAddress")
										.focus();
							},
						}).open();
			}
			 
			//*
					<%-- name+="<%=bs.getTitle()%>"; --%>
					<%-- frm.action='<%=request.getContextPath()%>/cart/orderbuy'; --%>
				
				 
			function buy() {
				let name=[];
				let frm=document.querySelector("#buyfrm")
				<%
				if(!list.isEmpty()){
				for (BooksJoin bk : list) {%>
				name+=["<%=bk.getTitle()%>"]
				frm.action='<%=request.getContextPath()%>/cart/orderend';
				<%}}%>
				
			     let price = document.querySelector("#totalprice").value;
				 let username = document.querySelector("#username").innerText;
			     
			      let tel = document.querySelector("#tel").value;
			      let email="<%=logginedMember.getEmail()%>"
			      let post=document.querySelector("#sample6_postcode").value;
			      let addrss=document.querySelector("#sample6_address").value;
			      IMP.init("imp75893840");
			      IMP.request_pay(
			        {
			          pg: "html5_inicis",
			          pay_method: "card",
			          merchant_uid: "merchant_" + new Date().getTime(),
			          name: name,
			          amount:  price,
			          buyer_email: email,
			          buyer_name: username,
			          buyer_tel: tel,
			          buyer_addr: addrss,
			          buyer_postcode: post,
			        },
			        function (rsp) {
			          if (rsp.success) {
			            var msg = "결제가 완료되었습니다.";
			            alert(msg);
			            frm.submit(); 
			          } else {
			            var msg = "결제에 실패하였습니다.";
			            msg+="홈으로 돌아갑니다";
			            frm.action="<%=request.getContextPath()%>";
						alert(msg);
						frm.submit();
					}
				}

				);
			}
		</script>
	</section>
	<%@ include file="/views/common/footer.jsp"%>