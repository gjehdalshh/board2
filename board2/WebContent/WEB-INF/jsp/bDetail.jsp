<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div>
		<a href="/bList?typ=${data.typ}">돌아가기</a>
		<form action="/bDetail" method="post" onsubmit="return isDel();">
			<input type="hidden" name="typ" value="${data.typ}">
			<input type="hidden" name="i_board" value="${data.i_board}">
			<input type="submit" value="삭제">
		</form>
		<a href="/bRegmod?typ=${data.typ}&i_board=${data.i_board}">
			<button>수정</button>
		</a>
	</div>
	<div>
		<div>번호 : ${data.i_board}</div>
		<div>제목 : ${data.title}</div>
		<div>내용 : ${data.ctnt}</div>
		<div>날짜 : ${data.r_dt}</div>
		<div>조회수 : ${data.hits}</div>
	</div>
	<div style="margin-top: 20px;">
		<div>
			<form action="/cmt" method="post">
				<input type="hidden" name="typ" value="${data.typ}">
				<input type="hidden" name="i_board" value="${data.i_board}">
				댓글 : <input type="text" name="cmt_ctnt">
				<input type="submit" value="댓글쓰기">
			</form>
		</div>
		<div>
			<table>
				<tr>					
					<th>댓글</th>					
				</tr>
				<c:forEach items="${cmtList}" var="item">
					<tr>
						<td>${item.ctnt}</td>
					</tr>
				</c:forEach>
			</table>
		
		</div>
	</div>
</body>
</html>
<script>
	function isDel() {
		var result = confirm('삭제 하시겠습니까?');	// yes는 true, no는 false
		if(!result) {
			return false;
		}
	}
	<c:if test="${err != null}">
	alert('${err}');
	</c:if>
</script>
