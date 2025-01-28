document.addEventListener('DOMContentLoaded', function () {
    const profile = document.querySelector('.profile');
    const dropdownMenu = document.querySelector('.dropdown-menu');
    const logoutButton = document.querySelector('.logout-button');
  
    // Toggle Dropdown Menu
    profile.addEventListener('click', function (e) {
      e.stopPropagation(); // Prevent click from propagating to the body
      profile.classList.toggle('open');
    });
  
    // Close Dropdown Menu When Clicking Outside
    document.body.addEventListener('click', function () {
      profile.classList.remove('open');
    });
  
    // Logout Functionality
    logoutButton.addEventListener('click', function () {
      // Redirect to the login page
      window.location.href = '/login';
    });
  });
  