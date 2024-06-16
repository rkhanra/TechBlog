/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


document.addEventListener('DOMContentLoaded', function () {
    const modeToggle = document.getElementById('modeToggle');
    const body = document.body;

    // Load user's preference from localStorage
    const currentMode = localStorage.getItem('theme') || (window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light');
    body.classList.add(currentMode + '-mode');

    // Update button text
    modeToggle.textContent = currentMode === 'dark' ? 'Light Mode' : 'Dark Mode';

    // Function to update colors based on mode
    function updateColors(mode) {
        body.className = '';
        body.classList.add(mode + '-mode');
    }

    // Update colors based on initial mode
    updateColors(currentMode);

    modeToggle.addEventListener('click', function () {
        const newMode = body.classList.contains('dark-mode') ? 'light' : 'dark';
        localStorage.setItem('theme', newMode);
        updateColors(newMode);
        modeToggle.textContent = newMode === 'dark' ? 'Light Mode' : 'Dark Mode';
    });

    // Listen for changes in the user's color scheme preference
    window.matchMedia('(prefers-color-scheme: dark)').addListener(function (e) {
        if (!localStorage.getItem('theme')) {
            const newColorScheme = e.matches ? 'dark' : 'light';
            updateColors(newColorScheme);
            modeToggle.textContent = newColorScheme === 'dark' ? 'Light Mode' : 'Dark Mode';
        }
    });
});
