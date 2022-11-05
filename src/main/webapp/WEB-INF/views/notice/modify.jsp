<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- main 부분은 이쪽에 작성하세요  -->
<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
 <div class="row">
            <div class="col-lg-12">
               <h1 class="page-header">공지사항 게시글</h1>
            </div>
         </div>
      
      <div class="row">
         <div class="col-lg-12">
            <div class="panel panel-default">
              <div class="panel-body">
				
				<form role="form" action="/notice/modify" method="post">
		
				<!-- 추가 -->
				<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
				<input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
				<!-- 추가끝 -->
				
				<div class="form-group">
                  <label>게시글코드</label> 
                  <input class="form-control" name="notice_code" value='<c:out value="${notice.notice_code }" />' readonly="readonly">
                  </div>
                  
                  <div class="form-group">
                  <label>제목</label> 
                  <input class="form-control" name="title" value='<c:out value="${notice.title }" />'>
                  </div>
                  
                  <div class="form-group">
                  <label>내용</label> 
                  <textarea class="form-control" rows="3" name="content"> <c:out value="${notice.content }" /> </textarea>
                  </div>
                  
                  <div class="form-group">
                  <label>작성자</label> 
                  <input class="form-control" name="admin_id" value='<c:out value="${notice.admin_id }" />' readonly="readonly">
                  </div>
                  
                  <div class="form-group">
                  <label>작성일</label> 
                  <input class="form-control" name="enter" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${notice.enter }" />' readonly="readonly">
                  </div>
                  
                  <div class="form-group">
                  <label>수정일</label> 
                  <input class="form-control" name="updatedate" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${notice.updatedate }" />' readonly="readonly">
                  </div>

				</div>
				 <button type="submit" data-oper="modify" class="btn btn-secondary">수정</button>
                 <button type="submit" data-oper="remove" class="btn btn-danger">삭제</button>
                 <button type="submit" data-oper="list" class="btn btn-outline-secondary">목록</button>
				</form>
			</div>
            </div>
         </div>
      </div>
</main>

<!-- main end -->

<%@ include file="../include/footer.jsp" %>


<script type="text/javascript">
   $(document).ready(function() {
      
      var formObj = $("form");
      
      $('button').on("click", function(e){
         
         e.preventDefault();
         
         var operation = $(this).data("oper");
         
         console.log(operation);
         
         if(operation === 'remove'){
            formObj.attr("action", "/notice/remove");
         } else if(operation === 'list'){
            // move to list
				formObj.attr("action", "/notice/list").attr("method","get");
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
				
				formObj.empty();
				formObj.append(pageNumTag);
				formObj.append(amountTag);
         }
         formObj.submit();
      });
      
   });
</script>