<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="cartModalOverlay"
     class="hidden fixed inset-0 bg-black bg-opacity-60 z-40 transition-opacity transition-all duration-300">

    <div id="cartModal" class="hidden fixed inset-0 z-50 flex items-center justify-center p-4">

        <div class="bg-white rounded-3xl shadow-2xl max-w-lg w-full max-h-[90vh] flex flex-col transform transition-all scale-100 overflow-hidden">

            <div class="bg-gradient-to-r from-amber-600 to-orange-300 p-6 relative flex-shrink-0">
                <button onclick="closeCartModal()"
                        class="absolute top-4 right-4 text-white hover:text-yellow-900 transition-colors rounded-full p-1 w-8 h-8 flex items-center justify-center">
                    <i class="fa-solid fa-xmark"></i>
                </button>
                <h2 class="text-2xl font-bold text-white flex items-center gap-3">
                    <i class="fa-solid fa-bag-shopping"></i>
                    Seu Pedido
                </h2>
                <p class="text-yellow-50 mt-1 text-sm opacity-90">Confira suas delícias antes de finalizar.</p>
            </div>

            <div class="p-6 overflow-y-auto flex-1 custom-scrollbar">

                <c:choose>
                    <c:when test="${empty sessionScope.cart or empty sessionScope.cart.edibleOrder}">
                        <div class="flex flex-col items-center justify-center py-10 text-gray-400">
                            <i class="fa-solid fa-basket-shopping text-6xl mb-4 text-gray-200"></i>
                            <p class="text-lg font-medium">Seu carrinho está vazio.</p>
                            <p class="text-sm">Que tal escolher algo gostoso?</p>
                        </div>
                    </c:when>

                    <c:otherwise>
                        <ul class="space-y-4">
                            <c:forEach var="itemCart" items="${sessionScope.cart.edibleOrder}">
                                <li class="flex items-center gap-4 p-3 rounded-2xl border border-gray-100 hover:border-amber-200 hover:shadow-md transition-all group bg-white">

                                    <div class="h-16 w-16 flex-shrink-0 rounded-xl overflow-hidden bg-gray-100">
                                        <img src="${itemCart.ediblePhoto}" alt="${itemCart.edibleName}"
                                             class="h-full w-full object-cover">
                                    </div>

                                    <div class="flex-1 min-w-0">
                                        <p class="text-sm font-bold text-gray-800 truncate">${itemCart.edibleName}</p>
                                        <p class="text-xs text-gray-500 line-clamp-1">${itemCart.edibleDescription}</p>
                                        <p class="text-amber-600 font-bold text-sm mt-1">R$ ${itemCart.ediblePrice}</p>
                                    </div>

                                    <a href="cart?action=remove&id=${itemCart.edibleId}"
                                       class="p-2 text-gray-300 hover:text-red-500 rounded-full transition-all"
                                       title="Remover item">
                                        <i class="fa-solid fa-trash-can"></i>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="p-6 bg-gray-50 border-t border-gray-100 flex-shrink-0">

                <div class="flex justify-between items-end mb-6">
                    <span class="text-gray-500 font-medium">Total do Pedido</span>
                    <input class="hidden" type="text" value="${sessionScope.cart.total}" name="cartTotal">
                    <span class="text-3xl font-bold text-gray-800">
                        R$ <c:out value="${sessionScope.cart.total}" default="0,00"/>
                    </span>
                </div>

                <div class="flex gap-3">
                    <button onclick="closeCartModal()"
                            class="px-6 py-3 rounded-full border border-gray-300 text-gray-600 font-semibold hover:bg-white hover:border-amber-500 hover:text-amber-600 transition-all">
                        Continuar Comprando
                    </button>

                    <form action="order/create" method="post" class="flex-1">
                        <button type="submit"
                                class="flex-1 px-6 py-3 bg-yellow-800 text-white font-semibold rounded-full hover:bg-yellow-700 transition-all shadow-md hover:shadow-lg"
                        ${empty sessionScope.cart.edibleOrder ? 'disabled' : ''}>
                            <span>Fazer Pedido</span>
                            <i class="fa-solid fa-arrow-right"></i>
                        </button>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>
<script>
    function openCartModal() {
        const overlay = document.getElementById('cartModalOverlay');
        const modal = document.getElementById('cartModal');

        overlay.classList.remove('hidden');
        modal.classList.remove('hidden');
    }

    function closeCartModal() {
        const overlay = document.getElementById('cartModalOverlay');
        const modal = document.getElementById('cartModal');

        overlay.classList.add('hidden');
        modal.classList.add('hidden');
    }

    document.getElementById('cartModalOverlay').addEventListener('click', function (e) {
        if (e.target === this) {
            closeCartModal();
        }
    });
    window.addEventListener('DOMContentLoaded', (event) => {
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.get('cartOpen') === 'true') {
            openCartModal();

            window.history.replaceState({}, document.title, window.location.pathname);
        }
    });
</script>