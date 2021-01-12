<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id = "frm" name = "frm" enctype="multipart/form-data">
<table class="board_view">
<colgroup>
<col width="15%">
<col width="*"/>
</colgroup>
<caption>게시글 작성</caption>
<tbody>
<tr>
<th scope="row">제목</th>
<td><input type="text" id="TITLE" name="TITLE" class="wdp_90"></input></td>
</tr>
<tr>
<td colspan="2" class="view_text">
<textarea rows="20" cols="100" title="내용" id="CONTENTS" name="CONTENTS"></textarea>
</td>
</tr>
</tbody>
</table>

<div id = "fileDiv">

<p>
<input type = "file" name = "file_0">
<a href = "#this" class="btn" id="delete" name="delete">삭제</a>
</p>
</div>
<br/><br/>

<a href="#this" class="btn" id="addFile">파일추가</a>
<a href="#this" class="btn" id="write">작성하기</a>
<a href="#this" class="btn" id="list">목록으로</a>
</form>

<%@ include file="/WEB-INF/include/include-body.jsp" %>
<script type = "text/javascript">
var gfv_count = 1;

$(document).ready(function(){
	$("#list").on("click", function(e){
		e.preventDefault();
		fn_openBoardList();
	});
	
	$("#write").on("click",function(e){
		e.preventDefault();
		fn_insertBoard();
	})
	
	$("#addFile").on("click", function(e){
		e.preventDefault();
		fn_addFile();
	});
	
	$("a[name='delete']").on("click", function(e){
		e.preventDefault();
		fn_deleteFile($(this));
	})
});

function fn_openBoardList(){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/sample/openBoardList.do'/>");
	comSubmit.submit();
}

function fn_insertBoard(){
	var comSubmit = new ComSubmit("frm");
	comSubmit.setUrl("<c:url value='/sample/insertBoard.do'/>");
	comSubmit.submit();
}

function fn_addFile(){
	var str = "<p><input type='file' name='file_"+(gfv_count++)+"'><a href='#this' class='btn' name='delete'>삭제</a></p>";
	$("#fileDiv").append(str);
	$("a[name='delete']").on("click", function(e){
		e.preventDefault();
		fn_deleteFile($(this));
	});
}

function fn_deleteFile(obj){
	obj.parent().remove();
}

</script>
</body>
</html>