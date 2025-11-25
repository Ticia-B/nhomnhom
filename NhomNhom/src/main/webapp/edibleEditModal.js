const editEdibleModalOverlay = document.getElementById('edibleEditModalOverlay');
const editEdibleModal = document.getElementById('edibleEditModal');

function openEditModal(id, name, price, category, photo, description) {
    const safeName = name ? decodeURIComponent(name) : '';
    const safeDesc = description ? decodeURIComponent(description) : '';
    const safePhoto = photo ? decodeURIComponent(photo) : '';

    // Preenche os campos
    document.getElementById("spanEdibleId").innerText = id;
    document.getElementById('editEdibleIdInput').value = id;
    document.getElementById('editEdibleName').value = safeName;
    document.getElementById('editEdiblePrice').value = price;
    document.getElementById('editProductCategory').value = category;
    document.getElementById('editEdiblePhoto').value = safePhoto;
    document.getElementById('editEdibleDescription').value = safeDesc;

    editEdibleModalOverlay.classList.remove('hidden');
    editEdibleModal.classList.remove('hidden');


    setTimeout(() => {
        editEdibleModalOverlay.style.opacity = '1';
    }, 10);


    document.body.style.overflow = 'hidden';
}

function closeEditModal() {
    editEdibleModalOverlay.style.opacity = '0';

    setTimeout(() => {
        editEdibleModalOverlay.classList.add('hidden');
        editEdibleModal.classList.add('hidden');

        document.body.style.overflow = '';

        document.getElementById('editEdibleForm').reset();
    }, 200);
}


editEdibleModalOverlay.addEventListener('click', (e) => {
    if (e.target === editEdibleModalOverlay) {
        closeEditModal();
    }
});

document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape' && !editEdibleModal.classList.contains('hidden')) {
        closeEditModal();
    }
});