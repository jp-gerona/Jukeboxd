function toggleMenu() {
    const hamIcon = document.querySelector('.ham-icon');
    const navLinks = document.querySelector('.topbar .nav-links');

    hamIcon.classList.toggle('open');
    navLinks.classList.toggle('open');

    const iconElement = hamIcon.querySelector('i');

    if (hamIcon.classList.contains('open')) {
        iconElement.className = 'ri-close-fill';
        iconElement.classList.add('ri-close-fill');
    } else {
        iconElement.className = 'ri-menu-fill';
        iconElement.classList.add('ri-menu-fill');
    }
}