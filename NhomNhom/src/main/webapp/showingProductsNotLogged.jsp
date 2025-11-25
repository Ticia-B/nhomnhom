<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<main class="pb-10 px-4 sm:px-6 relative z-10">

    <c:set var="hasSearch" value="${not empty sessionScope.searchEdibles}" />

    <main class="pb-10 px-4 sm:px-6 relative z-10">

        <div id="showingProductsReal"
             class="${hasSearch ? 'hidden' : ''} max-w-7xl mx-auto bg-amber-50 rounded-3xl overflow-hidden min-h-[600px] -mt-12 shadow-xl">

            <div class="p-8 grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-8">
                <c:forEach var="e" items="${edibles}">
                    <div class="edible-card group bg-orange-50 border border-orange-100 border-gray-100 rounded-2xl shadow-sm hover:shadow-xl hover:-translate-y-1 transition-all duration-300 overflow-hidden flex flex-col"
                         data-category="${e.productCategory}">

                        <div class="relative h-48 overflow-hidden">
                            <img src="${e.ediblePhoto}"
                                 class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-500">
                            <div class="absolute top-3 right-3 bg-amber-600 text-white text-xs font-bold px-3 py-1 rounded-full shadow-md">
                                <c:choose>
                                    <c:when test="${e.productCategory == 'SNACK'}">Lanche</c:when>
                                    <c:when test="${e.productCategory == 'SAVORY'}">Salgado</c:when>
                                    <c:when test="${e.productCategory == 'DRINK'}">Bebida</c:when>
                                    <c:when test="${e.productCategory == 'DESSERT'}">Sobremesa</c:when>
                                    <c:otherwise>${e.productCategory}</c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="p-5 flex flex-col flex-1">
                            <div class="flex justify-between items-start mb-2">
                                <h3 class="text-lg font-bold text-gray-800 group-hover:text-amber-600 transition-colors">${e.edibleName}</h3>
                            </div>
                            <p class="text-gray-500 text-sm mb-4 line-clamp-2">${e.edibleDescription}</p>
                            <div class="mt-auto flex items-center justify-between gap-3">
                                <div class="flex flex-col">
                                    <span class="text-xl font-bold">R$ ${e.ediblePrice}</span>
                                </div>
                                <button onclick="openModalLogin()"
                                        class="px-4 py-2.5 bg-yellow-800 hover:bg-yellow-500 text-white rounded-full shadow-md hover:shadow-lg transition-all flex items-center gap-2">
                                    <i class="fa-solid fa-cart-arrow-down"></i> Pedir
                                </button>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <div id="searchingProductsReal"
             class="${hasSearch ? '' : 'hidden'} max-w-7xl mx-auto bg-amber-50 rounded-3xl overflow-hidden min-h-[600px] -mt-12 shadow-xl border border-orange-100">

            <div class="p-4 border-b border-orange-200 bg-orange-100/50">
                <h2 class="text-xl font-bold text-yellow-900 flex items-center gap-2">
                    <i class="fa-solid fa-magnifying-glass"></i> Resultados da Busca
                </h2>
            </div>

            <div class="p-8 grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-8">
                <c:if test="${not empty sessionScope.searchEdibles}">
                    <c:forEach var="e" items="${sessionScope.searchEdibles}">
                        <div class="group bg-orange-50 border border-orange-100 border-gray-100 rounded-2xl shadow-sm hover:shadow-xl hover:-translate-y-1 transition-all duration-300 overflow-hidden flex flex-col">

                            <div class="relative h-48 overflow-hidden">
                                <img src="${e.ediblePhoto}"
                                     class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-500">
                                <div class="absolute top-3 right-3 bg-amber-600 text-white text-xs font-bold px-3 py-1 rounded-full shadow-md">
                                    <c:choose>
                                        <c:when test="${e.productCategory == 'SNACK'}">Lanche</c:when>
                                        <c:when test="${e.productCategory == 'SAVORY'}">Salgado</c:when>
                                        <c:when test="${e.productCategory == 'DRINK'}">Bebida</c:when>
                                        <c:when test="${e.productCategory == 'DESSERT'}">Sobremesa</c:when>
                                        <c:otherwise>${e.productCategory}</c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                            <div class="p-5 flex flex-col flex-1">
                                <div class="flex justify-between items-start mb-2">
                                    <h3 class="text-lg font-bold text-gray-800 group-hover:text-amber-600 transition-colors">${e.edibleName}</h3>
                                </div>
                                <p class="text-gray-500 text-sm mb-4 line-clamp-2">${e.edibleDescription}</p>
                                <div class="mt-auto flex items-center justify-between gap-3">
                                    <div class="flex flex-col">
                                        <span class="text-xl font-bold">R$ ${e.ediblePrice}</span>
                                    </div>
                                    <button onclick="openModalLogin()"
                                            class="px-4 py-2.5 bg-yellow-800 hover:bg-yellow-500 text-white rounded-full shadow-md hover:shadow-lg transition-all flex items-center gap-2">
                                        <i class="fa-solid fa-cart-arrow-down"></i> Pedir
                                    </button>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </div>
        </div>

    </main>
    <script src="filterProducts.js"></script>
</main>
<script src="filterProducts.js"></script>