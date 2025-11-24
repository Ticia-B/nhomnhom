<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div id="modalEditAdminOverlay"
     class="hidden fixed inset-0 bg-black bg-opacity-50 z-40 transition-opacity">
    <div id="cadastroEditAdminModal"
         class="hidden fixed inset-0 z-50 flex items-center justify-center p-4">
        <div class="bg-white rounded-2xl shadow-2xl max-w-2xl w-full max-h-[90vh] overflow-y-auto">

            <div class="bg-gradient-to-r from-amber-600 to-orange-300 p-6 rounded-t-2xl relative">
                <button onclick="closeAdminEditModal()"
                        class="absolute top-4 right-4 text-white hover:text-yellow-900 transition-colors">
                    <i class="fa-solid fa-xmark text-2xl"></i>
                </button>
                <h2 class="text-2xl font-bold text-white flex items-center gap-3">
                    <i class="fa-solid fa-user-shield"></i>
                    Novo Administrador
                </h2>
                <p class="text-yellow-50 mt-2">Edite as informações dos admins do sistema :3.</p>
            </div>

            <form id="cadastroEditAdminForm"
                  class="p-6 space-y-4"
                  action="useradmin/update"
                  method="post">

                <div>
                    <label class="block text-gray-700 font-semibold mb-2">
                        <i class="fa-solid fa-user text-amber-600"></i> Nome Completo
                    </label>
                    <input type="hidden" name="adminEditId" id="adminEditId">
                    <div>
                        <p class="text-xs text-gray-500 font-mono ml-2">ID do Cliente: <span id="spanAdminId"></span>
                        </p>
                    </div>
                    <input
                            type="text"
                            name="adminEditName"
                            id="adminEditName"
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
                            name="adminEditEmail"
                            id="adminEditEmail"
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
                                name="adminEditCpf"
                                id="adminEditCpf"
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
                                id="adminEditBirthDate"
                                name="adminEditBirthDate"
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
                                id="adminEditPassword"
                                name="adminEditPassword"
                                required
                                placeholder="Mínimo 6 caracteres"
                                minlength="6"
                                class="w-full px-4 py-3 border-2 border-gray-200 rounded-full focus:border-amber-500 focus:outline-none transition-colors pr-12"
                        >
                    </div>
                </div>

                <div class="flex gap-3 pt-4 mt-4 border-t border-gray-200">
                    <button
                            type="button"
                            onclick="closeAdminEditModal()"
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
<script>

    const editAdminOverlay = document.getElementById('modalEditAdminOverlay');
    const editAdminModalContent = document.getElementById('cadastroEditAdminModal');

    function openEditModalAdmin(id, name, email, password, cpf, birthDate) {
        console.log(id, name, email, password, cpf, birthDate);

        document.getElementById('adminEditId').value = id;
        document.getElementById('spanAdminId').innerText = id;

        document.getElementById('adminEditName').value = name;
        document.getElementById('adminEditEmail').value = email;
        document.getElementById('adminEditPassword').value = password;
        document.getElementById('adminEditBirthDate').value = birthDate;
        document.getElementById('adminEditCpf').value = cpf;
        if (birthDate) {
            document.getElementById('adminEditBirthDate').value = birthDate;
        }


        editAdminOverlay.classList.remove('hidden');
        editAdminModalContent.classList.remove('hidden');
    }

    function closeAdminEditModal() {
        if (!editAdminOverlay || !editAdminModalContent) return;

        editAdminOverlay.classList.add('bg-opacity-0');
        editAdminOverlay.classList.add('hidden');
        editAdminOverlay.classList.add('hidden');
        editAdminOverlay.classList.remove('bg-opacity-0');
    }

    if (editAdminOverlay) {
        editAdminOverlay.addEventListener('click', (e) => {
            if (e.target === editEAdminOverlay) {
                closeAdminEditModal();
            }
        });
    }

    function togglePassword(inputId, iconId) {
        const input = document.getElementById(inputId);
        const icon = document.getElementById(iconId);

        if (input.type === 'password') {
            input.type = 'text';
            icon.classList.remove('fa-eye');
            icon.classList.add('fa-eye-slash');
        } else {
            input.type = 'password';
            icon.classList.remove('fa-eye-slash');
            icon.classList.add('fa-eye');
        }
    }

    function mascaraCPF(i) {
        var v = i.value;
        if (isNaN(v[v.length - 1])) {
            i.value = v.substring(0, v.length - 1);
            return;
        }
        i.setAttribute("maxlength", "14");
        if (v.length == 3 || v.length == 7) i.value += ".";
        if (v.length == 11) i.value += "-";
    }
</script>
