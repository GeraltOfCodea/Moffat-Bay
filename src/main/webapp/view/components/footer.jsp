<%--
  Created by IntelliJ IDEA.
  User: Ryan, Eric, & Celine
  Team: Blue Team
  For: CSD460
  Date: 11/16/24
  Time: 3:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<footer>
     <div class="container">
         <div class="footer-info">
             <img src="${pageContext.request.contextPath}/images/logo.png" alt="Moffat Bay Lodge">
             <p>
                 Moffat Bay<br>
                 +1 800 555 555<br>
                 info@moffatbay.com
             </p>
         </div>
         <div class="footer-nav">
             <ul>
                 <li><a href="${pageContext.request.contextPath}/view/aboutus.jsp">About Us</a></li>
             </ul>
             <p>&copy; 2024 Moffat Bay Lodge</p>
         </div>
     </div>
 </footer>