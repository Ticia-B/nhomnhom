const overlay = document.getElementById('edibleModalOverlay');
const modal = document.getElementById('edibleModal');

function openModal() {
    overlay.classList.remove('hidden');
    modal.classList.remove('hidden');
}

function closeModal() {
    overlay.classList.add('hidden');
    modal.classList.add('hidden');
}

overlay.addEventListener('click', (e) => {
    if (e.target === overlay) {
        closeModal();
    }
});