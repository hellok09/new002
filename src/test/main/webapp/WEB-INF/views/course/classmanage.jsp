<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp" %>




<!-- Page Heading -->
         
                    
                <!-- DataTales Example -->
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">강의 관리</h6>
    </div>
    <div class="card-body">
        <div class="table-responsive">
        
        <div>
           <button id ='regBtn' type="button" class="btn btn-secondary btn-icon-split float-right">강의 등록</button>
        </div>
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>지점</th>
                        <th>과정</th>
                        <th>강의</th>
                        <th>강사</th>
                        <th>개강</th>
                        <th>종강</th>
                        <th>동영상관리</th>
                        <th>수정</th>
                        <th>삭제</th>
                    </tr>
                </thead>
               
            
                
             <c:forEach items="${classmanage}" var="clist">
                <tr>
              		<td><c:out value="${clist.branch_name }"/></td> 
              		<td><c:out value="${clist.course_name }"/></td>   
              		<td>
              		<a class="move" href='<c:out value="${clist.class_code }"/>'>
 
              		<c:out value="${clist.class_name }"/>
              		</a>
              		</td>   
              		<td><c:out value="${clist.teacher_name }"/></td>   
              		<td><fmt:formatDate pattern="yyyy/MM/dd" value="${clist.start_date }"/></td>   
              		<td><fmt:formatDate pattern="yyyy/MM/dd" value="${clist.end_date }"/></td>   
              		<td>동영상</td>
              		<td>수정</td>
              		    
                    
                </tr>
             </c:forEach>
           
                
            </table>
        </div>
    

                
                

                	
  
    
                <!-- /.modal start -->
                <div class="modal fade" id ="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                	<div class="modal-dialog">
                		<div class="modal-content">
                			<div class="modal-header">
                				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                				<h4 class="modal-title" id="myModalLabel">Modal title</h4>
                			</div>
                			<div class="modal-body">처리가 완료되었습니다.</div>
                			<div class="modal-footer">
                				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                				<button type="button" class="btn btn-primary">Save changes</button>
                		</div>
                	</div>
                	<!-- modal content -->
                </div>
                <!-- modal dialog -->
                                  
          </div>
    </div>
</div>
<script type="text/javascript">
$(document).ready(function() {
	var result='<c:out value="${result}"/>';
	
	checkModal(result);
	
	history.replaceState({}, null, null);
	
	function checkModal(result){
		if(result ===''){
			return;
		}
		if(parseInt(result)>0){
			$(".modal-body").html("강의가 등록되었습니다.");
		}
		$("#myModal").modal("show");
	}
	
	$("#regBtn").on("click", function(){
		
		self.location = "/course/classmanage";
});
	
	var actionForm = $("#actionForm");
	
	$(".paginate_button a").on("click", function(e) {
		e.preventDefault();
		
		console.log('click');
		
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
	
});


</script>                    
                                 
 <%@ include file="../include/footer.jsp" %>