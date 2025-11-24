<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="ordersModalOverlay" class="hidden fixed inset-0 bg-black bg-opacity-50 z-40 transition-opacity backdrop-blur-sm">

    <div id="ordersModal" class="hidden fixed inset-0 z-50 flex items-center justify-center p-4 sm:p-6">

        <div class="bg-white rounded-2xl shadow-2xl w-full max-w-3xl max-h-[90vh] overflow-hidden flex flex-col transform transition-all scale-100">

            <div class="bg-gradient-to-r from-amber-600 to-orange-300 p-6 flex-shrink-0 flex justify-between items-center">
                <div>
                    <h2 class="text-2xl font-black text-white flex items-center gap-3">
                        <i class="fa-solid fa-receipt"></i>
                        Meus Pedidos
                    </h2>
                    <p class="text-orange-100 mt-1 font-medium text-sm">Acompanhe suas delícias do NhomNhom</p>
                </div>

                <button onclick="closeOrdersModal()" class="text-white hover:text-yellow-900 rounded-full p-2 transition-all">
                    <i class="fa-solid fa-xmark text-xl"></i>
                </button>
            </div>

            <div class="overflow-y-auto p-6 sm:p-8 bg-gray-50 flex-1">

                <c:choose>
                    <c:when test="${empty orders}">
                        <div class="flex flex-col items-center justify-center py-12 text-center bg-white rounded-2xl border border-gray-100 shadow-sm mx-auto max-w-md">
                            <div class="bg-orange-50 p-6 rounded-full mb-4">
                                <i class="fa-solid fa-utensils text-4xl text-orange-300"></i>
                            </div>
                            <h3 class="text-xl font-bold text-gray-700">Nenhum pedido ainda?</h3>
                            <p class="text-gray-500 mb-6 px-6">Seu histórico está vazio, mas sua barriga não precisa ficar. Bora pedir?</p>
                            <button onclick="closeOrdersModal()" class="px-6 py-3 bg-amber-600 text-white rounded-full font-bold shadow-md hover:bg-amber-700 transition-all">
                                Fazer meu primeiro pedido
                            </button>
                        </div>
                    </c:when>

                    <c:otherwise>
                        <div class="space-y-6 w-full">
                            <c:forEach var="orderUser" items="${orders}">
                                    <c:if test="${orderUser.user.userId eq userLogged.userId}">
                                        <div class="group w-full bg-white border border-gray-200 rounded-2xl shadow-sm hover:shadow-md transition-all duration-300 overflow-hidden">

                                            <div class="flex flex-col sm:flex-row justify-between items-start sm:items-center p-5 border-b border-gray-100 bg-white gap-3">
                                                <div class="flex items-center gap-3">
                                            <span class="bg-gray-100 px-3 py-1 rounded-lg text-gray-600 font-black text-sm">
                                                #${orderUser.orderId}
                                            </span>
                                                </div>

                                                <c:choose>
                                                    <c:when test="${orderUser.orderStatus == 'CANCELLED'}">
                                                <span class="w-full sm:w-auto text-center px-3 py-1 rounded-full text-xs font-bold bg-red-100 text-red-700 border border-red-200">
                                                    <i class="fa-solid fa-ban mr-2"></i> Cancelado
                                                </span>
                                                    </c:when>
                                                    <c:when test="${orderUser.orderStatus == 'PENDING'}">
                                                <span class="w-full sm:w-auto text-center px-3 py-1 rounded-full text-xs font-bold bg-yellow-100 text-yellow-700 border border-yellow-200">
                                                    <i class="fa-solid fa-clock mr-2"></i> Pendente
                                                </span>
                                                    </c:when>
                                                    <c:when test="${orderUser.orderStatus == 'IN_PREPARATION'}">
                                                <span class="w-full sm:w-auto text-center px-3 py-1 rounded-full text-xs font-bold bg-orange-100 text-orange-700 border border-orange-200 animate-pulse">
                                                    <i class="fa-solid fa-fire-burner mr-2"></i> Preparando
                                                </span>
                                                    </c:when>
                                                    <c:when test="${orderUser.orderStatus == 'READY'}">
                                                <span class="w-full sm:w-auto text-center px-3 py-1 rounded-full text-xs font-bold bg-blue-100 text-blue-700 border border-blue-200">
                                                    <i class="fa-solid fa-motorcycle mr-2"></i> Saiu p/ Entrega
                                                </span>
                                                    </c:when>
                                                    <c:when test="${orderUser.orderStatus == 'COMPLETED'}">
                                                <span class="w-full sm:w-auto text-center px-3 py-1 rounded-full text-xs font-bold bg-green-100 text-green-700 border border-green-200">
                                                    <i class="fa-solid fa-check-circle mr-2"></i> Entregue
                                                </span>
                                                    </c:when>
                                                    <c:otherwise>
                                                <span class="w-full sm:w-auto text-center px-3 py-1 rounded-full text-xs font-bold bg-red-100 text-red-700 border border-red-200">
                                                    Cancelado
                                                </span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>

                                            <div class="p-5">
                                                <div class="flex flex-col gap-4">
                                                    <c:forEach var="edi" items="${orderUser.edibleOrder}">
                                                        <div class="flex items-center justify-between">
                                                            <div class="flex items-center gap-4 overflow-hidden">
                                                                <div class="h-12 w-12 rounded-lg overflow-hidden border border-gray-100 flex-shrink-0">
                                                                    <img src="${edi.ediblePhoto}" alt="${edi.edibleName}" class="w-full h-full object-cover">
                                                                </div>
                                                                <div class="min-w-0"> <h4 class="text-sm font-bold text-gray-800 truncate">${edi.edibleName}</h4>
                                                                    <p class="text-xs text-gray-500 truncate max-w-[200px]">${edi.edibleDescription}</p>
                                                                </div>
                                                            </div>
                                                            <div class="text-sm font-semibold text-gray-600 whitespace-nowrap ml-2">
                                                                <fmt:formatNumber value="${edi.ediblePrice}" type="currency"/>
                                                            </div>
                                                        </div>
                                                        <div class="border-b border-dashed border-gray-100 last:hidden"></div>
                                                    </c:forEach>
                                                </div>
                                            </div>

                                            <div class="bg-gray-50 px-5 py-4 flex flex-wrap justify-between items-center border-t border-gray-100 gap-3">
                                                <div>
                                                    <span class="text-[10px] font-bold text-gray-400 uppercase block">Valor Total</span>
                                                    <span class="text-xl font-black text-gray-800">
                                                        <fmt:formatNumber value="${orderUser.total}" type="currency"/>
                                                    </span>
                                                </div>

                                                <div class="flex items-center gap-2">

                                                    <c:if test="${orderUser.orderStatus == 'COMPLETED'}">
                                                        <a href="cart?action=reorder&id=${orderUser.orderId}" class="px-5 py-2 bg-white border border-gray-200 text-gray-700 rounded-full font-bold text-xs shadow-sm hover:bg-amber-50 hover:text-amber-600 hover:border-amber-200 transition-all flex items-center gap-2">
                                                            <i class="fa-solid fa-rotate-right"></i>
                                                            Pedir de novo
                                                        </a>
                                                    </c:if>

                                                    <c:if test="${orderUser.orderStatus ne 'COMPLETED' and orderUser.orderStatus ne 'CANCELLED'}">

                                                            <a href="orderstatus/cancel?id=${orderUser.orderId}"
                                                                    class="px-5 py-2 rounded-full border border-gray-300 text-gray-600 font-semibold hover:bg-white hover:border-amber-500 hover:text-amber-600 transition-all transition-all flex items-center gap-2">
                                                                <i class="fa-solid fa-ban"></i>
                                                                Cancelar
                                                            </a>
                                                        </form>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>


                            </c:forEach>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>

<script>
    // Funções para abrir e fechar o Modal de Pedidos
    function openOrdersModal() {
        const overlay = document.getElementById('ordersModalOverlay');
        const modal = document.getElementById('ordersModal');

        // Remove hidden e adiciona flex para centralizar
        overlay.classList.remove('hidden');
        modal.classList.remove('hidden');

        // Trava o scroll do body atrás
        document.body.style.overflow = 'hidden';
    }

    function closeOrdersModal() {
        const overlay = document.getElementById('ordersModalOverlay');
        const modal = document.getElementById('ordersModal');

        overlay.classList.add('hidden');
        modal.classList.add('hidden');

        // Destrava o scroll
        document.body.style.overflow = 'auto';
    }

    // Fechar ao clicar fora (no overlay)
    document.getElementById('ordersModalOverlay').addEventListener('click', function(e) {
        if (e.target === this) {
            closeOrdersModal();
        }
    });
</script>