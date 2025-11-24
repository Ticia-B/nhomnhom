<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <c:import url="head.jsp"/>
    <c:if test="${empty orders}">

        <script>
            window.onload = function () {
                window.location.href = "order/findall";
                filterCards('all');
            };
        </script>

    </c:if>

</head>
<body>
<c:forEach items="${pageContext.session.attributeNames}" var="nomeAtributo">
    <div style="margin-bottom: 10px;">
        <strong>${nomeAtributo}</strong>
        <br/>
        <span>Valor:</span>
        <span>${sessionScope[nomeAtributo]}</span>
    </div>
</c:forEach>
<c:import url="listOrdersAdmin.jsp"/>
</body>