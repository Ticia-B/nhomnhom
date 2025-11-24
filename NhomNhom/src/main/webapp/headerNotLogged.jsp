<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <li>
            <div id="not-logged"
                 class="flex gap-3">
                <button class="px-6 py-2 bg-white text-yellow-800 font-semibold rounded-full hover:bg-yellow-800 hover:text-white transition-all shadow-md"
                        onclick="openModalLogin()">
                    Entre
                </button>
                <button class="px-6 py-2 bg-yellow-800 text-white font-semibold rounded-full hover:bg-yellow-500 transition-all shadow-md"
                        onclick="openModal()"
                >
                    Cadastre-se
                </button>
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
        </ul>
    </nav>
</header>

<div id="modalOverlay"
     class="hidden fixed inset-0 bg-black bg-opacity-50 z-40 transition-opacity">
    <div id="cadastroModal"
         class="hidden fixed inset-0 z-50 flex items-center justify-center p-4">
        <div class="bg-white rounded-2xl shadow-2xl max-w-2xl w-full max-h-[90vh] overflow-y-auto">

            <div class="bg-gradient-to-r from-amber-600 to-orange-300 p-6 rounded-t-2xl relative">
                <button onclick="closeModal()"
                        class="absolute top-4 right-4 text-white hover:text-yellow-900 transition-colors">
                    <i class="fa-solid fa-xmark text-2xl"></i>
                </button>
                <h2 class="text-2xl font-bold text-white flex items-center gap-3">
                    <i class="fa-solid fa-user-plus"></i>
                    Cadastre-se no NhomNhom
                </h2>
                <p class="text-yellow-50 mt-2">Crie sua conta e aproveite nossos deliciosos produtos!</p>
            </div>
            <form id="cadastroForm"
                  class="p-6 space-y-4"
                  action="userclient/create"
                  method="post">

                <div>
                    <label class="block text-gray-700 font-semibold mb-2">
                        <i class="fa-solid fa-user text-amber-600"></i> Nome Completo
                    </label>
                    <input
                            type="text"
                            name="name"
                            id="name"
                            required
                            placeholder="Digite seu nome completo"
                            class="w-full px-4 py-3 border-2 border-gray-200 rounded-full focus:border-amber-500 focus:outline-none transition-colors"
                    >
                </div>

                <div>
                    <label class="block text-gray-700 font-semibold mb-2">
                        <i class="fa-solid fa-envelope text-amber-600"></i> E-mail
                    </label>
                    <input
                            type="email"
                            name="email"
                            id="email"
                            required
                            placeholder="seu@email.com"
                            class="w-full px-4 py-3 border-2 border-gray-200 rounded-full focus:border-amber-500 focus:outline-none transition-colors"
                    >
                </div>


                <div>
                    <label class="block text-gray-700 font-semibold mb-2">
                        <i class="fa-solid fa-id-card text-amber-600"></i> CPF
                    </label>
                    <input
                            type="text"
                            name="cpf"
                            id="cpf"
                            required
                            placeholder="000.000.000-00"
                            maxlength="14"
                            class="w-full px-4 py-3 border-2 border-gray-200 rounded-full focus:border-amber-500 focus:outline-none transition-colors"
                    >
                </div>

                <div>
                    <label class="block text-gray-700 font-semibold mb-2">
                        <i class="fa-solid fa-cake-candles text-amber-600"></i> Data de Nascimento
                    </label>
                    <input
                            type="date"
                            id="birthDate"
                            name="birthDate"
                            required
                            class="w-full px-4 py-3 border-2 border-gray-200 rounded-full focus:border-amber-500 focus:outline-none transition-colors"
                    >
                </div>

                <div>
                    <label class="block text-gray-700 font-semibold mb-2">
                        <i class="fa-solid fa-lock text-amber-600"></i> Senha
                    </label>
                    <div class="relative">
                        <input
                                type="password"
                                id="password"
                                name="password"
                                required
                                placeholder="Mínimo 6 caracteres"
                                minlength="6"
                                class="w-full px-4 py-3 border-2 border-gray-200 rounded-full focus:border-amber-500 focus:outline-none transition-colors pr-12"
                        >
                        <button
                                type="button"
                                onclick="togglePassword('password', 'eyeIcon1')"
                                class="absolute right-3 top-1/2 transform -translate-y-1/2 text-gray-500 hover:text-amber-600"
                        >
                            <i id="eyeIcon1"
                               class="fa-solid fa-eye"></i>
                        </button>
                    </div>
                </div>

                <div>
                    <label class="block text-gray-700 font-semibold mb-2">
                        <i class="fa-solid fa-lock text-amber-600"></i> Confirmar Senha
                    </label>
                    <div class="relative">
                        <input
                                type="password"
                                id="confirmPassword"
                                name="confirmPassword"
                                required
                                placeholder="Digite a senha novamente"
                                minlength="6"
                                class="w-full px-4 py-3 border-2 border-gray-200 rounded-full focus:border-amber-500 focus:outline-none transition-colors pr-12"
                        >
                        <button
                                type="button"
                                onclick="togglePassword('confirmPassword', 'eyeIcon2')"
                                class="absolute right-3 top-1/2 transform -translate-y-1/2 text-gray-500 hover:text-amber-600"
                        >
                            <i id="eyeIcon2" class="fa-solid fa-eye"></i>
                        </button>
                    </div>
                </div>

                <div class="flex items-start gap-3">
                    <input
                            type="checkbox"
                            id="terms"
                            required
                            class="mt-1 w-5 h-5 accent-amber-600 border-gray-300 rounded focus:ring-amber-500 cursor-pointer"
                    >
                    <label for="terms" class="text-sm text-gray-600">
                        Eu concordo com os <a href="#" class="text-amber-600 hover:text-amber-700 font-semibold">termos
                        de uso</a> e
                        <a href="#" class="text-amber-600 hover:text-amber-700 font-semibold">política de
                            privacidade</a>
                    </label>
                </div>

                <div class="flex gap-3 pt-4">
                    <button
                            type="button"
                            onclick="closeModal()"
                            class="px-6 py-3 rounded-full border border-gray-300 text-gray-600 font-semibold hover:bg-white hover:border-amber-500 hover:text-amber-600 transition-all"
                    >
                        Cancelar
                    </button>
                    <button
                            name="action"
                            type="submit"
                            class="flex-1 px-6 py-3 bg-yellow-800 text-white font-semibold rounded-full hover:bg-yellow-500 transition-all shadow-md"
                    >
                        Cadastrar
                    </button>
                </div>
                <div class="text-center pt-4 border-t border-gray-200">
                    <p class="text-gray-600">
                        Já tem uma conta?
                        <a href="#" class="text-amber-600 hover:text-amber-700 font-semibold">Faça login</a>
                    </p>
                </div>
            </form>
        </div>
    </div>
</div>

<div id="modalOverlayLogin"
     class="hidden fixed inset-0 bg-black bg-opacity-50 z-40 transition-opacity">
    <div id="loginModal"
         class="hidden fixed inset-0 z-50 flex items-center justify-center p-4">
        <div class="bg-white rounded-2xl shadow-2xl max-w-2xl w-full max-h-[90vh] overflow-y-auto">

            <div class="bg-gradient-to-r from-amber-600 to-orange-300 p-6 rounded-t-2xl relative">
                <button onclick="closeModalLogin()"
                        class="absolute top-4 right-4 text-white hover:text-yellow-900 transition-colors">
                    <i class="fa-solid fa-xmark text-2xl"></i>
                </button>
                <h2 class="text-2xl font-bold text-white flex items-center gap-3">
                    <i class="fa-solid fa-user-plus"></i>
                    Entre no NhomNhom
                </h2>
                <p class="text-yellow-50 mt-2">Digite seu email e senha para comprar comidinhas.</p>
            </div>
            <form id="loginForm"
                  class="p-6 space-y-4"
                  action="loginservlet"
                  method="post">
                <div>
                    <label class="block text-gray-700 font-semibold mb-2">
                        <i class="fa-solid fa-envelope text-amber-600"></i> E-mail
                    </label>
                    <input
                            type="email"
                            name="userLogin"
                            id="userLogin"
                            required
                            placeholder="seu@email.com"
                            class="w-full px-4 py-3 border-2 border-gray-200 rounded-full focus:border-amber-500 focus:outline-none transition-colors"
                    >
                </div>

                <div>
                    <label class="block text-gray-700 font-semibold mb-2">
                        <i class="fa-solid fa-lock text-amber-600"></i> Senha
                    </label>
                    <div class="relative">
                        <input
                                type="password"
                                id="passwordLogin"
                                name="passwordLogin"
                                required
                                placeholder="Mínimo 6 caracteres"
                                minlength="6"
                                class="w-full px-4 py-3 border-2 border-gray-200 rounded-full focus:border-amber-500 focus:outline-none transition-colors pr-12"
                        >
                        <button
                                type="button"
                                onclick="togglePassword('passwordLogin', 'eyeIconLogin')"
                                class="absolute right-3 top-1/2 transform -translate-y-1/2 text-gray-500 hover:text-amber-600"
                        >
                            <i id="eyeIconLogin"
                               class="fa-solid fa-eye"></i>
                        </button>
                    </div>
                </div>

                <div class="flex gap-3 pt-4">
                    <button
                            type="button"
                            onclick="closeModalLogin()"
                            class="px-6 py-3 rounded-full border border-gray-300 text-gray-600 font-semibold hover:bg-white hover:border-amber-500 hover:text-amber-600 transition-all"
                    >
                        Cancelar
                    </button>
                    <button
                            name="action"
                            type="submit"
                            class="flex-1 px-6 py-3 bg-yellow-800 text-white font-semibold rounded-full hover:bg-yellow-500 transition-all shadow-md"
                    >
                        Entrar
                    </button>
                </div>
                <div class="text-center pt-4 border-t border-gray-200">
                    <p class="text-gray-600">
                        Esqueceu sua senha? Clique
                        <a href="#" class="text-amber-600 hover:text-amber-700 font-semibold">aqui</a>
                    </p>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="signInModalScript.js"></script>
<script src="filterProduts.js"></script>
