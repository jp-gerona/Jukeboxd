// Get the theme button
var themeButton = document.getElementById('themeButton');

// Add click event listener to the theme button
themeButton.addEventListener('click', function () {
    // Toggle between light mode and dark mode
    toggleTheme();
});

// Function to toggle between light mode and dark mode
function toggleTheme() {
    // Toggle dark mode class on body
    document.body.classList.toggle('dark-mode');

    // Save theme preference to local storage
    var isDarkMode = document.body.classList.contains('dark-mode');
    localStorage.setItem('darkMode', isDarkMode);
    console.log(localStorage.getItem('darkMode'));
}

// Check if dark mode preference is saved in local storage and apply it
window.onload = function () {
    var isDarkMode = localStorage.getItem('darkMode');
    if (isDarkMode === 'true') {
        // If dark mode preference is saved, apply dark mode
        document.body.classList.add('dark-mode');
    }
};

