<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="pt-BR"/>

<main class="py-10 px-4 sm:px-6 bg-gradient-to-br from-orange-50 via-amber-50 to-orange-100 min-h-screen">
    <div class="max-w-7xl mx-auto mb-6">
        <a href="home.jsp"
           class="inline-flex items-center px-5 py-2 bg-gradient-to-r from-orange-500 to-amber-500 text-white font-bold rounded-full shadow-md hover:shadow-lg hover:from-orange-600 hover:to-amber-600 transition-all transform hover:-translate-x-1">
            <i class="fa-solid fa-arrow-left mr-2"></i>
            Voltar
        </a>
    </div>

    <div class="max-w-7xl mx-auto bg-gradient-to-br from-white to-orange-50 rounded-[2rem] overflow-hidden shadow-xl border border-orange-100">

        <div class="p-8 border-b border-orange-100 bg-gradient-to-r from-orange-400 to-amber-500">
            <h1 class="text-4xl font-black text-white">Gerenciamento de Pedidos</h1>
            <p class="text-orange-100 mt-2 text-lg font-semibold">Acompanhe o fluxo da cozinha e entregas com
                carinho!</p>
        </div>

        <div class="bg-orange-50 px-6 pt-6 border-b border-orange-100 overflow-x-auto">
            <nav class="flex gap-4 -mb-px min-w-max" aria-label="Tabs">
                <button onclick="switchOrderTab('pending')"
                        class="tab-button group relative py-4 px-6 rounded-t-[2rem] font-bold text-base transition-all transform duration-200"
                        data-tab="pending">
                    <i class="fa-solid fa-receipt mr-2 text-lg text-yellow-600"></i>
                    Pendentes
                    <span class="ml-2 bg-yellow-100 text-yellow-700 py-1 px-3 rounded-full text-xs font-black group-hover:scale-110 transition-transform shadow-sm">
                        ${ordersPending.size()}
                    </span>
                </button>

                <button onclick="switchOrderTab('preparing')"
                        class="tab-button group relative py-4 px-6 rounded-t-[2rem] font-bold text-base transition-all transform duration-200"
                        data-tab="preparing">
                    <i class="fa-solid fa-fire-burner mr-2 text-lg text-orange-600"></i>
                    Na Cozinha
                    <span class="ml-2 bg-orange-100 text-orange-700 py-1 px-3 rounded-full text-xs font-black group-hover:scale-110 transition-transform shadow-sm">
                        ${ordersInPreparation.size()}
                    </span>
                </button>

                <button onclick="switchOrderTab('delivering')"
                        class="tab-button group relative py-4 px-6 rounded-t-[2rem] font-bold text-base transition-all transform duration-200"
                        data-tab="delivering">
                    <i class="fa-solid fa-motorcycle mr-2 text-lg text-blue-600"></i>
                    Em Rota
                    <span class="ml-2 bg-blue-100 text-blue-700 py-1 px-3 rounded-full text-xs font-black group-hover:scale-110 transition-transform shadow-sm">
                        ${ordersReady.size()}
                    </span>
                </button>

                <button onclick="switchOrderTab('history')"
                        class="tab-button group relative py-4 px-6 rounded-t-[2rem] font-bold text-base transition-all transform duration-200"
                        data-tab="history">
                    <i class="fa-solid fa-clock-rotate-left mr-2 text-lg text-gray-600"></i>
                    Histórico
                    <span class="ml-2 bg-gray-200 text-gray-700 py-1 px-3 rounded-full text-xs font-black group-hover:scale-110 transition-transform shadow-sm">
                        ${ordersHistory.size()}
                    </span>
                </button>
            </nav>
        </div>

        <div class="p-8 min-h-[500px]">

            <div id="pending-tab" class="tab-content hidden">
                <div class="mb-6 flex justify-between items-center">
                    <h2 class="text-2xl font-black text-orange-600 flex items-center gap-3">
                        <span class="bg-yellow-100 p-2 rounded-xl"><i
                                class="fa-solid fa-bell text-yellow-600"></i></span>
                        Novos Pedidos
                    </h2>
                </div>
                <div class="overflow-hidden rounded-[2rem] border border-orange-100 bg-white shadow-sm">
                    <table class="min-w-full divide-y-4 divide-orange-100">
                        <thead class="bg-gradient-to-r from-orange-100 to-amber-100">
                        <tr>
                            <th class="px-6 py-5 text-left text-sm font-black text-orange-700 uppercase">ID</th>
                            <th class="px-6 py-5 text-left text-sm font-black text-orange-700 uppercase">Cliente</th>
                            <th class="px-6 py-5 text-left text-sm font-black text-orange-700 uppercase">Itens</th>
                            <th class="px-6 py-5 text-left text-sm font-black text-orange-700 uppercase">Total</th>
                            <th class="px-6 py-5 text-right text-sm font-black text-orange-700 uppercase">Ações</th>
                        </tr>
                        </thead>
                        <tbody class="bg-white divide-y-2 divide-orange-50">
                        <c:forEach var="o" items="${ordersPending}">
                            <tr class="hover:bg-yellow-50 transition-colors duration-200">
                                <td class="px-6 py-4 font-bold text-gray-500">#${o.orderId}</td>
                                <td class="px-6 py-4">
                                    <div class="flex items-center">
                                        <div class="flex-shrink-0 h-10 w-10 bg-gradient-to-br from-yellow-400 to-orange-500 rounded-full flex items-center justify-center text-white font-black text-xs">
                                                ${o.user.userName.substring(0,1)}
                                        </div>
                                        <div class="ml-3 font-bold text-gray-800">${o.user.userName}</div>
                                    </div>
                                </td>
                                <td class="px-6 py-4 text-sm text-gray-600">
                                    <span class="font-bold text-orange-600">${o.edibleOrder.size()}</span> itens
                                </td>
                                <td class="px-6 py-4 text-sm font-black text-green-600">
                                    <fmt:formatNumber value="${o.total}" type="currency"/>
                                </td>
                                <td class="px-6 py-4 text-right whitespace-nowrap">
                                    <a href="orderstatus/nextstage?id=${o.orderId}"
                                       class="inline-flex items-center px-4 py-2 bg-green-500 text-white rounded-full font-bold text-xs hover:bg-green-600 transition shadow-sm mx-1">
                                        <i class="fa-solid fa-check mr-1"></i> Aceitar
                                    </a>
                                    <a href="orderstatus/cancel?id=${o.orderId}"
                                       class="text-red-400 hover:text-red-600 mx-2 transition transform hover:scale-110">
                                        <i class="fa-solid fa-xmark text-xl"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <div id="preparing-tab" class="tab-content hidden">
                <div class="mb-6">
                    <h2 class="text-2xl font-black text-orange-600 flex items-center gap-3">
                        <span class="bg-orange-100 p-2 rounded-xl"><i
                                class="fa-solid fa-fire text-orange-600"></i></span>
                        Sendo Preparados
                    </h2>
                </div>
                <div class="overflow-hidden rounded-[2rem] border border-orange-100 bg-white shadow-sm">
                    <table class="min-w-full divide-y-4 divide-orange-100">
                        <thead class="bg-gradient-to-r from-orange-100 to-amber-100">
                        <tr>
                            <th class="px-6 py-5 text-left text-sm font-black text-orange-700 uppercase">ID</th>
                            <th class="px-6 py-5 text-left text-sm font-black text-orange-700 uppercase">Detalhes</th>
                            <th class="px-6 py-5 text-left text-sm font-black text-orange-700 uppercase">Status</th>
                            <th class="px-6 py-5 text-right text-sm font-black text-orange-700 uppercase">Ações</th>
                        </tr>
                        </thead>
                        <tbody class="bg-white divide-y-2 divide-orange-50">
                        <c:forEach var="o" items="${ordersInPreparation}">
                            <tr class="hover:bg-orange-50 transition-colors duration-200">
                                <td class="px-6 py-4 font-bold text-gray-500">#${o.orderId}</td>
                                <td class="px-6 py-4">
                                    <div class="text-sm font-bold text-gray-800">${o.user.userName}</div>
                                    <div class="text-xs text-gray-500 mt-1">
                                        <c:forEach var="item" items="${o.edibleOrder}" varStatus="status">
                                            ${item.edibleName}<c:if test="${!status.last}">, </c:if>
                                        </c:forEach>
                                    </div>
                                </td>
                                <td class="px-6 py-4">
                                        <span class="px-3 py-1 text-xs font-bold rounded-full bg-orange-100 text-orange-600 border border-orange-200 animate-pulse">
                                            Preparando...
                                        </span>
                                </td>
                                <td class="px-6 py-4 text-right whitespace-nowrap">
                                    <a href="orderstatus/nextstage?id=${o.orderId}"
                                       class="inline-flex items-center px-4 py-2 bg-blue-500 text-white rounded-full font-bold text-xs hover:bg-blue-600 transition shadow-sm">
                                        <i class="fa-solid fa-motorcycle mr-2"></i> Despachar
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <div id="delivering-tab" class="tab-content hidden">
                <div class="mb-6">
                    <h2 class="text-2xl font-black text-blue-600 flex items-center gap-3">
                        <span class="bg-blue-100 p-2 rounded-xl"><i class="fa-solid fa-route text-blue-600"></i></span>
                        Saiu para Entrega
                    </h2>
                </div>
                <div class="overflow-hidden rounded-[2rem] border border-blue-100 bg-white shadow-sm">
                    <table class="min-w-full divide-y-4 divide-blue-100">
                        <thead class="bg-gradient-to-r from-blue-50 to-blue-100">
                        <tr>
                            <th class="px-6 py-5 text-left text-sm font-black text-blue-700 uppercase">ID</th>
                            <th class="px-6 py-5 text-left text-sm font-black text-blue-700 uppercase">Cliente</th>
                            <th class="px-6 py-5 text-left text-sm font-black text-blue-700 uppercase">Total</th>
                            <th class="px-6 py-5 text-right text-sm font-black text-blue-700 uppercase">Ações</th>
                        </tr>
                        </thead>
                        <tbody class="bg-white divide-y-2 divide-blue-50">
                        <c:forEach var="o" items="${ordersReady}">
                            <tr class="hover:bg-blue-50 transition-colors duration-200">
                                <td class="px-6 py-4 font-bold text-gray-500">#${o.orderId}</td>
                                <td class="px-6 py-4 font-semibold text-gray-700">${o.user.userName}</td>
                                <td class="px-6 py-4 font-black text-gray-800"><fmt:formatNumber value="${o.total}"
                                                                                                 type="currency"/></td>
                                <td class="px-6 py-4 text-right whitespace-nowrap">
                                    <a href="orderstatus/nextstage?id=${o.orderId}"
                                       class="inline-flex items-center px-4 py-2 bg-gradient-to-r from-green-500 to-emerald-600 text-white rounded-full font-bold text-xs hover:from-green-600 hover:to-emerald-700 transition shadow-sm transform hover:scale-105">
                                        <i class="fa-solid fa-flag-checkered mr-2"></i> Concluir Entrega
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <div id="history-tab" class="tab-content hidden">
                <div class="mb-6">
                    <h2 class="text-2xl font-black text-gray-600 flex items-center gap-3">
                        <span class="bg-gray-100 p-2 rounded-xl"><i
                                class="fa-solid fa-clipboard-list text-gray-600"></i></span>
                        Histórico de Pedidos
                    </h2>
                </div>
                <div class="overflow-hidden rounded-[2rem] border border-gray-200 bg-white opacity-90">
                    <table class="min-w-full divide-y-4 divide-gray-100">
                        <thead class="bg-gray-100">
                        <tr>
                            <th class="px-6 py-5 text-left text-sm font-black text-gray-500 uppercase">ID</th>
                            <th class="px-6 py-5 text-left text-sm font-black text-gray-500 uppercase">Cliente</th>
                            <th class="px-6 py-5 text-left text-sm font-black text-gray-500 uppercase">Status Final</th>
                            <th class="px-6 py-5 text-right text-sm font-black text-gray-500 uppercase">Total</th>
                        </tr>
                        </thead>
                        <tbody class="bg-white divide-y-2 divide-gray-50">
                        <c:forEach var="o" items="${ordersHistory}">
                            <tr class="hover:bg-gray-50 text-gray-400 hover:text-gray-600 transition-colors">
                                <td class="px-6 py-4 font-medium">#${o.orderId}</td>
                                <td class="px-6 py-4 font-semibold">${o.user.userName}</td>
                                <td class="px-6 py-4">
                                    <c:choose>
                                        <c:when test="${o.orderStatus == 'COMPLETED'}">
                                            <span class="px-2 py-1 bg-green-100 text-green-700 text-xs font-bold rounded-md">Concluído</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="px-2 py-1 bg-red-100 text-red-700 text-xs font-bold rounded-md">Cancelado</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="px-6 py-4 text-right font-black"><fmt:formatNumber value="${o.total}"
                                                                                              type="currency"/></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>
</main>

<script>
    function switchOrderTab(tabName) {

        const contents = document.querySelectorAll('.tab-content');
        contents.forEach(content => content.classList.add('hidden'));

        const buttons = document.querySelectorAll('.tab-button');
        buttons.forEach(btn => {
            btn.classList.remove('bg-white', 'text-orange-600', 'shadow-md');
            btn.classList.add('text-gray-500', 'hover:text-orange-500');
            const badge = btn.querySelector('span');

        });

        document.getElementById(tabName + '-tab').classList.remove('hidden');

        const activeButton = document.querySelector(`button[data-tab="\${tabName}"]`);
        activeButton.classList.remove('text-gray-500', 'hover:text-orange-500');
        activeButton.classList.add('bg-white', 'text-orange-600', 'shadow-md');

        const activeContent = document.getElementById(tabName + '-tab');
        activeContent.classList.add('animate-fade-in-up');
    }

    document.addEventListener('DOMContentLoaded', () => {
        switchOrderTab('pending');
    });
</script>
