document.addEventListener('DOMContentLoaded', () => {
    const header = document.querySelector('.header-module');

    window.addEventListener('scroll', () => {
        if (window.scrollY > window.innerHeight / 4) { // Adjust the scroll distance as needed
            header.classList.add('scrolled');
        } else {
            header.classList.remove('scrolled');
        }
    });
});

document.addEventListener('DOMContentLoaded', (event) => {
    const button = document.querySelector('.selection__mo');

    button.addEventListener('click', () => {
        button.classList.toggle('selection__mo--active');
    });
});



