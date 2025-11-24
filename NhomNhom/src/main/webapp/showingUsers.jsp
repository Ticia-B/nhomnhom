<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="pt-BR"/>

<main class="py-10 px-4 sm:px-6 bg-gradient-to-br from-orange-50 via-amber-50 to-orange-100 min-h-screen">
    <div class="max-w-7xl mx-auto mb-6">
        <a href="homeAdmin.jsp"
           class="inline-flex items-center px-5 py-2 bg-gradient-to-r from-orange-500 to-amber-500 text-white font-bold rounded-full shadow-md hover:shadow-lg hover:from-orange-600 hover:to-amber-600 transition-all transform hover:-translate-x-1">
            <i class="fa-solid fa-arrow-left mr-2"></i>
            Voltar
        </a>
    </div>

    <div class="max-w-7xl mx-auto bg-gradient-to-br from-white to-orange-50 rounded-[2rem] overflow-hidden">

        <div class="p-8 border-b border-orange-100 bg-gradient-to-r from-orange-400 to-amber-500">
            <h1 class="text-4xl font-black text-white">Gerenciamento de Usuários</h1>
            <p class="text-orange-100 mt-2 text-lg font-semibold">Visualize e gerencie todos os usuários do sistema com
                carinho!</p>
        </div>

        <div class="bg-orange-50 px-6 pt-6 border-b border-orange-100">
            <nav class="flex gap-4 -mb-px" aria-label="Tabs">
                <button onclick="switchTab('clients')"
                        class="tab-button group relative py-4 px-8 rounded-t-[2rem] font-bold text-base transition-all transform duration-200"
                        data-tab="clients">
                    <i class="fa-solid fa-users mr-2 text-lg"></i>
                    Clientes
                    <span class="ml-3 bg-white text-orange-600 py-1 px-4 rounded-full text-sm font-black group-hover:scale-110 transition-transform">${usersClient.size()}</span>
                </button>

                <button onclick="switchTab('employees')"
                        class="tab-button group relative py-4 px-8 rounded-t-[2rem] font-bold text-base transition-all transform duration-200"
                        data-tab="employees">
                    <i class="fa-solid fa-user-tie mr-2 text-lg"></i>
                    Funcionários
                    <span class="ml-3 bg-white text-orange-600 py-1 px-4 rounded-full text-sm font-black group-hover:scale-110 transition-transform">${usersEmployee.size()}</span>
                </button>

                <button onclick="switchTab('admins')"
                        class="tab-button group relative py-4 px-8 rounded-t-[2rem] font-bold text-base transition-all transform duration-200"
                        data-tab="admins">
                    <i class="fa-solid fa-user-shield mr-2 text-lg"></i>
                    Administradores
                    <span class="ml-3 bg-white text-orange-600 py-1 px-4 rounded-full text-sm font-black group-hover:scale-110 transition-transform">${usersAdmin.size()}</span>
                </button>
            </nav>
        </div>

        <div class="p-8 min-h-[500px]">

            <div id="clients-tab" class="tab-content hidden">
                <div class="mb-6 flex justify-between items-center">
                    <h2 class="text-2xl font-black text-orange-600 flex items-center gap-3">
                        Lista de Clientes
                    </h2>
                    <button class="px-6 py-3 bg-gradient-to-r from-orange-500 to-amber-500 hover:from-orange-600 hover:to-amber-600 text-white font-bold rounded-full transition-all transform hover:scale-105 flex items-center gap-2"
                            onclick="openModal()"
                    >
                        <i class="fa-solid fa-plus"></i> Novo Cliente
                    </button>
                </div>

                <div class="overflow-hidden rounded-[2rem] border border-orange-100 bg-white">
                    <table class="min-w-full divide-y-4 divide-orange-100">
                        <thead class="bg-gradient-to-r from-orange-100 to-amber-100">
                        <tr>
                            <th class="px-6 py-5 text-left text-sm font-black text-orange-700 uppercase">Nome</th>
                            <th class="px-6 py-5 text-left text-sm font-black text-orange-700 uppercase">Email</th>
                            <th class="px-6 py-5 text-left text-sm font-black text-orange-700 uppercase">CPF</th>
                            <th class="px-6 py-5 text-left text-sm font-black text-orange-700 uppercase">Data Nasc.</th>
                            <th class="px-6 py-5 text-right text-sm font-black text-orange-700 uppercase">Ações</th>
                        </tr>
                        </thead>
                        <tbody class="bg-white divide-y-2 divide-orange-50">
                        <c:forEach var="c" items="${usersClient}">
                            <tr class="hover:bg-gradient-to-r hover:from-orange-50 hover:to-amber-50 transition-colors duration-200">
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="flex items-center">
                                        <div class="flex-shrink-0 h-12 w-12 bg-gradient-to-br from-orange-400 to-amber-500 rounded-full flex items-center justify-center border-2 border-orange-200 text-white font-black">
                                                ${c.userName.substring(0,1)}
                                        </div>
                                        <div class="ml-4 text-base font-bold text-gray-800">${c.userName}</div>
                                    </div>
                                </td>
                                <td class="px-6 py-4 text-sm font-semibold text-gray-600">${c.userEmail}</td>
                                <td class="px-6 py-4 text-sm font-medium text-gray-500">${c.userCpf}</td>
                                <td class="px-6 py-4 text-sm font-medium text-gray-500">
                                        ${c.userBirthDate.dayOfMonth}/${c.userBirthDate.monthValue}/${c.userBirthDate.year}
                                </td>
                                <td class="px-6 py-4 text-right text-sm font-medium whitespace-nowrap">
                                    <button class="text-amber-500 hover:text-amber-700 mx-2 transform hover:scale-110 transition-transform"
                                            onclick="openClientEditModal('${c.userId}', '${c.userName}', '${c.userEmail}', '${c.userPassword}', '${c.userCpf}', '${c.userBirthDate}')"
                                    ><i class="fa-solid fa-pen-to-square text-lg"></i></button>
                                    <a class="text-red-500 hover:text-red-700 mx-2 transform hover:scale-110 transition-transform"
                                       href="userclient/delete?id=${c.userId}">

                                        <i class="fa-solid fa-trash text-lg"></i></a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <div id="employees-tab" class="tab-content hidden">
                <div class="mb-6 flex justify-between items-center">
                    <h2 class="text-2xl font-black text-orange-600 flex items-center gap-3">
                        Lista de Funcionários
                    </h2>
                    <button
                            onclick="openEmployeeModal()"
                            class="px-6 py-3 bg-gradient-to-r from-orange-500 to-amber-500 hover:from-orange-600 hover:to-amber-600 text-white font-bold rounded-full transition-all transform hover:scale-105 flex items-center gap-2">
                        <i class="fa-solid fa-plus"></i> Novo Funcionário
                    </button>
                </div>
                <div class="overflow-hidden rounded-[2rem] border border-orange-100 bg-white">
                    <table class="min-w-full divide-y-4 divide-orange-100">
                        <thead class="bg-gradient-to-r from-orange-100 to-amber-100">
                        <tr>
                            <th class="px-6 py-5 text-left text-sm font-black text-orange-700 uppercase">Nome</th>
                            <th class="px-6 py-5 text-left text-sm font-black text-orange-700 uppercase">Email</th>
                            <th class="px-6 py-5 text-left text-sm font-black text-orange-700 uppercase">CPF</th>
                            <th class="px-6 py-5 text-left text-sm font-black text-orange-700 uppercase">Data Nasc.</th>
                            <th class="px-6 py-5 text-left text-sm font-black text-orange-700 uppercase">Cargo</th>
                            <th class="px-6 py-5 text-left text-sm font-black text-orange-700 uppercase">Salário</th>
                            <th class="px-6 py-5 text-right text-sm font-black text-orange-700 uppercase">Ações</th>
                        </tr>
                        </thead>
                        <tbody class="bg-white divide-y-2 divide-orange-50">
                        <c:forEach var="employee" items="${usersEmployee}">
                            <tr class="hover:bg-gradient-to-r hover:from-orange-50 hover:to-amber-50 transition-colors duration-200">
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="flex items-center">
                                        <div class="flex-shrink-0 h-12 w-12 bg-gradient-to-br from-blue-400 to-blue-600 rounded-full flex items-center justify-center border-2 border-blue-200 text-white font-black">
                                                ${employee.userName.substring(0,1)}
                                        </div>
                                        <div class="ml-4 text-base font-bold text-gray-800">${employee.userName}</div>
                                    </div>
                                </td>
                                <td class="px-6 py-4 text-sm font-semibold text-gray-600">${employee.userEmail}</td>
                                <td class="px-6 py-4 text-sm font-medium text-gray-500">${employee.userCpf}</td>
                                <td class="px-6 py-4 text-sm font-medium text-gray-500">
                                        ${employee.userBirthDate.dayOfMonth}/${employee.userBirthDate.monthValue}/${employee.userBirthDate.year}
                                </td>
                                <td class="px-6 py-4">
                                         <span class="px-3 py-1 text-xs font-bold rounded-full bg-green-100 text-green-600 border border-green-200">
                                            💼 ${employee.userEmployeePosition}
                                        </span>
                                </td>
                                <td class="px-6 py-4 text-sm font-black text-orange-600">
                                    <fmt:formatNumber value="${employee.userEmployeeSalary}" type="currency"/>
                                </td>
                                <td class="px-6 py-4 text-right text-sm font-medium whitespace-nowrap">
                                    <button class="text-amber-500 hover:text-amber-700 mx-2 transform hover:scale-110 transition-transform"
                                            onclick="openEditModalEmployee('${employee.userId}', '${employee.userName}', '${employee.userEmail}', '${employee.userPassword}', '${employee.userCpf}', '${employee.userBirthDate}', '${employee.userEmployeePosition}', '${employee.userEmployeeSalary}')">
                                        <i class="fa-solid fa-pen-to-square text-lg"></i></button>
                                    <a class="text-red-500 hover:text-red-700 mx-2 transform hover:scale-110 transition-transform"
                                       href="useremployee/delete?id=${employee.userId}">
                                        <i class="fa-solid fa-trash text-lg"></i></a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <div id="admins-tab" class="tab-content hidden">
                <div class="mb-6 flex justify-between items-center">
                    <h2 class="text-2xl font-black text-orange-600 flex items-center gap-3">
                        Lista de Administradores
                    </h2>
                    <button class="px-6 py-3 bg-gradient-to-r from-orange-500 to-amber-500 hover:from-orange-600 hover:to-amber-600 text-white font-bold rounded-full transition-all transform hover:scale-105 flex items-center gap-2"
                            onclick="openAdminModal()"
                    >
                        <i class="fa-solid fa-plus"></i> Novo Admin
                    </button>
                </div>
                <div class="overflow-hidden rounded-[2rem] border border-orange-100 bg-white">
                    <table class="min-w-full divide-y-4 divide-orange-100">
                        <thead class="bg-gradient-to-r from-orange-100 to-amber-100">
                        <tr>
                            <th class="px-6 py-5 text-left text-sm font-black text-orange-700 uppercase">Nome</th>
                            <th class="px-6 py-5 text-left text-sm font-black text-orange-700 uppercase">Email</th>
                            <th class="px-6 py-5 text-left text-sm font-black text-orange-700 uppercase">CPF</th>
                            <th class="px-6 py-5 text-left text-sm font-black text-orange-700 uppercase">Data Nasc.</th>
                            <th class="px-6 py-5 text-left text-sm font-black text-orange-700 uppercase">Status</th>
                            <th class="px-6 py-5 text-right text-sm font-black text-orange-700 uppercase">Ações</th>
                        </tr>
                        </thead>
                        <tbody class="bg-white divide-y-2 divide-orange-50">
                        <c:forEach var="admin" items="${usersAdmin}">
                            <tr class="hover:bg-gradient-to-r hover:from-orange-50 hover:to-amber-50 transition-colors duration-200">
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <div class="flex items-center">
                                        <div class="flex-shrink-0 h-12 w-12 bg-gradient-to-br from-purple-400 to-pink-500 rounded-full flex items-center justify-center border-2 border-purple-200 text-white font-black">
                                                ${admin.userName.substring(0,1)}
                                        </div>
                                        <div class="ml-4 text-base font-bold text-gray-800">${admin.userName}</div>
                                    </div>
                                </td>
                                <td class="px-6 py-4 text-sm font-semibold text-gray-600">${admin.userEmail}</td>
                                <td class="px-6 py-4 text-sm font-medium text-gray-500">${admin.userCpf}</td>
                                <td class="px-6 py-4 text-sm font-medium text-gray-500"> ${admin.userBirthDate.dayOfMonth}/${admin.userBirthDate.monthValue}/${admin.userBirthDate.year}</td>
                                <td class="px-6 py-4">
                                        <span class="px-3 py-1 text-xs font-bold rounded-full bg-purple-100 text-purple-600 border border-purple-200 flex items-center w-fit">
                                            <i class="fa-solid fa-crown mr-1 text-[10px]"></i> Admin
                                        </span>
                                </td>
                                <td class="px-6 py-4 text-right text-sm font-medium whitespace-nowrap">
                                    <button class="text-amber-500 hover:text-amber-700 mx-2 transform hover:scale-110 transition-transform"
                                            onclick="openEditModalAdmin('${admin.userId}', '${admin.userName}', '${admin.userEmail}', '${admin.userPassword}', '${admin.userCpf}', '${admin.userBirthDate}')">
                                        <i class="fa-solid fa-pen-to-square text-lg"></i>
                                    </button>
                                    <a class="text-red-500 hover:text-red-700 mx-2 transform hover:scale-110 transition-transform"
                                       href="useradmin/delete?id=${admin.userId}">
                                        <i class="fa-solid fa-trash text-lg"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</main>
<script src="usersTabNavigation.js"></script>
