document.addEventListener('DOMContentLoaded', () => {
    const header = document.querySelector('.header');

    window.addEventListener('scroll', () => {
        if (window.scrollY > window.innerHeight / 4) { // Adjust the scroll distance as needed
            header.classList.add('scrolled');
        } else {
            header.classList.remove('scrolled');
        }
    });
});