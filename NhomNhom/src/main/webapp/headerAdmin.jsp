<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<header class="bg-gradient-to-r from-amber-600 to-orange-300 shadow-lg">
    <ul class="flex items-center justify-between px-6 py-3 max-w-7xl mx-auto">
        <li class="flex-shrink-0">
            <img src="titleNhomNhom.svg"
                 alt="NhomNhom"
                 class="h-12 w-auto">
        </li>

        <li class="flex-1 mx-8 max-w-2xl">
            <div class="flex items-center bg-white rounded-full overflow-hidden shadow-sm w-full">

                <form action="search" method="POST" class="flex w-full">
                    <input type="text"
                           name="search"
                           id="search"
                           placeholder="Buscar produtos..."
                           class="flex-1 px-6 py-3 outline-none text-gray-700"
                    >

                    <button type="submit"
                            class="px-6 py-3 bg-yellow-800 hover:bg-yellow-500 transition-colors"
                    >
                        <i class="fa-solid fa-magnifying-glass text-white"></i>
                    </button>
                </form>
            </div>
        </li>

        <li class="ml-auto flex items-center gap-4">
            <button id="employeeBell"
                    onclick="openNotificationModal()"
                    class="relative p-3 rounded-full hover:bg-white hover:bg-opacity-20 transition-all group">
                <i class="fa-solid fa-bell text-white text-xl group-hover:text-yellow-900 transition-all"></i>
                <c:if test="${not empty sessionScope.ordersPending and sessionScope.ordersPending.size() > 0}">
            <span class="absolute top-0 right-0 translate-x-1 -translate-y-1 flex h-5 w-5 items-center justify-center rounded-full bg-red-600 text-xs font-bold text-white">
                    ${sessionScope.ordersPending.size()}
            </span>
                </c:if>
            </button>

            <div id="logged" class="relative">
                <button onclick="toggleProfileDropdown()"
                        class="flex items-center gap-2 p-1 hover:bg-white hover:bg-yellow-800 rounded-full transition-all border-2 border-transparent focus:border-white">
                    <div class="h-10 w-10 rounded-full bg-gradient-to-br from-violet-300 to-purple-600 flex items-center justify-center text-white font-black text-xl">
                        ${userLogged.userName.substring(0,2)}
                    </div>
                    <script>
                        function toggleProfileDropdown() {
                            const dropdown = document.getElementById('profileDropdown');
                            dropdown.classList.toggle('hidden');
                        }

                        window.addEventListener('click', function (e) {
                            const loggedDiv = document.getElementById('logged');
                            const dropdown = document.getElementById('profileDropdown');

                            if (!loggedDiv.contains(e.target)) {
                                if (!dropdown.classList.contains('hidden')) {
                                    dropdown.classList.add('hidden');
                                }
                            }
                        });
                    </script>
                </button>

                <div id="profileDropdown"
                     class="hidden absolute right-0 mt-2 w-48 bg-white rounded-xl shadow-2xl py-2 z-50 border border-orange-100 animation-fade-in">

                    <div class="border-t border-gray-100 my-1"></div>
                    <a href="loggout"
                       class="block px-4 py-2 text-sm text-red-600 hover:bg-red-50 transition-colors flex items-center gap-2">
                        <i class="fa-solid fa-right-from-bracket"></i>
                        Sair
                    </a>
                </div>
            </div>

        </li>
    </ul>

    <nav class="bg-gradient-to-r from-amber-600 to-orange-300 border-t border-yellow-700 border-opacity-15">
        <ul class="flex items-center justify-between px-6 py-1.5 max-w-7xl mx-auto">
            <li>
                <button id="all"
                        onclick="filterCards('all')"
                        class="flex items-center gap-2 px-3 py-1.5 rounded-lg transition-all group hover:bg-white hover:bg-opacity-20">
                    <i class="fa-solid fa-store text-base text-white group-hover:text-yellow-900"></i>
                    <span class="text-sm font-semibold text-white group-hover:text-yellow-900">Tudo</span>
                </button>
            </li>

            <li>
                <button id="desserts"
                        onclick="filterCards('DESSERT')"
                        class="flex items-center gap-2 px-3 py-1.5 rounded-lg transition-all group hover:bg-white hover:bg-opacity-20">
                    <i class="fa-solid fa-ice-cream text-base text-white group-hover:text-yellow-900"></i>
                    <span class="text-sm font-semibold text-white group-hover:text-yellow-900">Sobremesas</span>
                </button>
            </li>

            <li>
                <button id="drinks"
                        onclick="filterCards('DRINK')"
                        class="flex items-center gap-2 px-3 py-1.5 rounded-lg transition-all group hover:bg-white hover:bg-opacity-20">
                    <i class="fa-solid fa-mug-hot text-base text-white group-hover:text-yellow-900"></i>
                    <span class="text-sm font-semibold text-white group-hover:text-yellow-900">Bebidas</span>
                </button>
            </li>

            <li>
                <button id="savories"
                        onclick="filterCards('SAVORY')"
                        class="flex items-center gap-2 px-3 py-1.5 rounded-lg transition-all group hover:bg-white hover:bg-opacity-20">
                    <i class="fa-solid fa-pizza-slice text-base text-white group-hover:text-yellow-900"></i>
                    <span class="text-sm font-semibold text-white group-hover:text-yellow-900">Salgados</span>
                </button>
            </li>

            <li>
                <button id="snacks"
                        onclick="filterCards('SNACK')"
                        class="flex items-center gap-2 px-3 py-1.5 rounded-lg transition-all group hover:bg-white hover:bg-opacity-20">
                    <i class="fa-solid fa-burger text-base text-white group-hover:text-yellow-900"></i>
                    <span class="text-sm font-semibold text-white group-hover:text-yellow-900">Lanches</span>
                </button>
            </li>

            <li>
                <a id="orders"
                   href="employeeOrders.jsp"
                        class="flex items-center gap-2 px-3 py-1.5 rounded-lg transition-all group hover:bg-white hover:bg-opacity-20">
                    <i class="fa-solid fa-clipboard-list text-base text-white group-hover:text-yellow-900"></i>
                    <span class="text-sm font-semibold text-white group-hover:text-yellow-900">Pedidos</span>
                </a>
            </li>
            <li>
                <a id="users"
                   href="adminUsers.jsp"
                   class="flex items-center gap-2 px-3 py-1.5 rounded-lg transition-all group hover:bg-white hover:bg-opacity-20">
                    <i class="fa-solid fa-users text-base text-white group-hover:text-yellow-900"></i>
                    <span class="text-sm font-semibold text-white group-hover:text-yellow-900">Usuários</span>
                </a>
            </li>
        </ul>
    </nav>
</header>
<script src="showindUsersOrNo.js"></script>
<script src="signInModalScript.js"></script>
<script src="filterProduts.js"></script>