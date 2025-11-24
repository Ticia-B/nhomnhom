// filterProducts.js

function showOrders() {
    const productsContainer = document.getElementById('showingProductsReal');
    const ordersContainer = document.getElementById('ordersContainer');

    if (productsContainer && ordersContainer) {
        // Esconde a vitrine de produtos
        productsContainer.classList.add('hidden');
        // Removemos a classe flex CASO ela existisse, mas seu layout é GRID.
        // Então apenas adicionar o hidden já é suficiente para o Tailwind.

        // Mostra a tela de pedidos
        ordersContainer.classList.remove('hidden');

        // Opcional: Rolar para o topo para ver os pedidos
        window.scrollTo({ top: 0, behavior: 'smooth' });
    }
}

function filterCards(category) {
    const productsContainer = document.getElementById('showingProductsReal');
    const ordersContainer = document.getElementById('ordersContainer');

    // 1. Garante que estamos vendo a vitrine de produtos (e não os pedidos)
    if (productsContainer && ordersContainer) {
        ordersContainer.classList.add('hidden');
        productsContainer.classList.remove('hidden');
        // Nota: Não precisamos readicionar 'grid' porque o 'hidden' apenas oculta,
        // ele não remove as classes originais de layout do HTML.
    }

    // 2. Filtragem dos cards
    const cards = document.querySelectorAll('.edible-card');

    cards.forEach(card => {
        const cardCategory = card.getAttribute('data-category');

        // Verifica se é 'all' OU se a categoria bate
        if (category === 'all' || cardCategory === category) {
            card.classList.remove('hidden');
            card.classList.add('flex'); // O card individual precisa ser flex para alinhar imagem/texto
        } else {
            card.classList.add('hidden');
            card.classList.remove('flex');
        }
    });
}