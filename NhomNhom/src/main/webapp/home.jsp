<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <c:import url="head.jsp"/>

    <c:if test="${empty edibles}">
        <script>
            window.onload = function () {
                window.location.href = "edible/findall";
                filterCards('all');
            };
        </script>
    </c:if>
    <c:if test="${not empty userLogged}">

        <c:if test="${userLogged['class'].simpleName == 'UserClient'}">
            <c:redirect url="homeClient.jsp"/>
        </c:if>

        <c:if test="${userLogged['class'].simpleName == 'UserEmployee'}">
            <c:redirect url="homeEmployee.jsp"/>
        </c:if>

        <c:if test="${userLogged['class'].simpleName == 'UserAdmin'}">
            <c:redirect url="homeAdmin.jsp"/>
        </c:if>

    </c:if>
</head>

<body class="bg-orange-100" style="font-family: 'Comic Relief', sans-serif;">

<c:import url="headerNotLogged.jsp"/>
<div class="w-full flex justify-center relative z-20 pointer-events-none">
    <c:import url="minhom.jsp"/>
</div>

<c:import url="showingProductsNotLogged.jsp"/>

</body>
</html>