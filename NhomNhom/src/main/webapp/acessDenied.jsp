<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Acesso Negado - NhomNhom</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            font-family: 'Comic Relief', sans-serif;
        }
    </style>
</head>
<body class="bg-stone-100 min-h-screen flex items-center justify-center p-4">

<div class="max-w-2xl w-full">
    <div class="bg-white rounded-2xl shadow-2xl overflow-hidden">
        <div class="bg-gradient-to-r from-amber-600 to-orange-300 p-8 text-center">
            <div class="mb-4">
                <i class="fa-solid fa-lock text-6xl text-white"></i>
            </div>
            <h1 class="text-3xl font-bold text-white mb-2">
                Acesso Negado
            </h1>
            <p class="text-yellow-50 text-lg">
                Ops! Você não tem permissão para acessar esta página :(
            </p>
        </div>

        <div class="p-8">
            <div class="text-center space-y-4 mb-8">
                <div class="bg-amber-50 border-2 border-amber-200 rounded-xl p-6">
                    <i class="fa-solid fa-triangle-exclamation text-amber-600 text-3xl mb-3"></i>
                    <p class="text-gray-700 text-lg">
                        Esta área é restrita e requer permissões especiais.
                    </p>
                </div>

                <div class="text-gray-600 space-y-2">
                    <p class="font-semibold text-lg">Possíveis motivos:</p>
                    <ul class="text-left max-w-md mx-auto space-y-2">
                        <li class="flex items-start gap-2">
                            <i class="fa-solid fa-circle-check text-amber-600 mt-1"></i>
                            <span>Você não está logado no sistema</span>
                        </li>
                        <li class="flex items-start gap-2">
                            <i class="fa-solid fa-circle-check text-amber-600 mt-1"></i>
                            <span>Seu nível de acesso não permite visualizar este conteúdo</span>
                        </li>
                        <li class="flex items-start gap-2">
                            <i class="fa-solid fa-circle-check text-amber-600 mt-1"></i>
                            <span>A página solicitada é exclusiva para administradores</span>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="flex flex-col sm:flex-row gap-3">
                <button
                        onclick="window.history.back()"
                        class="px-6 py-3 rounded-full border border-gray-300 text-gray-600 font-semibold hover:bg-white hover:border-amber-500 hover:text-amber-600 transition-all"
                >
                    <i class="fa-solid fa-arrow-left"></i>
                    Voltar
                </button>
            </div>

            <div class="text-center mt-6 pt-6 border-t border-gray-200">
                <p class="text-gray-600">
                    Precisa fazer login?
                    <a href="login.jsp" class="text-amber-600 hover:text-amber-700 font-semibold">
                        Clique aqui
                    </a>
                </p>
            </div>

            <div class="mt-6 bg-gradient-to-r from-amber-50 to-orange-50 rounded-xl p-4 text-center">
                <p class="text-gray-600 text-sm">
                    <i class="fa-solid fa-info-circle text-amber-600"></i>
                    Se você acredita que isso é um erro, entre em contato com o suporte.
                </p>
            </div>
        </div>
    </div>

    <div class="text-center mt-8">
        <img src="titleNhomNhom.svg"
             alt="NhomNhom"
             class="h-12 mx-auto opacity-50">
    </div>
</div>

</body>
</html>