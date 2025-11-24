function switchMainView(viewName) {
    const productsView = document.getElementById('view-products');
    const usersView = document.getElementById('view-users');

    const btnUsers = document.getElementById('users');

    if (viewName === 'users') {
        productsView.classList.add('hidden');
        usersView.classList.remove('hidden');
        window.scrollTo(0, 0);

    } else {

        usersView.classList.add('hidden');
        productsView.classList.remove('hidden');
    }
}