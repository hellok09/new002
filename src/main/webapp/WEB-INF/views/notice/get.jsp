<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- main 부분은 이쪽에 작성하세요  -->

 <div class="row">
            <div class="col-lg-12">
               <h1 class="page-header">공지사항 게시글</h1>
            </div>
         </div>
      
      <div class="row">
         <div class="col-lg-12">
            <div class="panel panel-default">
               <div class="panel-body">
                  
                  <div class="form-group">
                  <label>글번호</label> 
                  <input class="form-control" name="notice_code" value='<c:out value="${notice.notice_code }" />' readonly="readonly">
                  </div>
                  
                  <div class="form-group">
                  <label>제목</label> 
                  <input class="form-control" name="title" value='<c:out value="${notice.title }" />' readonly="readonly">
                  </div>
                  
                  <div class="form-group">
                  <label>내용</label> 
                  <textarea class="form-control" rows="3" name="content" readonly="readonly"><c:out value="${notice.content }" /> </textarea>
                  </div>
                  
                  <div class="form-group">
                  <label>작성자</label> 
                  <input class="form-control" name="admin_id" value='<c:out value="${notice.admin_id }" />' readonly="readonly">
                  </div>
                  
                  <button data-oper="modify" 
                        class="btn btn-secondary"
                        onclick="location.href= '/notice/modify?notice_code=<c:out value="${notice.notice_code }" /> '"> 
                        수정
                  </button>
                  <button data-oper="list" 
                        class="btn btn-outline-secondary"
                        onclick="location.href='/notice/list'">
                        목록
                  </button>
                  
                  <form id="operForm" action="/notice/modify" method="get">
                     <input type='hidden' id='notice_code' name='notice_code' value='<c:out value="${notice.notice_code}"/>' >
                     <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>' >
                     <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>' >
                  </form>
                  
               </div>
            </div>
         </div>
      </div>


<!-- main end -->

<%@ include file="../include/footer.jsp" %>

<script type="text/javascript">
$(document).ready(function() {
var operForm = $('#operForm');
	
	$("button[data-oper='modify']").on("click", function(e) {
		operForm.attr("action", "/notice/modify").submit();		
	});
	
	$("button[data-oper='list']").on("click", function() {
		operForm.find("#notice_code").remove();
		operForm.attr("action", "/notice/list");
		operForm.submit();
	});
});
	</script>