<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp" %>

<div class="card shadow mb-4">
    <div class="card-header py-3">
        
    </div>
    <div class="card-body">
        <div class="table-responsive">
      
      
      
      
     	
        <div>
        <form id="classcode" action="/course/videolist" method="get">
      <c:forEach items="${video}" var="code">
      <a type="button" id="regBtn" class="btn btn-secondary float-right" href='<c:out value="${code.class_code}"/>'>동영상 등록</a><br>
        </c:forEach>
        </form>
        
      	
        
        </div>
        <br>
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                
                
                <thead>
                    <tr>
                   
                        <th>
                      
                        동영상 목록 
                        
                       </th>
                      
                    </tr>
                </thead>
                <tbody>
                      
      
        	
             <c:forEach items="${listvideo}" var="video">
            
            
                <tr>
              		<td><c:out value="${video.classnum}"/>.&nbsp<c:out value="${video.movietitle}"/>
              		  
              		
              		<form id='actionForm' action="/course/videolist"  method="get">
              		<a type="button" class="btn btn-outline-primary btn-sm float-right btn-space" id="videomodify" href='<c:out value="${video.vno}"/>'>동영상 수정</a>
            		<a type="button" class="btn btn-outline-primary btn-sm float-right btn-space" data-oper="videosee" href='<c:out value="${video.vno}"/>'>동영상 보기</a>
              		</form>
              		
              		
           			 </td>
              		    
                    
                </tr>
             </c:forEach>
             
            </tbody>
                
            </table>
            
            
             <!-- /.modal start -->
                <div class="modal fade" id ="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                	<div class="modal-dialog">
                		<div class="modal-content">
                			<div class="modal-header">
                				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                			
                			</div>
                			<div class="modal-body">처리가 완료되었습니다.</div>
                			<div class="modal-footer">
                				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                				
                		</div>
                	</div>
                	<!-- modal content -->
                </div>
                <!-- modal dialog -->
                                  
            </div>
          
       </div>
   </div>
</div>

<style>
.btn-space {
    margin-right: 5px;
}

</style>
        
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
			$(".modal-body").html("동영상이 등록되었습니다.");
		}
		$("#myModal").modal("show");
	}
	
	var actionForm = $("#actionForm");
	$("#videomodify").on("click", function(e){
		e.preventDefault();
		
		actionForm.append("<input type='hidden' name='vno' value='"+$(this).attr("href")+"'>");
		actionForm.attr("action","/course/videomodify");
		actionForm.submit();
	});
	

	
	
var classcode = $("#classcode")
	
	$("#regBtn").on("click", function(e){
			e.preventDefault();
		
		classcode.append("<input type='hidden' name='class_code' value='"+$(this).attr("href")+"'>");
		classcode.attr("action","/course/videoregister");
		classcode.submit();
	});
	
	
	
	
	

	
});        
        
</script>

 <%@ include file="../include/footer.jsp" %>