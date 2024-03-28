// Get the SVG elements inside the logo containers
const logo = document.getElementById('logo').querySelector('img');
const logo2 = document.getElementById('logo2').querySelector('img');

// Get the theme from local storage or use a default value
let theme = localStorage.getItem('theme') || 'light';

// Update the SVG sources based on the theme
function updateLogos() {
    if (theme === 'dark') {
        logo.src = '../images/logo/Jukeboxd-full-dark.svg';
        logo2.src = '../images/logo/Jukeboxd-full-dark.svg';
    } else {
        logo.src = '../images/logo/Jukeboxd-full.svg';
        logo2.src = '../images/logo/Jukeboxd-full.svg';
    }
}

// Function to handle theme change
function handleThemeChange(newTheme) {
    theme = newTheme;
    localStorage.setItem('theme', theme);
    updateLogos();
}

// Add event listener to the light and dark button
const themeButton = document.querySelector('[data-theme-toggle]');
themeButton.addEventListener('click', () => {
    if (theme === 'light') {
        handleThemeChange('dark');
    } else {
        handleThemeChange('light');
    }
});

// Update the logos on page load
window.addEventListener('load', updateLogos);

