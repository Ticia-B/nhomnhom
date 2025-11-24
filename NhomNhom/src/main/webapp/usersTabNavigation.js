const activeClasses = [
    'bg-gradient-to-r', 'from-orange-500', 'to-amber-500',
    'text-white', 'border-orange-700', 'z-10'
].join(' ');

const inactiveClasses = [
    'bg-white/70', 'text-orange-600', 'border-transparent',
    'hover:bg-white', 'hover:border-orange-300', 'hover:-translate-y-1'
].join(' ');

function switchTab(tabName) {
    document.querySelectorAll('.tab-content').forEach(tab => {
        tab.classList.add('hidden');
    });

    document.querySelectorAll('.tab-button').forEach(button => {
        activeClasses.split(' ').forEach(cls => button.classList.remove(cls));
        inactiveClasses.split(' ').forEach(cls => button.classList.add(cls));
    });

    const targetTab = document.getElementById(tabName + '-tab');
    if (targetTab) targetTab.classList.remove('hidden');


    const activeButton = document.querySelector(`[data-tab="${tabName}"]`);
    if (activeButton) {
        inactiveClasses.split(' ').forEach(cls => activeButton.classList.remove(cls));
        activeClasses.split(' ').forEach(cls => activeButton.classList.add(cls));
    }
}

window.addEventListener('DOMContentLoaded', () => {
    switchTab('clients');
});
