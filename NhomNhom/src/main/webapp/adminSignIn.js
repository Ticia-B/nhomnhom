const modalAdminOverlay = document.getElementById('modalAdminOverlay');
const modalAdminContent = document.getElementById('cadastroAdminModal');

function openAdminModal() {
    modalAdminOverlay.classList.remove('hidden');
    modalAdminContent.classList.remove('hidden');
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

function closeAdminModal() {
    modalAdminOverlay.classList.add('bg-opacity-0');

    modalAdminOverlay.classList.add('hidden');
    modalAdminContent.classList.add('hidden');
    modalAdminOverlay.classList.remove('bg-opacity-0');

}

modalAdminOverlay.addEventListener('click', (e) => {
    if (e.target === modalAdminOverlay || e.target === modalAdminContent) {
        closeAdminModal();
    }
});