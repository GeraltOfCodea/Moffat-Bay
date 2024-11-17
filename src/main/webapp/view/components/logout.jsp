<%--
  Created by IntelliJ IDEA.
  User: ryannorrbom
  Date: 11/16/24
  Time: 3:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%-- logout.jsp --%>
<%
    session.invalidate();
    response.sendRedirect(request.getContextPath() + "/view/Index.jsp");
%>
