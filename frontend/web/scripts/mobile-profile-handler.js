document.addEventListener('DOMContentLoaded', function () {
    const logoutButton = document.getElementById('logout-button');
  
    // Redirect to login page on logout
    logoutButton.addEventListener('click', () => {
      window.location.href = '/login';
    });
  });
  
