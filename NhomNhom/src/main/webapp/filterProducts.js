// filterProducts.js

function showOrders() {
    const productsContainer = document.getElementById('showingProductsReal');
    const ordersContainer = document.getElementById('ordersContainer');

    if (productsContainer && ordersContainer) {
        productsContainer.classList.add('hidden');


        ordersContainer.classList.remove('hidden');

        window.scrollTo({ top: 0, behavior: 'smooth' });
    }
}

function filterCards(category) {
    const productsContainer = document.getElementById('showingProductsReal');
    const searchContainer = document.getElementById('searchingProductsReal'); // Captura a nova div de busca
    const ordersContainer = document.getElementById('ordersContainer');

    if (productsContainer) {
        if (ordersContainer) ordersContainer.classList.add('hidden');

        if (searchContainer) searchContainer.classList.add('hidden');

        productsContainer.classList.remove('hidden');
    }

    const cards = document.querySelectorAll('#showingProductsReal .edible-card'); // Ajustei o seletor para pegar apenas cards da lista normal

    cards.forEach(card => {
        const cardCategory = card.getAttribute('data-category');

        if (category === 'all' || cardCategory === category) {
            card.classList.remove('hidden');
            card.classList.add('flex');
        } else {
            card.classList.add('hidden');
            card.classList.remove('flex');
        }
    });
}