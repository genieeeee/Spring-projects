<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${userChatList==null }">
	${msg }
</c:if>
<c:if test="${userChatList!=null }">
<c:forEach var="userChatList" items="${userChatList}" varStatus="status">
	<div class="chatList">
		<a href="javascript:chatContentToServer('${mem_id }', '${userChatList.chat_selectedid }')">
			<input type="hidden" name="mem" value="${mem_id }">
			<input type="hidden" name="user" value="${userChatList.chat_selectedid}">
			${img[status.count-1]} ${userChatList.chat_selectedid} ${userState[status.count-1]}
		</a>
	</div>
</c:forEach>
</c:if>
