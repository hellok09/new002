<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp" %>

<!-- /.row -->
 <!-- Page Heading -->
  
  <div class="d-sm-flex align-items-center justify-content-between mb-4">
   <h1 class="h3 mb-0 text-gray-800" id="title">강의등록</h1>
    </div>

                    


                    <div class="row" id="one">

            
                        <!-- /.panel-heading -->
  <div class="panel-body">
              
       <form role="form" name="form" action ="/course/classregister" method="post">
            
            <div class="form-inline form-group">
            	<label>지점 :  &nbsp</label>
            	
            	<select name="branchcode">
            		<option value="1">부천</option>
            		<option value="2">화곡</option>
            	</select>
            </div>
            <br>	
           
            
            <div class="form-inline form-group">
            	<label>과정 :  &nbsp</label>
            	<select name="course_code">
            	<option value="1">부천-국비과정</option>
            	<option value="2">부천-백엔드</option>
            	<option value="3">부천-프론트엔드</option>
            	<option value="4">부천-자격증과정</option>
            	<option value="5">화곡-국비과정</option>
            	<option value="6">화곡-백엔드</option>
            	<option value="7">화곡-프론트엔드</option>
            	<option value="8">화곡-자격증과정</option>
            	</select>
            </div>
            <br>
            
          
            
            	
            <div class="form-inline form-group">
            	<label>강의명 : &nbsp</label>
            	<input type="text" name="class_name">
            	
            </div>
            <br>
            <div class="form-inline form-group">
            	<label>강사명 :  &nbsp</label>
            	<input type="text" name="teacher_name">
            </div>
            <br>
            <div class="form-inline form-group">
            	<label>수강료 :  &nbsp</label>
            	<input type="text" name="tuition">
            </div>
            <br>
           
            <div class="form-inline form-group">
            	<label>개강일 :  &nbsp</label>
            	
            	<input type="date" name="start_date">&nbsp&nbsp
            	<label>종강일 :  &nbsp</label>
            
           		<input type="date" name="end_date">
            </div>
            <br>
            <div class="form-inline form-group">	
            	<label>시작시간 :  &nbsp</label>
            	<input type="time" name="start_time">&nbsp&nbsp
            	<label> 종료시간 :  &nbsp</label>
            	<input type="time" name="end_time">
            	
            </div>
            <br>
            <div class="form-group">	
            	<label>강의목표</label>&nbsp
            	<textarea class="form-control" rows="3" name="class_target"></textarea>
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
            	
            	<button type="submit" class="btn btn-default" id="register" data-oper="classregister">등록</button>
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
	
	var formObj = $("form[role='form']");
	
	$("button[data-oper='classregister']").on("click", function(e){
		
		
		if(!formObj.find("input[name='class_name']").val()){
			alert("강의명을 입력하세요.");
			return false;
		}
		
		if(!formObj.find("input[name='teacher_name']").val()){
			alert("강사명을 입력하세요.");
			return false;
		}
		
		if(!formObj.find("input[name='tuition']").val()){
			alert("수강료을 입력하세요.");
			return false;
		}
		
		if(!formObj.find("input[name='start_date']").val()){
			alert("개강일을 입력하세요.");
			return false;
		}
		
		if(!formObj.find("input[name='end_date']").val()){
			alert("종강일을 입력하세요.");
			return false;
		}
		
		if(!formObj.find("input[name='start_time']").val()){
			alert("시작시간을 입력하세요.");
			return false;
		}
		
		if(!formObj.find("input[name='end_time']").val()){
			alert("종료시간을 입력하세요.");
			return false;
		}
		
		
		e.preventDefault();
		console.log("submit clicked");
		
		var str = "";
		
		$(".uploadResult ul li").each(function(i, obj){
			var jobj = $(obj);
			
			str +="<input type='hidden' name='courseAttach["+i+"].fileName' value='"+jobj.data("filename")+"'>";
			str +="<input type='hidden' name='courseAttach["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
			str +="<input type='hidden' name='courseAttach["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
			str +="<input type='hidden' name='courseAttach["+i+"].fileType' value='"+jobj.data("type")+"'>";
		
		});
		
		formObj.append(str).submit();
	});
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 20971520;//20mb
	
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
	               str += "<span> "+ obj.fileName+"</span>&nbsp";
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
	               str += "<span> "+ obj.fileName+"</span>&nbsp";
	               str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
	               str += "class='btn btn-sm btn-dark btn-circle'><i class='fa fa-times'></i></button><br>";
	             
	               str += "</div>";
	               str +"</li>";
	               
	            }
			
		});
		
		uploadURL.append(str);
	}
	
	$(".uploadResult").on("click", "button", function(e){
		
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
	});
	
	$("button[data-oper='classmanage']").on("click", function(e){
		
		formObj.attr("action", "/course/classmanage").attr("method", "get");
		formObj.submit();
	});
	

	
});





</script>

 <%@ include file="../include/footer.jsp" %>