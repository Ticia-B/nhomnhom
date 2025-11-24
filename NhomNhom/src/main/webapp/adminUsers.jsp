<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <c:import url="head.jsp"/>
    <c:if test="${empty usersAdmin || empty usersClient || empty usersEmployee}">
        <script>
            window.onload = function () {
                window.location.href = "userslist";

            };
        </script>
    </c:if>
</head>
<body>
<c:import url="signInModal.jsp"/>
<c:import url="showingUsers.jsp"/>
<c:import url="signInEditModal.jsp"/>
<c:import url="employeeSignInModal.jsp"/>
<c:import url="employeeEditModal.jsp"/>
<c:import url="adminSignIn.jsp"/>
<c:import url="adminEditModal.jsp"/>
<script src="signInModalScript.js"></script>
<script src="employeeSignInScript.js"></script>
<script src="adminSignIn.js"></script>
</body>