<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<div>
	<div>
		<a href="/bRegmod?typ=${typ}"><button>글쓰기</button></a>
	</div>
	<table>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>조회수</td>
			<td>작성일</td>
		</tr>		
		<c:forEach items="${list}" var="item">
			<tr class="pointer" onclick="clkItem(${typ}, ${item.i_board})">
				<td>${item.i_board}</td>
				<td>${item.title}</td>
				<td>${item.hits}</td>
				<td>${item.r_dt}</td>
			</tr>
		</c:forEach>
	</table>
	<div class="pageContainer">
		<c:forEach begin="1" end="${pageCnt}" var="i">
		<span class="page">
			<a href="/bList?typ=${typ}&page=${i}">${i}</a>
		</span>
		</c:forEach>
	</div>
</div>
<script>
	function clkItem(typ, i_board) {
		// console.log('typ : '+typ + ', i_board : '+i_board);
		//var url = '/bDetail?typ='+typ + '&i_board='+i_board;
		var url = `/bDetail?typ=\${typ}&i_board=\${i_board}`;	// \를 써야 문장 그대로 날라감  // 안쓰면 서버에서 동작해 값을 찍음
		console.log('url : '+url);
		location.href = url; // 주소값 이동
	}
</script>