// Get the SVG elements inside the logo containers
//const logo = document.getElementById('logo').querySelector('img');
//const logo2 = document.getElementById('logo2').querySelector('img');

// Get the theme button
var themeButton = document.getElementById('themeButton');

// Add click event listener to the theme button
themeButton.addEventListener('click', function () {
    // Toggle between light mode and dark mode
    toggleTheme();
});

// Function to toggle between light mode and dark mode
//function toggleTheme() {
//    // Toggle dark mode class on body
//    document.body.classList.toggle('dark-mode');

//    // Save theme preference to local storage
//    var isDarkMode = document.body.classList.contains('dark-mode');
//    localStorage.setItem('darkMode', isDarkMode);
//    console.log(localStorage.getItem('darkMode'));
//}

function toggleTheme() {
    // Toggle dark mode class on body
    document.body.classList.toggle('dark-mode');

    // Save theme preference to local storage
    var isDarkMode = document.body.classList.contains('dark-mode');
    localStorage.setItem('darkMode', isDarkMode);
    console.log(localStorage.getItem('darkMode'));

    // Get the logo elements
    const logo = document.getElementById('logo').querySelector('img');
    const logo2 = document.getElementById('logo2').querySelector('img');

    // Update the logo sources based on the theme
    if (isDarkMode) {
        logo.src = '../Images/logo/Jukeboxd-full-dark.svg';
        logo2.src = '../Images/logo/Jukeboxd-full-dark.svg';
    } else {
        logo.src = '../Images/logo/Jukeboxd-full.svg';
        logo2.src = '../Images/logo/Jukeboxd-full.svg';
    }
}

// Check if dark mode preference is saved in local storage and apply it
window.onload = function () {
    var isDarkMode = localStorage.getItem('darkMode');
    if (isDarkMode === 'true') {
        // If dark mode preference is saved, apply dark mode
        document.body.classList.add('dark-mode');
        //logo.src = '../Images/logo/Jukeboxd-full-dark.svg';
        //logo2.src = '../Images/logo/Jukeboxd-full-dark.svg';
    }
    else
    {
        //logo.src = '../Images/logo/Jukeboxd-full.svg';
        //logo2.src = '../Images/logo/Jukeboxd-full.svg';
    }
};

