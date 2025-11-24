function openModal() {
    document.getElementById('modalOverlay').classList.remove('hidden');
    document.getElementById('cadastroModal').classList.remove('hidden');
    document.body.style.overflow = 'hidden';
}

function closeModal() {
    document.getElementById('modalOverlay').classList.add('hidden');
    document.getElementById('cadastroModal').classList.add('hidden');
    document.body.style.overflow = 'auto';
}

function openModalLogin() {
    document.getElementById('modalOverlayLogin').classList.remove('hidden');
    document.getElementById('loginModal').classList.remove('hidden');
    document.body.style.overflow = 'hidden';
}

function closeModalLogin() {
    document.getElementById('modalOverlayLogin').classList.add('hidden');
    document.getElementById('loginModal').classList.add('hidden');
    document.body.style.overflow = 'auto';
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

document.addEventListener('DOMContentLoaded', function () {

    const cadastroForm = document.getElementById('cadastroForm');
    const cpfInput = document.querySelector('input[name="cpf"]');
    const modalOverlay = document.getElementById('modalOverlay');


    if (cpfInput) {
        cpfInput.addEventListener('input', function (e) {
            let value = e.target.value.replace(/\D/g, ''); // Remove tudo que não é dígito
            if (value.length <= 11) {
                value = value.replace(/(\d{3})(\d)/, '$1.$2');
                value = value.replace(/(\d{3})(\d)/, '$1.$2');
                value = value.replace(/(\d{3})(\d{1,2})$/, '$1-$2');
                e.target.value = value;
            }
        });
    }

    if (modalOverlay) {
        modalOverlay.addEventListener('click', function (e) {
            if (e.target === this) {
                closeModal();
            }
        });
    }

});

function getCookie(name) {
    let nameEQ = name + "=";
    let ca = document.cookie.split(';');
    for (let i = 0; i < ca.length; i++) {
        let c = ca[i];
        while (c.charAt(0) == ' ') c = c.substring(1, c.length);
        if (c.indexOf(nameEQ) == 0) {
            return c.substring(nameEQ.length, c.length);
        }
    }
    return null;
}

function checkLoginStatus() {
    const token = getCookie("token");

    const notLoggedDiv = document.getElementById("not-logged");
    const loggedDiv = document.getElementById("logged");

    if (notLoggedDiv && loggedDiv) {
        if (token) {
            notLoggedDiv.classList.add("hidden");
            loggedDiv.classList.remove("hidden");
        } else {
            notLoggedDiv.classList.remove("hidden");
            loggedDiv.classList.add("hidden");
        }
    }
}

document.addEventListener("DOMContentLoaded", checkLoginStatus);