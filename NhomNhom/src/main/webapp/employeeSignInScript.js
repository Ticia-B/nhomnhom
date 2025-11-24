function closeEmployeeModal() {
    const modal = document.getElementById('modalEmployeeOverlay');
    const content = document.getElementById('cadastroEmployeeModal');
    content.classList.add('hidden');
    modal.classList.add('hidden');
    document.getElementById('cadastroEmployeeForm').reset();
}

function openEmployeeModal() {
    const modal = document.getElementById('modalEmployeeOverlay');
    const content = document.getElementById('cadastroEmployeeModal');
    modal.classList.remove('hidden');
    content.classList.remove('hidden');
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
