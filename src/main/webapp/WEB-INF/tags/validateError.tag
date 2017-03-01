<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="name" type="java.lang.String" required="true" description="messagekey"%>
<%@ attribute name="inputId" type="java.lang.String" required="true" description="messagekey"%>
<c:if test="${not empty requestScope[name] }">
	<script type="text/javascript">
	jQuery('#${inputId }').validationEngine('showPrompt', '${requestScope[name]}', 'error', true);
	</script>
</c:if>