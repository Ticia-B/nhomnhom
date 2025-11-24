<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="pt-BR"/>

<div id="notificationModalOverlay"
     class="hidden fixed inset-0 bg-black bg-opacity-20 z-40 transition-opacity duration-300"></div>

<div id="notificationModal" class="hidden absolute z-50 w-full max-w-md animate-fade-in-down origin-top">

    <div class="bg-white rounded-3xl shadow-2xl overflow-hidden border border-orange-100 mx-4 sm:mx-0">

        <div class="bg-gradient-to-r from-amber-500 to-orange-400 p-4 relative flex-shrink-0">
            <button onclick="closeNotificationModal()"
                    class="absolute top-3 right-3 text-white hover:text-yellow-900 transition-colors rounded-full p-1 w-7 h-7 flex items-center justify-center">
                <i class="fa-solid fa-xmark text-sm"></i>
            </button>
            <h2 class="text-lg font-black text-white flex items-center gap-2">
                <i class="fa-solid fa-bell"></i>
                Novos Pedidos
            </h2>
            <p class="text-yellow-50 text-xs font-semibold opacity-90">Gerencie a entrada de pedidos.</p>
        </div>

        <div class="p-4 overflow-y-auto max-h-[60vh] custom-scrollbar bg-gray-50">

            <c:choose>
                <c:when test="${empty ordersPending}">
                    <div class="flex flex-col items-center justify-center py-8 text-gray-400">
                        <div class="h-12 w-12 bg-gray-200 rounded-full flex items-center justify-center mb-2">
                            <i class="fa-solid fa-check text-xl text-gray-400"></i>
                        </div>
                        <p class="text-sm font-bold text-gray-500">Tudo tranquilo!</p>
                    </div>
                </c:when>

                <c:otherwise>
                    <ul class="space-y-3">
                        <c:forEach var="order" items="${ordersPending}">
                            <li class="bg-white rounded-2xl p-3 shadow-sm border border-gray-200 hover:border-orange-300 transition-all">

                                <div class="flex justify-between items-start mb-2">
                                    <div class="flex items-center gap-2">
                                        <div class="h-8 w-8 rounded-full bg-gradient-to-br from-orange-100 to-amber-200 flex items-center justify-center text-orange-700 font-black text-xs">
                                                ${order.user.userName.substring(0,1)}
                                        </div>
                                        <div>
                                            <h3 class="text-xs font-bold text-gray-800">${order.user.userName}</h3>
                                            <span class="text-[10px] text-gray-400 font-medium">#${order.orderId}</span>
                                        </div>
                                    </div>
                                    <div class="text-right">
                                        <p class="text-xs font-black text-green-600">
                                            <fmt:formatNumber value="${order.total}" type="currency"/>
                                        </p>
                                    </div>
                                </div>

                                <button onclick="toggleOrderDetails('${order.orderId}')"
                                        class="w-full flex items-center justify-between px-3 py-1.5 bg-gray-50 rounded-lg text-[10px] font-bold text-gray-500 hover:bg-orange-50 hover:text-orange-600 transition-colors group mb-2">
                                    <span>Ver ${order.edibleOrder.size()} itens</span>
                                    <i id="icon-${order.orderId}"
                                       class="fa-solid fa-chevron-down transition-transform duration-300 group-hover:translate-y-0.5"></i>
                                </button>

                                <div id="details-${order.orderId}"
                                     class="hidden mb-2 border-t border-dashed border-gray-200 pt-2">
                                    <ul class="space-y-1">
                                        <c:forEach var="item" items="${order.edibleOrder}">
                                            <li class="flex justify-between items-center text-[10px]">
                                                <span class="text-gray-600 font-medium truncate w-32">
                                                    - ${item.edibleName}
                                                </span>
                                                <span class="text-gray-800 font-bold">
                                                    <fmt:formatNumber value="${item.ediblePrice}" type="currency"/>
                                                </span>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>

                                <div class="flex gap-2 pt-2 border-t border-gray-100">
                                    <a href="orderstatus/cancel?id=${order.orderId}"
                                       class="flex-1 py-1.5 rounded-full border border-gray-300 text-gray-600 font-semibold hover:bg-white hover:border-red-500 hover:text-red-600 transition-all font-bold text-[10px] flex items-center justify-center gap-1 transition-all">
                                        <i class="fa-solid fa-xmark"></i> Cancelar
                                    </a>

                                    <a href="orderstatus/approve?id=${order.orderId}"
                                       class="flex-1 py-1.5 rounded-full bg-gradient-to-r from-green-500 to-emerald-500 text-white font-bold text-[10px] flex items-center justify-center gap-1 shadow hover:shadow-md hover:from-green-600 hover:to-emerald-600 transition-all">
                                        <i class="fa-solid fa-check"></i> Aceitar
                                    </a>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

<script>
    function openNotificationModal() {
        const overlay = document.getElementById('notificationModalOverlay');
        const modal = document.getElementById('notificationModal');
        const bellBtn = document.getElementById('employeeBell');

        if (!bellBtn) {
            console.error("Botão com id 'employeeBell' não encontrado no header!");
            return;
        }

        overlay.classList.remove('hidden');
        modal.classList.remove('hidden');

        const rect = bellBtn.getBoundingClientRect();
        const scrollX = window.scrollX || window.pageXOffset;
        const scrollY = window.scrollY || window.pageYOffset;

        const modalWidth = modal.offsetWidth;

        const topPos = rect.bottom + scrollY + 12;
        let leftPos = (rect.left + scrollX + (rect.width / 2)) - (modalWidth / 2);

        if (leftPos + modalWidth > window.innerWidth) {
            leftPos = window.innerWidth - modalWidth - 20;
        }

        modal.style.top = `\${topPos}px`;
        modal.style.left = `\${leftPos}px`;

        document.body.classList.add('overflow-hidden');
    }

    function closeNotificationModal() {
        const overlay = document.getElementById('notificationModalOverlay');
        const modal = document.getElementById('notificationModal');

        overlay.classList.add('hidden');
        modal.classList.add('hidden');
        document.body.classList.remove('overflow-hidden');
    }


    document.getElementById('notificationModalOverlay')?.addEventListener('click', function (e) {
        if (e.target === this) {
            closeNotificationModal();
        }
    });

    function toggleOrderDetails(orderId) {
        const detailsDiv = document.getElementById('details-' + orderId);
        const icon = document.getElementById('icon-' + orderId);

        if (detailsDiv.classList.contains('hidden')) {
            detailsDiv.classList.remove('hidden');
            detailsDiv.classList.add('block', 'animate-fade-in-down');
            icon.classList.remove('fa-chevron-down');
            icon.classList.add('fa-chevron-up');
        } else {
            detailsDiv.classList.add('hidden');
            detailsDiv.classList.remove('block', 'animate-fade-in-down');
            icon.classList.remove('fa-chevron-up');
            icon.classList.add('fa-chevron-down');
        }
    }
</script>
