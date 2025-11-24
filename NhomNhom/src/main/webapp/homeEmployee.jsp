<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="base" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <c:import url="head.jsp"/>
    <c:if test="${empty orders}">
        <script>
            window.onload = function () {
                window.location.href = "edibleorderlist";
            };
        </script>
    </c:if>
</head>
<body class="bg-orange-100" style="font-family: 'Comic Relief', sans-serif;">

<c:import url="headerEmployee.jsp"/>
<div class="w-full flex justify-center relative z-20 pointer-events-none">
    <c:import url="minhom.jsp"/>
</div>
<c:import url="addEdibleModal.jsp"/>
<button class="fixed bottom-6 right-6 w-16 h-16 bg-orange-500 text-white rounded-full shadow-lg hover:bg-yellow-800 hover:scale-110 transition-all duration-300 z-50 flex items-center justify-center"
        onclick="openModal()">
    <i class="fa-solid fa-plus text-2xl"></i>
</button>
<c:import url="showingProductsAdmin.jsp"/>
<c:import url="employeeNotificationModal.jsp"/>

<c:forEach items="${pageContext.session.attributeNames}" var="nomeAtributo">
    <div style="margin-bottom: 10px;">
        <strong>${nomeAtributo}</strong>
        <br/>
        <span>Valor:</span>
        <span>${sessionScope[nomeAtributo]}</span>
    </div>
</c:forEach>
</body>
</html>