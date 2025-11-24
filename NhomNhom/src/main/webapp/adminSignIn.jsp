<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div id="modalAdminOverlay"
     class="hidden fixed inset-0 bg-black bg-opacity-50 z-40 transition-opacity">
    <div id="cadastroAdminModal"
         class="hidden fixed inset-0 z-50 flex items-center justify-center p-4">
        <div class="bg-white rounded-2xl shadow-2xl max-w-2xl w-full max-h-[90vh] overflow-y-auto">

            <div class="bg-gradient-to-r from-amber-600 to-orange-300 p-6 rounded-t-2xl relative">
                <button onclick="closeAdminModal()"
                        class="absolute top-4 right-4 text-white hover:text-yellow-900 transition-colors">
                    <i class="fa-solid fa-xmark text-2xl"></i>
                </button>
                <h2 class="text-2xl font-bold text-white flex items-center gap-3">
                    <i class="fa-solid fa-user-shield"></i>
                    Novo Administrador
                </h2>
                <p class="text-yellow-50 mt-2">Cadastre um novo administrador no sistema.</p>
            </div>

            <form id="cadastroAdminForm"
                  class="p-6 space-y-4"
                  action="useradmin/create"
                  method="post">

                <div>
                    <label class="block text-gray-700 font-semibold mb-2">
                        <i class="fa-solid fa-user text-amber-600"></i> Nome Completo
                    </label>
                    <input
                            type="text"
                            name="adminName"
                            id="adminName"
                            required
                            placeholder="Nome do administrador"
                            class="w-full px-4 py-3 border-2 border-gray-200 rounded-full focus:border-amber-500 focus:outline-none transition-colors"
                    >
                </div>

                <div>
                    <label class="block text-gray-700 font-semibold mb-2">
                        <i class="fa-solid fa-envelope text-amber-600"></i> E-mail
                    </label>
                    <input
                            type="email"
                            name="adminEmail"
                            id="adminEmail"
                            required
                            placeholder="admin@nhomnhom.com"
                            class="w-full px-4 py-3 border-2 border-gray-200 rounded-full focus:border-amber-500 focus:outline-none transition-colors"
                    >
                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div>
                        <label class="block text-gray-700 font-semibold mb-2">
                            <i class="fa-solid fa-id-card text-amber-600"></i> CPF
                        </label>
                        <input
                                type="text"
                                name="adminCpf"
                                id="adminCpf"
                                required
                                placeholder="000.000.000-00"
                                maxlength="14"
                                oninput="mascaraCPF(this)"
                                class="w-full px-4 py-3 border-2 border-gray-200 rounded-full focus:border-amber-500 focus:outline-none transition-colors"
                        >
                    </div>

                    <div>
                        <label class="block text-gray-700 font-semibold mb-2">
                            <i class="fa-solid fa-cake-candles text-amber-600"></i> Data de Nascimento
                        </label>
                        <input
                                type="date"
                                id="adminBirthDate"
                                name="adminBirthDate"
                                required
                                class="w-full px-4 py-3 border-2 border-gray-200 rounded-full focus:border-amber-500 focus:outline-none transition-colors"
                        >
                    </div>
                </div>

                <div>
                    <label class="block text-gray-700 font-semibold mb-2">
                        <i class="fa-solid fa-lock text-amber-600"></i> Senha
                    </label>
                    <div class="relative">
                        <input
                                type="text"
                                id="adminPassword"
                                name="adminPassword"
                                required
                                placeholder="Mínimo 6 caracteres"
                                minlength="6"
                                class="w-full px-4 py-3 border-2 border-gray-200 rounded-full focus:border-amber-500 focus:outline-none transition-colors pr-12"
                        >
                    </div>
                </div>

                <div>
                    <label class="block text-gray-700 font-semibold mb-2">
                        <i class="fa-solid fa-lock text-amber-600"></i> Confirmar Senha
                    </label>
                    <div class="relative">
                        <input
                                type="password"
                                id="adminConfirmPassword"
                                name="adminConfirmPassword"
                                required
                                placeholder="Digite a senha novamente"
                                minlength="6"
                                class="w-full px-4 py-3 border-2 border-gray-200 rounded-full focus:border-amber-500 focus:outline-none transition-colors pr-12"
                        >
                    </div>
                </div>

                <div class="flex gap-3 pt-4 mt-4 border-t border-gray-200">
                    <button
                            type="button"
                            onclick="closeAdminModal()"
                            class="px-6 py-3 rounded-full border border-gray-300 text-gray-600 font-semibold hover:bg-white hover:border-amber-500 hover:text-amber-600 transition-all"
                    >
                        Cancelar
                    </button>
                    <button
                            name="action"
                            type="submit"
                            class="flex-1 px-6 py-3 bg-yellow-800 text-white font-semibold rounded-full hover:bg-yellow-500 transition-all shadow-md"
                    >
                        Salvar Admin
                    </button>
                </div>

            </form>
        </div>
    </div>
</div>
