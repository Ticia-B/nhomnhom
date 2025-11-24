<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div id="clientEditModalOverlay" class="hidden fixed inset-0 bg-black bg-opacity-50 z-40 transition-opacity">

    <div id="clientEditModal" class="hidden fixed inset-0 z-50 flex items-center justify-center p-4">
        <div class="bg-white rounded-2xl shadow-2xl max-w-2xl w-full max-h-[90vh] overflow-y-auto transform transition-all scale-100">

            <div class="bg-gradient-to-r from-amber-600 to-orange-300 p-6 rounded-t-2xl relative">
                <button onclick="closeClientEditModal()"
                        class="absolute top-4 right-4 text-white hover:text-yellow-900 transition-colors">
                    <i class="fa-solid fa-xmark text-2xl"></i>
                </button>
                <h2 class="text-2xl font-bold text-white flex items-center gap-3">
                    <i class="fa-solid fa-user-pen"></i>
                    Editar Cliente
                </h2>
                <p class="text-yellow-50 mt-2">Atualize dados do cliente :3</p>
            </div>

            <form id="editClientForm" class="p-6 space-y-4" action="userclient/update" method="post">

                <input type="hidden" name="clientId" id="editClientIdInput">
                <div>
                    <p class="text-xs text-gray-500 font-mono ml-2">ID do Cliente: <span id="spanClientId"></span></p>
                </div>

                <div>
                    <label class="block text-gray-700 font-semibold mb-2">
                        <i class="fa-solid fa-user text-amber-600"></i> Nome Completo
                    </label>
                    <input
                            type="text"
                            name="clientName"
                            id="editClientName"
                            required
                            placeholder="Seu nome completo"
                            maxlength="100"
                            class="w-full px-4 py-3 border-2 border-gray-200 rounded-full focus:border-amber-500 focus:outline-none transition-colors"
                    >
                </div>

                <div>
                    <label class="block text-gray-700 font-semibold mb-2">
                        <i class="fa-solid fa-envelope text-amber-600"></i> E-mail
                    </label>
                    <input
                            type="email"
                            name="clientEmail"
                            id="editClientEmail"
                            required
                            placeholder="exemplo@email.com"
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
                                name="clientCpf"
                                id="editClientCpf"
                                required
                                placeholder="000.000.000-00"
                                maxlength="14"
                                class="w-full px-4 py-3 border-2 border-gray-200 rounded-full focus:border-amber-500 focus:outline-none transition-colors"
                        >
                    </div>

                    <div>
                        <label class="block text-gray-700 font-semibold mb-2">
                            <i class="fa-solid fa-cake-candles text-amber-600"></i> Nascimento
                        </label>
                        <input
                                type="date"
                                name="clientBirthDate"
                                id="editClientBirthDate"
                                required
                                class="w-full px-4 py-3 border-2 border-gray-200 rounded-full focus:border-amber-500 focus:outline-none transition-colors appearance-none bg-white"
                        >
                    </div>
                </div>
                <div>
                    <label class="block text-gray-700 font-semibold mb-2">
                        <i class="fa-solid fa-lock text-amber-600"></i> Nova Senha
                    </label>
                    <input
                            type="text"
                            name="clientPassword"
                            id="editClientPassword"
                            class="w-full px-4 py-3 border-2 border-gray-200 rounded-full focus:border-amber-500 focus:outline-none transition-colors"
                    >
                </div>

                <div class="flex gap-3 pt-4 border-t border-gray-200 mt-6">
                    <button
                            type="button"
                            onclick="closeClientEditModal()"
                            class="px-6 py-3 rounded-full border border-gray-300 text-gray-600 font-semibold hover:bg-white hover:border-amber-500 hover:text-amber-600 transition-all"
                    >
                        Cancelar
                    </button>
                    <button
                            type="submit"
                            class="flex-1 px-6 py-3 bg-yellow-800 text-white font-semibold rounded-full hover:bg-yellow-700 transition-all shadow-md hover:shadow-lg"
                    >
                        Salvar Alterações
                    </button>
                </div>

            </form>
        </div>
    </div>
</div>

<script>
    const modalEditOverlay = document.getElementById('clientEditModalOverlay');
    const modalContent = document.getElementById('clientEditModal');

    function openClientEditModal(id, name, email, password, cpf, birthDate) {
        document.getElementById('editClientIdInput').value = id;
        document.getElementById('spanClientId').innerText = id;
        document.getElementById('editClientName').value = name;
        document.getElementById('editClientEmail').value = email;
        document.getElementById('editClientPassword').value = password;
        document.getElementById('editClientCpf').value = cpf;
        document.getElementById('editClientBirthDate').value = birthDate;

        modalEditOverlay.classList.remove('hidden');
        modalContent.classList.remove('hidden');

        modalOverlay.classList.remove('bg-opacity-0');
    }

    function closeClientEditModal() {
        modalEditOverlay.classList.add('bg-opacity-0');

        modalEditOverlay.classList.add('hidden');
        modalContent.classList.add('hidden');

        modalEditOverlay.classList.remove('bg-opacity-0');
    }

    modalEditOverlay.addEventListener('click', (e) => {
        if (e.target === modalOverlay || e.target === modalContent) {
            closeClientEditModal();
        }
    });
</script>