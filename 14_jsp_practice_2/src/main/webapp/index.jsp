<%@ page pageEncoding="UTF-8"%>
<%
	String selectedPage = request.getParameter("page");

	if(selectedPage == null){
		selectedPage = "default";
	}
%>
<jsp:include page="common/header.jsp" />
<section>
	<jsp:include page='<%=selectedPage+".jsp"%>'/>
</section>
<jsp:include page="common/footer.jsp" />








