<%@ page language="java" contentType="text/html; charset=UTF-8"    
pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../include/header.jsp" %>
<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
<!-- main 부분은 이쪽에 작성하세요  -->
      <h2>온라인 상담 관리 페이지</h2>
      <div class="table-responsive">
        <table class="table table-striped table-sm">
          <thead>
            <tr>
              <th scope="col">번호</th>
              <th scope="col">과정명</th>
              <th scope="col">제목</th>
              <th scope="col">작성자</th>
              <th scope="col">작성일</th>
            </tr>
          </thead>
          <!-- 데이터베이스에서 받아온값 넣기 
          <c:set var="stu_id" value="test99" />
        
          <c:if test="${stu_id == 'test99'} "> -->         <!--  </c:if>   -->  	
            <c:forEach var="inquery" items="${list }">
           	<tr>
				<td><c:out value="${inquery.oi_code }"></c:out></td>
				<td><c:out value="${inquery.course_name}"></c:out></td>
				<td><a class='move' href='<c:out value="${inquery.oi_code}"/>'>
       	       		  <c:out value="${inquery.title }"/>
       	       		</a></td>
				<td><c:out value="${inquery.stu_id }"></c:out></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${inquery.enter}" /></td>
           	</tr>
           	</c:forEach>   
        </table>
      </div>
      </main>
      
      <nav aria-label="Page navigation example">
           <div class='pull-right'>
              <ul class="pagination">
              
                    <c:if test="${pageMaker.prev }">
                       <li class="page-item">
                     <a class="page-link" href="${pageMaker.startPage -1 }" aria-label="Previous">
                       <span aria-hidden="true">&laquo;</span>
                     </a>
                   </li>
                    </c:if>
                    
                    <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
                       <li class="page-item" ${pageMaker.cri.pageNum == num ? "active":"" }><a class="page-link" href="${num }">${num }</a> </li>
                    </c:forEach>
                    
                    <c:if test="${pageMaker.next }">
                       <li class="page-item">
                     <a class="page-link" href="${pageMaker.endPage +1 }" aria-label="Next">
                       <span aria-hidden="true">&raquo;</span>
                     </a>
                   </li>
                    </c:if>
                 </ul>
                 
                 <form id='actionForm' action="/inquery/list" method='get'>
            		<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }'>
            		<input type='hidden' name='amount' value='${pageMaker.cri.amount }'>
           		 </form>
                           		 
           </div>
        </nav>
<!-- main end-->
<%@ include file="../include/footer.jsp" %>
<script type="text/javascript">
<!-- register page mapping -->
$(document).ready(function(){
	
	var actionForm = $("#actionForm");
	
	$(".page-item a").on("click", function(e) {
		e.preventDefault();
		console.log('click');
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
	
	$(".move").on("click", function(e) {
		e.preventDefault();
		actionForm.append("<input type='hidden' name='oi_code' value='"+$(this).attr("href")+"'>");
		actionForm.attr("action", "/inquery/get");
		actionForm.submit();
	});

});
</script>

