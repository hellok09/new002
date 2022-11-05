<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp" %>

<!-- /.row -->
 <!-- Page Heading -->
  
  <div class="d-sm-flex align-items-center justify-content-between mb-4">
   <h1 class="h3 mb-0 text-gray-800" id="title">강의수정</h1>
    </div>

                    


 <div class="row" id="one">

            
                        <!-- /.panel-heading -->
  <div class="panel-body">
              
       <form role="form" action ="/course/classmodify" method="post">
       <input type="hidden" name="class_code" value='<c:out value="${course.class_code }"/>'>
            <!-- page 번호, amount 값 가져오기 -->
                <input type="hidden" name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
                <input type="hidden" name='amount' value='<c:out value="${cri.amount }"/>'>
                <input type="hidden" name='type' value='<c:out value="${cri.type }"/>'>
                <input type="hidden" name='keyword' value='<c:out value="${cri.keyword }"/>'>
            <div class="form-inline form-group">
            	<label>지점 :  &nbsp</label>
            	
            	<select name="branchcode">
            		<c:choose>
            			<c:when test='${course.branchcode==1 }'>
            			<option value="1" selected="selected">부천</option>
            			<option value="2">화곡</option>
            			</c:when>
            			<c:otherwise>
            			<option value="1">부천</option>
            			<option value="2" selected="selected">화곡</option>
            			</c:otherwise>
            		</c:choose>
            	</select>
            	
            </div>
            <br>	
           
            
            <div class="form-inline form-group">
            	<label>과정 :  &nbsp</label>
            	<select name="course_code">
            	<c:choose>
            	<c:when test="${course.course_code ==1}">
            	<option value="1" selected="selected">부천-국비과정</option>
            	<option value="2">부천-백엔드</option>
            	<option value="3">부천-프론트엔드</option>
            	<option value="4">부천-자격증과정</option>
            	<option value="5">화곡-국비과정</option>
            	<option value="6">화곡-백엔드</option>
            	<option value="7">화곡-프론트엔드</option>
            	<option value="8">화곡-자격증과정</option>
            	</c:when>
            	<c:when test="${course.course_code ==2}">
            	<option value="1">부천-국비과정</option>
            	<option value="2" selected="selected">부천-백엔드</option>
            	<option value="3">부천-프론트엔드</option>
            	<option value="4">부천-자격증과정</option>
            	<option value="5">화곡-국비과정</option>
            	<option value="6">화곡-백엔드</option>
            	<option value="7">화곡-프론트엔드</option>
            	<option value="8">화곡-자격증과정</option>
            	</c:when>
            	<c:when test="${course.course_code ==3}">
            	<option value="1">부천-국비과정</option>
            	<option value="2" >부천-백엔드</option>
            	<option value="3" selected="selected">부천-프론트엔드</option>
            	<option value="4">부천-자격증과정</option>
            	<option value="5">화곡-국비과정</option>
            	<option value="6">화곡-백엔드</option>
            	<option value="7">화곡-프론트엔드</option>
            	<option value="8">화곡-자격증과정</option>
            	</c:when>
            	<c:when test="${course.course_code ==4}">
            	<option value="1">부천-국비과정</option>
            	<option value="2" >부천-백엔드</option>
            	<option value="3">부천-프론트엔드</option>
            	<option value="4" selected="selected">부천-자격증과정</option>
            	<option value="5">화곡-국비과정</option>
            	<option value="6">화곡-백엔드</option>
            	<option value="7">화곡-프론트엔드</option>
            	<option value="8">화곡-자격증과정</option>
            	</c:when>
            	<c:when test="${course.course_code ==5}">
            	<option value="1">부천-국비과정</option>
            	<option value="2">부천-백엔드</option>
            	<option value="3">부천-프론트엔드</option>
            	<option value="4">부천-자격증과정</option>
            	<option value="5" selected="selected">화곡-국비과정</option>
            	<option value="6">화곡-백엔드</option>
            	<option value="7">화곡-프론트엔드</option>
            	<option value="8">화곡-자격증과정</option>
            	</c:when>
            	<c:when test="${course.course_code ==6}">
            	<option value="1">부천-국비과정</option>
            	<option value="2">부천-백엔드</option>
            	<option value="3">부천-프론트엔드</option>
            	<option value="4">부천-자격증과정</option>
            	<option value="5">화곡-국비과정</option>
            	<option value="6" selected="selected">화곡-백엔드</option>
            	<option value="7">화곡-프론트엔드</option>
            	<option value="8">화곡-자격증과정</option>
            	</c:when>
            	
            	<c:when test="${course.course_code ==7}">
            	<option value="1">부천-국비과정</option>
            	<option value="2">부천-백엔드</option>
            	<option value="3">부천-프론트엔드</option>
            	<option value="4">부천-자격증과정</option>
            	<option value="5">화곡-국비과정</option>
            	<option value="6">화곡-백엔드</option>
            	<option value="7" selected="selected">화곡-프론트엔드</option>
            	<option value="8">화곡-자격증과정</option>
            	</c:when>
            	
            	<c:otherwise>
            	<option value="1">부천-국비과정</option>
            	<option value="2">부천-백엔드</option>
            	<option value="3">부천-프론트엔드</option>
            	<option value="4">부천-자격증과정</option>
            	<option value="5">화곡-국비과정</option>
            	<option value="6">화곡-백엔드</option>
            	<option value="7">화곡-프론트엔드</option>
            	<option value="8" selected="selected">화곡-자격증과정</option>
            	</c:otherwise>
            	
            	
            	</c:choose>
            	</select>
            </div>
            <br>
            
            <div class="form-inline form-group">
            	<label>강의사용유무:   &nbsp</label>
            	<select name="status">
            	<c:choose>
            		<c:when test='${course.status=="Y"}'>
            	<option value="Y" selected="selected">O</option>
            	<option value="N">X</option>
            	</c:when>
            	<c:otherwise>
            	<option value="Y" >O</option>
            	<option value="N" selected="selected">X</option>
            	</c:otherwise>
            	</c:choose>
            	</select>
            </div>
            <br>
            	
            <div class="form-inline form-group">
            	<label>강의명 : &nbsp</label>
            	<input type="text" name="class_name" value='<c:out value="${course.class_name }"/>'>
            	
            	
            </div>
            <br>
            <div class="form-inline form-group">
            	<label>강사명 :  &nbsp</label>
            	<input type="text" name="teacher_name" value='<c:out value="${course.teacher_name }"/>'>
            	
            </div>
            <br>
            <div class="form-inline form-group">
            	<label>수강료 :  &nbsp</label>
            	<input type="text" name="tuition" value='<c:out value="${course.tuition }"/>'>
            	
            </div>
            <br>
           
            <div class="form-inline form-group">
            	<label>개강일 :  &nbsp</label>
            	
            	<input type="date" name="start_date" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${course.start_date }"/>'>&nbsp&nbsp
            	
            	<label>종강일 :  &nbsp</label>
            	
            
           		<input type="date" name="end_date" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${course.end_date }"/>'>
            </div>
            <br>
            <div class="form-inline form-group">	
            	<label>시작시간 :  &nbsp</label>
            	<input type="time" name="start_time" value='<c:out value="${course.start_time }"/>'>&nbsp&nbsp
            	
            	<label> 종료시간 :  &nbsp</label>
            	<input type="time" name="end_time" value='<c:out value="${course.end_time }"/>'>
            	
            </div>
            <br>
            <div class="form-group">	
            	<label>강의목표</label>&nbsp
            	<textarea class="form-control" rows="3" name="class_target"><c:out value="${course.class_target }"/>
            	
            	</textarea>
            </div>
            <br>
            <div class="form-group uploadDiv">	
            	<label>첨부파일 :  &nbsp</label>
            	<input type="file" name="uploadFile" multiple>
            </div>
            <div class="uploadResult">
            	<ul>
            	
            	</ul>
            </div>
            <br>	
            	
            	<button type="submit" class="btn btn-default" data-oper="classmodify">수정</button>
            	<button type="submit" class="btn btn-default" data-oper="classmanage">취소</button>
            	
            </form>
         
           </div>
           <!-- end panel-body -->
       </div>
       <!--end panel -->
<style>
	
	#title {text-align:center;}
	#one {margin:0 auto;}
	
</style> 
<!-- /.row -->
<script>


$(document).ready(function(e){
	
	var formObj = $("form");
	
	$('button').on("click", function(e){
		
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if(operation === 'classmanage'){
			
			formObj.attr("action", "/course/classmanage").attr("method", "get");
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			var keywordTag = $("input[name='keyword']").clone();
			var typeTag = $("input[name='type']").clone();
			
			formObj.empty();
			formObj.append(pageNumTag);
			formObj.append(amountTag);
			formObj.append(keywordTag);
			formObj.append(typeTag);
		}else if(operation === 'classmodify'){
			
			console.log("submit clicked");
			var str = "";
			
			$(".uploadResult ul li").each(function(i,obj){
				
				var jobj = $(obj);
				
				str += "<input type='hidden' name='courseAttach["+i+"].fileName' value='"+jobj.data("filename")+"'>";
				str += "<input type='hidden' name='courseAttach["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
				str += "<input type='hidden' name='courseAttach["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
				str += "<input type='hidden' name='courseAttach["+i+"].fileType' value='"+jobj.data("type")+"'>";
			});
			
			formObj.append(str).submit();
			
		}
		
		formObj.submit();
		
		
	});
});
</script> 
<script type="text/javascript">
$(document).ready(function(){
	(function(){
	
		var class_code = '<c:out value="${course.class_code}"/>';
		
		$.getJSON("/course/getCourseAttach", {class_code:class_code}, function(arr){
			console.log(arr);
			
			var str="";
			
			$(arr).each(function(i,attach){
				if(attach.fileType){
					var fileCallPath = encodeURIComponent(attach.uploadPath+"/s_"+attach.uuid+"_"+attach.fileName);
					
					str += "<li data-path='"+attach.uploadPath+"'";
					str += " data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'><div>";
					str += "<span>" +attach.fileName + "</span>&nbsp&nbsp";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image'";
					str += " class='btn btn-sm btn-dark btn-circle'><i class = 'fa fa-times'></i></button></br>";
					str += "<img src='/display?fileName="+fileCallPath+"'>";
					str += "</div>";
					str + "</li>";
					
				}else{
					
					str += "<li data-path ='"+attach.uploadPath+"'";
					str += " data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type+'"+attach.fileType+"'";
					str += " ><div><span> "+attach.fileName+"</span>&nbsp&nbsp";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file'";
					str += " class='btn btn-sm btn-dark btn-circle'><i class = 'fa fa-times'></i></button></br>";
					
					str += "</div>";
					str +"</li>";
				}
				
			});
			
			$(".uploadResult ul").html(str);
			
		});//end getjson
	})();//end function
	
	$(".uploadResult").on("click", "button", function(e){
		
		console.log("delete file");
		
		if(confirm("Remove this file? ")){
			
			var targetFile = $(this).data("file");
			var type = $(this).data("type");
			
			var targetLi = $(this).closest("li");
			
			$.ajax({
				
				url:'/deleteFile',
				data:{fileName: targetFile, type: type},
				dataType:'text',
				type:'POST',
				success : function(result){
					
					alert(result);
					targetLi.remove();
				}
				
			});
		}
	});
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880;//5MB
	
	function checkExtension(fileName, fileSize){
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		
		if(regex.test(fileName)){
			alert("해당 종류의 파일은 업로드 할 수 없습니다.");
			return false;
		}
		
		return true;
	}
	

	
	
	$("input[type='file']").change(function(e){
		
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;
		
		for(var i=0; i<files.length; i++){
			if(!checkExtension(files[i].name, files[i].size)){
				return false;
			}
			
			formData.append("uploadFile", files[i]);
		}
		
		$.ajax({
			
			url:'/uploadAjaxAction',
			processData: false,
			contentType:false,
			data: formData,			
			type:'POST',
			
			dataType:'json',
			success:function(result){
				console.log(result);
				showUploadFile(result);
			}
		});
	});
	
	function showUploadFile(uploadResultArr){
		if(!uploadResultArr || uploadResultArr.length == 0){
			
			return;
		}
		
		var uploadURL = $(".uploadResult ul");
		var str ="";
		
		
		$(uploadResultArr).each(function(i, obj){
			
			if(obj.image){
	               var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
	               str += "<li data-path='"+obj.uploadPath+"'";
	               str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
	               str +" ><div>";
	               str += "<span> "+ obj.fileName+"</span>";
	               str += "<button type='button' data-file=\'"+fileCallPath+"\' "
	               str += "data-type='image' class='btn btn-sm btn-dark btn-circle'><i class='fa fa-times'></i></button><br>";
	               str += "<img src='/display?fileName="+fileCallPath+"'>";
	               str += "</div>";
	               str +"</li>";
	            }else{
	               var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);               
	                var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
	                  
	               str += "<li "
	               str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
	               str += "<span> "+ obj.fileName+"</span>";
	               str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
	               str += "class='btn btn-sm btn-dark btn-circle'><i class='fa fa-times'></i></button><br>";
	              
	               str += "</div>";
	               str +"</li>";
	               
	            }
			
		});
		
		uploadURL.append(str);
	}
	
});



</script>

 <%@ include file="../include/footer.jsp" %>