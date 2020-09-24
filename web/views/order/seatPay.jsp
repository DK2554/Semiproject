<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.semi.seat.model.vo.Seat"%>
<% 
	Seat s=(Seat)request.getAttribute("seat");
	String MemberName=(String)request.getAttribute("MemberName");
	String Email=(String)request.getAttribute("Email");
%>
<!DOCTYPE html>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>

	var IMP = window.IMP; // 생략가능
	IMP.init('imp86773417'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	
	IMP.request_pay({
	    pg : 'inicis', // version 1.1.0부터 지원.
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '<%=s.getSeatNo()%>',
	    amount : <%=s.getSeatPrice()%>,
	    buyer_email : '<%=Email%>',
	    buyer_name : '<%=MemberName%>',
	    buyer_tel : '',
	    buyer_addr : '',
	    buyer_postcode : '',
	    m_redirect_url : ''
	}, function(rsp) {
	    if ( rsp.success ) {
	        var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	      
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
	    result();
	});

</script>
<script>
	function result(){
		opener.result.value=true;
		window.open('','_self').close(); 
	}
</script>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>

