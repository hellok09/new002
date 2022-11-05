<%@ page language="java" contentType="text/html; charset=UTF-8"    
pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<%@ include file="../include/header.jsp" %>
<!-- main 부분은 이쪽에 작성하세요  -->
      <h2>회원 리스트</h2>
	  <div class="row">
	  <div class="col-lg-6 col-sm-12 text-lg-start text-center">
      </div>
       <div class="col-lg-6 col-sm-12 text-lg-end text-center">

      </div>
      </div>
      <br>
      <div class="table-responsive">
        <table class="table table-striped table-sm">
          <thead>
            <tr>
              <th scope="col">아이디</th>
              <th scope="col">이름</th>
              <th scope="col">회원분류</th>
              <th scope="col">지점</th>
       
          
            </tr>
          </thead>
          <!-- 데이터베이스에서 받아온값 넣기 -->
          <c:forEach items="${list}" var="list">
           	<tr>
				<td><a href="/Admin/read?STU_ID=${list.STU_ID}" >
				<c:out value="${list.STU_ID}" /></a></td>
       	       	<td><c:out value="${list.NAME }"></c:out></td>
				<td>
				<c:choose>
							<c:when test='${list.ADMIN_CODE=="4" }'>학생</c:when>
							<c:otherwise>관리자</c:otherwise>
						</c:choose></td>
				
				<td><c:out value="${list.BRANCH_NAME }"></c:out>
			<!-- 	<td><button type="submit" data-oper="remove" class="btn btn-danger">삭제</button> -->
				</td>
				
           	</tr>
         </c:forEach>
        </table>
      </div>
     	
     	
                 
                 <form id='actionForm' action="/Admin/read" method='get'>
            		
           		 </form>
                           		 
        
   
<%@ include file="../include/footer.jsp" %>


<form id="frm" method="get" action="/Admin/list">
			
		</form>

<!-- <script>
	$(document).ready(function(){
		var formObj = $("#frm");
		
		/
			$(function(){
				$('#btn-remove').click(function(){
					if(confirm("Are u sure?")){
						self.location.href = "/Admin/remove?STU_ID=${AdminVO.STU_ID}";
					}
				});
			});
	
	$(document).ready(function(){
		var actionForm = $("#actionForm");
	$(".move").on("click", function(e) {
		e.preventDefault();
		actionForm.append("<input type='hidden' name='STU_ID' value='"+$(this).attr("href")+"'>");
		actionForm.attr("action", "/Admin/read");
		actionForm.submit();
	});

	   });
 -->

</script>

