const editEdibleModalOverlay = document.getElementById('edibleEditModalOverlay');
const editEdibleModal = document.getElementById('edibleEditModal');

function openEditModal(id, name, price, category, photo, description) {
    console.log("Editando:", id, name, price, category, photo, description);

    const safeName = name ? decodeURIComponent(name) : '';
    const safeDesc = description ? decodeURIComponent(description) : '';
    const safePhoto = photo ? decodeURIComponent(photo) : '';

    document.getElementById("spanEdibleId").innerHTML = id;
    document.getElementById('editEdibleIdInput').value = id;
    document.getElementById('editEdibleName').value = safeName;
    document.getElementById('editEdiblePrice').value = price;
    document.getElementById('editProductCategory').value = category;
    document.getElementById('editEdiblePhoto').value = safePhoto;
    document.getElementById('editEdibleDescription').value = safeDesc;


    editEdibleModalOverlay.classList.remove('hidden');
    editEdibleModal.classList.remove('hidden');
}

function closeEditModal() {
    editEdibleModalOverlay.classList.add('hidden');
    editEdibleModal.classList.add('hidden');
    editEdibleModalOverlay.style.opacity = '0';
}

editEdibleModalOverlay.addEventListener('click', (e) => {
    if (e.target === editEdibleModalOverlay) {
        closeEditModal();
    }
});