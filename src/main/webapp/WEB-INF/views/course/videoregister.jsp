<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp" %>
<!-- /.row -->
 <!-- Page Heading -->
 

  
  <div class="d-sm-flex align-items-center justify-content-between mb-4">
   
  
   <h1 class="h3 mb-0 text-gray-800" id="title">동영상 등록</h1>
    </div>

                    


                    <div class="row" id="one">

            
                        <!-- /.panel-heading -->
  <div class="panel-body">
              
       <form role="form" name="form" action ="/course/videoregister" method="post">
     
       <input type="hidden" name="class_code" value='<c:out value="${classcode}"/>'>
       
        
        	
        	<div class="form-group">
            	<label>번호 : &nbsp</label><input type="text" name="classnum" placeholder="숫자만 입력하세요."/>
            	
            </div>
            <br>
            <div class="form-group">
            	<label>제목 : &nbsp</label>
            	<input type="text" name="movietitle">
            	
            </div>
            <br>
         
            <div class="form-group uploadDiv">	
            	<label>동영상 파일 :  &nbsp</label>
            	<input type="file" name="uploadFile" multiple>
            </div>
            <div class="uploadResult">
            	<ul>
            	
            	</ul>
            </div>
            <br>	
            <br>	
            	<button type="submit" class="btn btn-default" id="videoregister" data-oper="videoregister">등록</button>
            	<button type="submit" class="btn btn-default" data-oper="videolist">취소</button>
            	
            </form>
         
           </div>
           <!-- end panel-body -->
       </div>
       <!--end panel -->
<style>
	
	#title {text-align:center;}
	#one {margin:0 auto;}
	
</style> 






<script>


$(document).ready(function(e){
	
	var formObj = $("form");
	
	$('button').on("click", function(e){
		
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if(operation === 'videolist'){
			
			formObj.attr("action", "/course/videolist").attr("method", "get");
			var class_code = $("input[name='class_code']").clone();
			
			
			formObj.empty();
			formObj.append(class_code);
		
		}else if(operation === 'videoregister'){
			
			console.log("submit clicked");
			var str = "";
			
			$(".uploadResult ul li").each(function(i,obj){
				
				var jobj = $(obj);
				
				str += "<input type='hidden' name='videoList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
				str += "<input type='hidden' name='videoList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
				str += "<input type='hidden' name='videoList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
				str += "<input type='hidden' name='videoList["+i+"].fileType' value='"+jobj.data("type")+"'>";
			});
			
			formObj.append(str).submit();
			
		}
		
		formObj.submit();
		
		
	});
});
</script> 
<script>



$(document).ready(function(e){
	
	
	
	var formObj = $("form[role='form']");
	
	
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 10485760;//10MB
	
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
			
			url:'/uploadAjaxAction2',
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
			
			url:'/deleteFile2',
			data:{fileName: targetFile, type: type},
			dataType:'text',
			type:'POST',
			success : function(result){
				
				alert(result);
				targetLi.remove();
			}
			
		});
	});
	
	
	
});

</script>  

 <%@ include file="../include/footer.jsp" %>