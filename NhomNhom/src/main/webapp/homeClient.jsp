<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<c:import url="header.jsp"/>

<c:forEach items="${pageContext.session.attributeNames}" var="nomeAtributo">
    <div style="margin-bottom: 10px;">
        <strong>${nomeAtributo}</strong>
        <br/>
        <span>Valor:</span>
        <span>${sessionScope[nomeAtributo]}</span>
    </div>
</c:forEach>

<div class="w-full flex justify-center relative z-20 pointer-events-none">
    <c:import url="minhom.jsp"/>
</div>
<c:import url="cartModal.jsp"/>
<c:import url="showingProducts.jsp"/>
<c:import url="myOrdersModal.jsp"/>

</body>
</html>