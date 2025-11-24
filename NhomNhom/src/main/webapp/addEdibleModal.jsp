<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div id="edibleModalOverlay" class="hidden fixed inset-0 bg-black bg-opacity-50 z-40 transition-opacity">

    <div id="edibleModal" class="hidden fixed inset-0 z-50 flex items-center justify-center p-4">
        <div class="bg-white rounded-2xl shadow-2xl max-w-2xl w-full max-h-[90vh] overflow-y-auto transform transition-all scale-100">
            <div class="bg-gradient-to-r from-amber-600 to-orange-300 p-6 rounded-t-2xl relative">
                <button onclick="closeModal()"
                        class="absolute top-4 right-4 text-white hover:text-yellow-900 transition-colors">
                    <i class="fa-solid fa-xmark text-2xl"></i>
                </button>
                <h2 class="text-2xl font-bold text-white flex items-center gap-3">
                    <i class="fa-solid fa-burger"></i>
                    Novo Produto
                </h2>
                <p class="text-yellow-50 mt-2">Adicione um novo item delicioso ao cardápio.</p>
            </div>

            <form id="edibleForm" class="p-6 space-y-4" action="edible/create" method="post">
                <input type="hidden" name="edibleId" id="edibleId">
                <div>
                    <label class="block text-gray-700 font-semibold mb-2">
                        <i class="fa-solid fa-utensils text-amber-600"></i> Nome do Produto
                    </label>
                    <input
                            type="text"
                            name="edibleName"
                            id="edibleName"
                            required
                            placeholder="Ex: X-Bacon Especial"
                            maxlength="50"
                            class="w-full px-4 py-3 border-2 border-gray-200 rounded-full focus:border-amber-500 focus:outline-none transition-colors"
                    >
                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">

                    <div>
                        <label class="block text-gray-700 font-semibold mb-2">
                            <i class="fa-solid fa-sack-dollar text-amber-600"></i> Preço (R$)
                        </label>
                        <input
                                type="number"
                                step="0.01"
                                name="ediblePrice"
                                id="ediblePrice"
                                required
                                placeholder="0,00"
                                class="w-full px-4 py-3 border-2 border-gray-200 rounded-full focus:border-amber-500 focus:outline-none transition-colors"
                        >
                    </div>

                    <div>
                        <label class="block text-gray-700 font-semibold mb-2">
                            <i class="fa-solid fa-tags text-amber-600"></i> Categoria
                        </label>
                        <div class="relative">
                            <select
                                    name="productCategory"
                                    id="productCategory"
                                    required
                                    class="w-full px-4 py-3 border-2 border-gray-200 rounded-full focus:border-amber-500 focus:outline-none transition-colors appearance-none bg-white"
                            >
                                <option value="" disabled selected>Selecione...</option>
                                <option value="SNACK">Lanche</option>
                                <option value="DRINK">Bebida</option>
                                <option value="DESSERT">Sobremesa</option>
                                <option value="SAVORY">Salgado</option>
                            </select>
                            <div class="absolute inset-y-0 right-0 flex items-center px-4 pointer-events-none text-gray-500">
                                <i class="fa-solid fa-chevron-down text-xs"></i>
                            </div>
                        </div>
                    </div>
                </div>

                <div>
                    <label class="block text-gray-700 font-semibold mb-2">
                        <i class="fa-solid fa-image text-amber-600"></i> URL da Imagem
                    </label>
                    <input
                            type="text"
                            name="ediblePhoto"
                            id="ediblePhoto"
                            required
                            placeholder="https://exemplo.com/imagem.jpg"
                            class="w-full px-4 py-3 border-2 border-gray-200 rounded-full focus:border-amber-500 focus:outline-none transition-colors"
                    >
                    <p class="text-xs text-gray-400 mt-1 ml-2">Cole o link da imagem do produto.</p>
                </div>

                <div>
                    <label class="block text-gray-700 font-semibold mb-2">
                        <i class="fa-solid fa-align-left text-amber-600"></i> Descrição
                    </label>
                    <textarea
                            name="edibleDescription"
                            id="edibleDescription"
                            required
                            rows="3"
                            placeholder="Descreva os ingredientes e detalhes do produto..."
                            maxlength="300"
                            class="w-full px-4 py-3 border-2 border-gray-200 rounded-2xl focus:border-amber-500 focus:outline-none transition-colors resize-none"
                    ></textarea>
                </div>

                <div class="flex gap-3 pt-4 border-t border-gray-200 mt-6">
                    <button
                            type="button"
                            onclick="closeModal()"
                            class="px-6 py-3 rounded-full border border-gray-300 text-gray-600 font-semibold hover:bg-white hover:border-amber-500 hover:text-amber-600 transition-all"
                    >
                        Cancelar
                    </button>
                    <button
                            type="submit"
                            class="flex-1 px-6 py-3 bg-yellow-800 text-white font-semibold rounded-full hover:bg-yellow-700 transition-all shadow-md hover:shadow-lg"
                    >
                        Salvar Produto
                    </button>
                </div>

            </form>
        </div>
    </div>
</div>
<script src="edibleModal.js"></script>