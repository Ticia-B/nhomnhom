<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div id="modalEmployeeOverlay"
     class="hidden fixed inset-0 bg-black bg-opacity-50 z-40 transition-opacity">
    <div id="cadastroEmployeeModal"
         class="hidden fixed inset-0 z-50 flex items-center justify-center p-4">
        <div class="bg-white rounded-2xl shadow-2xl max-w-2xl w-full max-h-[90vh] overflow-y-auto">

            <div class="bg-gradient-to-r from-amber-600 to-orange-300 p-6 rounded-t-2xl relative">
                <button onclick="closeEmployeeModal()"
                        class="absolute top-4 right-4 text-white hover:text-yellow-200 transition-colors">
                    <i class="fa-solid fa-xmark text-2xl"></i>
                </button>
                <h2 class="text-2xl font-bold text-white flex items-center gap-3">
                    <i class="fa-solid fa-user-tie"></i>
                    Novo Funcionário
                </h2>
                <p class="text-yellow-50 mt-2">Preencha os dados para cadastrar um colaborador no NhomNhom.</p>
            </div>

            <form id="cadastroEmployeeForm"
                  class="p-6 space-y-4"
                  action="useremployee/create"
                  method="post">

                <div>
                    <label class="block text-gray-700 font-semibold mb-2">
                        <i class="fa-solid fa-user text-amber-600"></i> Nome Completo
                    </label>
                    <input
                            type="text"
                            name="name"
                            id="empName"
                            required
                            placeholder="Nome do funcionário"
                            class="w-full px-4 py-3 border-2 border-gray-200 rounded-full focus:border-amber-500 focus:outline-none transition-colors"
                    >
                </div>

                <div>
                    <label class="block text-gray-700 font-semibold mb-2">
                        <i class="fa-solid fa-envelope text-amber-600"></i> E-mail Corporativo/Pessoal
                    </label>
                    <input
                            type="email"
                            name="email"
                            id="empEmail"
                            required
                            placeholder="funcionario@email.com"
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
                                name="cpf"
                                id="empCpf"
                                required
                                placeholder="000.000.000-00"
                                maxlength="14"
                                oninput="mascaraCPF(this)"
                                class="w-full px-4 py-3 border-2 border-gray-200 rounded-full focus:border-amber-500 focus:outline-none transition-colors"
                        >
                    </div>

                    <div>
                        <label class="block text-gray-700 font-semibold mb-2">
                            <i class="fa-solid fa-calendar text-amber-600"></i> Data de Nascimento
                        </label>
                        <input
                                type="date"
                                id="empBirthDate"
                                name="birthDate"
                                required
                                class="w-full px-4 py-3 border-2 border-gray-200 rounded-full focus:border-amber-500 focus:outline-none transition-colors"
                        >
                    </div>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div>
                        <label class="block text-gray-700 font-semibold mb-2">
                            <i class="fa-solid fa-briefcase text-amber-600"></i> Cargo / Função
                        </label>
                        <input
                                type="text"
                                name="userEmployeePosition"
                                id="userEmployeePosition"
                                required
                                placeholder="Ex: Gerente, Atendente"
                                class="w-full px-4 py-3 border-2 border-gray-200 rounded-full focus:border-amber-500 focus:outline-none transition-colors"
                        >
                    </div>

                    <div>
                        <label class="block text-gray-700 font-semibold mb-2">
                            <i class="fa-solid fa-money-bill-wave text-amber-600"></i> Salário (R$)
                        </label>
                        <input
                                type="number"
                                name="userEmployeeSalary"
                                id="userEmployeeSalary"
                                required
                                placeholder="0.00"
                                step="0.01"
                                min="0"
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
                                type="password"
                                id="empPassword"
                                name="password"
                                required
                                placeholder="Defina uma senha provisória"
                                minlength="6"
                                class="w-full px-4 py-3 border-2 border-gray-200 rounded-full focus:border-amber-500 focus:outline-none transition-colors pr-12"
                        >
                        <button
                                type="button"
                                onclick="togglePassword('empPassword', 'eyeIconEmp1')"
                                class="absolute right-3 top-1/2 transform -translate-y-1/2 text-gray-500 hover:text-amber-600"
                        >
                            <i id="eyeIconEmp1" class="fa-solid fa-eye"></i>
                        </button>
                    </div>
                </div>

                <div>
                    <label class="block text-gray-700 font-semibold mb-2">
                        <i class="fa-solid fa-lock text-amber-600"></i> Confirmar Senha
                    </label>
                    <div class="relative">
                        <input
                                type="text"
                                id="empConfirmPassword"
                                name="confirmPassword"
                                required
                                placeholder="Repita a senha"
                                minlength="6"
                                class="w-full px-4 py-3 border-2 border-gray-200 rounded-full focus:border-amber-500 focus:outline-none transition-colors pr-12"
                        >
                        <button
                                type="button"
                                onclick="togglePassword('empConfirmPassword', 'eyeIconEmp2')"
                                class="absolute right-3 top-1/2 transform -translate-y-1/2 text-gray-500 hover:text-amber-600"
                        >
                            <i id="eyeIconEmp2" class="fa-solid fa-eye"></i>
                        </button>
                    </div>
                </div>

                <div class="flex gap-3 pt-4 border-t border-gray-200 mt-4">
                    <button
                            type="button"
                            onclick="closeEmployeeModal()"
                            class="px-6 py-3 rounded-full border border-gray-300 text-gray-600 font-semibold hover:bg-white hover:border-amber-500 hover:text-amber-600 transition-all"
                    >
                        Cancelar
                    </button>
                    <button
                            name="action"
                            type="submit"
                            class="flex-1 px-6 py-3 bg-yellow-800 text-white font-semibold rounded-full hover:bg-yellow-500 transition-all shadow-md"
                    >
                        Salvar Funcionário
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    const modalEmployeeOverlay = document.getElementById('clientEditModalOverlay');
    const modalEmployeeContent = document.getElementById('clientEditModal');

    function openClientEditModal(id, name, email, password, cpf, birthDate) {

        document.getElementById('editClientIdInput').value = id;
        document.getElementById('spanClientId').innerText = id;
        document.getElementById('editClientName').value = name;
        document.getElementById('editClientEmail').value = email;
        document.getElementById('editClientPassword').value = password;
        document.getElementById('editClientCpf').value = cpf;

        document.getElementById('editClientBirthDate').value = birthDate;

        modalEmployeeOverlay.classList.remove('hidden');
        modalEmployeeContent.classList.remove('hidden');

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

    function closeClientEditModal() {
        modalEmployeeOverlay.classList.add('bg-opacity-0');
        setTimeout(() => {
            modalEmployeeOverlay.classList.add('hidden');
            modalEmployeeContent.classList.add('hidden');
        }, 300);
    }

    // Fecha ao clicar fora
    modalEmployeeOverlay.addEventListener('click', (e) => {
        if (e.target === modalEmployeeOverlay || e.target === modalEmployeeContent) {
            closeClientEditModal();
        }
    });
</script>