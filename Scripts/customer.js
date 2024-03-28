// Get the SVG elements inside the logo containers
//const logo = document.getElementById('logo').querySelector('img');
//const logo2 = document.getElementById('logo2').querySelector('img');

// Selects the toggle button for dark mode
//var themeButton = document.getElementById('themeButton');
////// Get the theme from local storage or use a default value
//let theme = localStorage.getItem('darkMode');

// Update the SVG sources based on the theme
//function updateLogos() {
//    if (theme !== false) {
//        logo.src = '../images/logo/Jukeboxd-full-dark.svg';
//        logo2.src = '../images/logo/Jukeboxd-full-dark.svg';
//    } else {
//        logo.src = '../images/logo/Jukeboxd-full.svg';
//        logo2.src = '../images/logo/Jukeboxd-full.svg';
//    }
//}

//// Function to handle theme change
//function handleThemeChange(newTheme) {
//    theme = newTheme;
//    localStorage.setItem('theme', theme);
//    updateLogos();
//}

//// Add event listener to the light and dark button
//const themeButton = localStorage.clear('darkMode');
//themeButton.addEventListener('click', () => {
//    if (themeButton !== false) {
//        handleThemeChange('false');
//    } else {
//        handleThemeChange('true');
//    }
//});

// Update the logos on page load
//window.addEventListener('load', updateLogos){
//    if (theme !== false) {
//        logo.src = '../images/logo/Jukeboxd-full-dark.svg';
//        logo2.src = '../images/logo/Jukeboxd-full-dark.svg';
//    } else {
//        logo.src = '../images/logo/Jukeboxd-full.svg';
//        logo2.src = '../images/logo/Jukeboxd-full.svg';
//    }
//};

//themeButton.addEventListener('click', function () {
//    toggleTheme();
//});

//function toggleTheme() {
//    if (theme === true) {
//        logo.src = '../images/logo/Jukeboxd-full-dark.svg';
//        logo2.src = '../images/logo/Jukeboxd-full-dark.svg';
//    } else {
//        logo.src = '../images/logo/Jukeboxd-full.svg';
//        logo2.src = '../images/logo/Jukeboxd-full.svg';
//    }
//}

//document.addEventListener('DOMContentLoaded', function () {
//    toggleTheme();
//});

//// Function to toggle between light mode and dark mode
//function toggleTheme() {
//    // Check the current theme preference from local storage
//    var isDarkMode = localStorage.getItem('darkMode');

//    // Update the logos based on the theme preference
//    if (isDarkMode === 'true') {
//        logo.src = '../images/logo/Jukeboxd-full-dark.svg';
//        logo2.src = '../images/logo/Jukeboxd-full-dark.svg';
//    } else {
//        logo.src = '../images/logo/Jukeboxd-full.svg';
//        logo2.src = '../images/logo/Jukeboxd-full.svg';
//    }
//}
