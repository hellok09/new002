<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- main 부분은 이쪽에 작성하세요  -->


 
<div class="row" style="margin-bottom:20px; margin-left:1px;">
<div class="col-lg-12">
<h1 class="page-header">회원 조회</h1>
</div>
</div>

<div class="panel" style="margin-left:1px;">
<div id="contAreaBox">
<div class="panel">
<div class="panel-body">
<div class="table-responsive" style="text-align:center;">
<table id="datatable-scroller"
	class="table table-bordered tbl_Form">
	<caption></caption>
	<colgroup>
		<col width="250px" />
		<col />
	</colgroup>
	<tbody>
		<tr>
			<th style="text-align: left"  >아이디</th>
			<td>
				${StudentView.STU_ID}
			</td>
		</tr>
		<tr>
			<th style="text-align: left">지점</th>
			<td>
				<c:choose>
							<c:when test='${StudentView.BRANCHCODE=="1" }'>부천</c:when>
							<c:otherwise>화곡</c:otherwise>
						</c:choose>
			</td>
		</tr>
		<tr>
			<th style="text-align: left" >비밀번호</th>
			<td>
				${StudentView.PWD}
			</td>
		</tr>
	
		<tr>
			<th style="text-align: left">이름</th>
			<td>
				${StudentView.NAME}
			</td>
		</tr>
		<tr>
			<th style="text-align: left">주소</th>
			<td>
				${StudentView.ADDRESS}
			</td>
		</tr>
		<tr>
			<th style="text-align: left">성별</th>
			<td>
		
				<c:choose>
							<c:when test='${StudentView.GENDER=="1" }'>남자</c:when>
							<c:otherwise>여자</c:otherwise>
						</c:choose>
			</td>
		</tr>
		<tr>
			<th style="text-align: left">이메일</th>
			<td>
				${StudentView.EMAIL}
			</td>
		</tr>
		<tr>
			<th style="text-align: left">전화번호</th>
			<td>
				${StudentView.PHONE}
			</td>
		</tr>
		<tr>
			<th style="text-align: left">수신동의</th>
			<td>
				${StudentView.AGREE_AD}
				<c:choose>
							<c:when test='${StudentView.AGREE_AD=="1" }'>이메일</c:when>
							<c:otherwise>SMS</c:otherwise>
						</c:choose>
			</td>
		</tr>

	</tbody>
</table>
</div>
<div style="margin-left:1px;">
<a href="/Admin/list" class="btn btn-primary">목록</a>
<a href="javascript:void(0);" class="btn btn-danger" onclick="deleteConfirm();">삭제</a>

</div>
</div>
</div>
</div>
</div>

<%@ include file="../include/footer.jsp" %>

<script type="text/javascript">


$(document).ready(function() {
	
	var msg = "${msg}";
	
	if(msg != ""){
		alert(msg);	
	}
	
});


function deleteConfirm(){
	
	if(!confirm("삭제 하시겠습니까?")){
		return false;
	}else{
		location.href="${pageContext.request.contextPath }/Admin/StudentDelete.do?STU_ID=${StudentView.STU_ID}";
	}
}

</script>
 