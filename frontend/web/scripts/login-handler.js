document.addEventListener('DOMContentLoaded', function () {
    const isMobile = /Mobi|Android|iPhone/i.test(navigator.userAgent);
    const loginButton = document.getElementById(isMobile ? 'login-button-mobile' : 'login-button');

    const usernameInput = document.getElementById(isMobile ? 'username-mobile' : 'username');
    const passwordInput = document.getElementById(isMobile ? 'password-mobile' : 'password');
    const togglePasswordButton = document.getElementById(isMobile ? 'toggle-password-mobile' : 'toggle-password');
    const rememberPasswordCheckbox = document.getElementById('remember-password');    
  
    let isPasswordVisible = false;
  
    // Toggle Password Visibility
    togglePasswordButton.addEventListener('click', () => {
      isPasswordVisible = !isPasswordVisible;
      passwordInput.type = isPasswordVisible ? 'text' : 'password';
    
      // Ganti ikon PNG berdasarkan visibilitas
      const toggleIcon = togglePasswordButton.querySelector('.toggle-icon');
      toggleIcon.src = isPasswordVisible ? '/images/eye-open.png' : '/images/eye-closed.png';
    });
  
    // Handle Login
    loginButton.addEventListener('click', () => {
      const username = usernameInput.value.trim();
      const password = passwordInput.value.trim();
      const rememberPassword = rememberPasswordCheckbox.checked;
  
      if (!username || !password) {
        alert('Username and Password are required!');
        return;
      }
  
      if (username === 'admin' && password === 'admin123') {
        window.location.href = '/dashboard';
      } else if (username === 'member' && password === 'member123') {
        window.location.href = '/mobile-beranda';
      } else if (username === 'sales' && password === 'sales123') {
        window.location.href = '/sales-beranda';
      } else {
        alert('Invalid Username or Password!');
      }
  
      console.log({
        username,
        password: '********', // Hide actual password in logs
        rememberPassword,
      });
    });
  });

// document.addEventListener('DOMContentLoaded', function () {
//   const loginPage = document.querySelector('.login-page');
//   const loginFormDesktop = document.querySelector('.login-container');
//   const loginFormMobile = document.querySelector('.login-container-mobile');

//   // Detect device type
//   const isMobile = /Mobi|Android|iPhone/i.test(navigator.userAgent);
//   loginPage.setAttribute('data-device', isMobile ? 'mobile' : 'desktop');

//   // Show the appropriate form
//   if (isMobile) {
//     loginFormDesktop.style.display = 'none';
//     loginFormMobile.style.display = 'block';
//   } else {
//     loginFormDesktop.style.display = 'block';
//     loginFormMobile.style.display = 'none';
//   }
// });

document.addEventListener('DOMContentLoaded', function () {
  const isMobile = /Mobi|Android|iPhone/i.test(navigator.userAgent); // Detect mobile devices
  const loginPage = document.querySelector('.login-page');
  const desktopContainer = document.getElementById('desktop-login-container');
  const mobileContainer = document.getElementById('mobile-login-container');

  // Ubah data-device berdasarkan perangkat
  if (isMobile) {
    loginPage.setAttribute('data-device', 'mobile');
    desktopContainer.style.display = 'none'; // Hide desktop login
    mobileContainer.style.display = 'block'; // Show mobile login
  } else {
    loginPage.setAttribute('data-device', 'desktop');
    desktopContainer.style.display = 'block'; // Show desktop login
    mobileContainer.style.display = 'none'; // Hide mobile login
  }

  // Optional: Log the current mode
  console.log('Current mode:', isMobile ? 'Mobile' : 'Desktop');
});

  