document.addEventListener('DOMContentLoaded', function () {
  const uploadKTPButton = document.getElementById('upload-ktp-button');
  const uploadPaymentButton = document.getElementById('upload-payment-button');
  const ktpForm = document.querySelector('.sales-upload-ktp-form');
  const paymentForm = document.querySelector('.sales-upload-payment-form');

  // Initially hide both forms
  if (ktpForm) ktpForm.style.display = 'none';
  if (paymentForm) paymentForm.style.display = 'none';

  // Event Listener: Show KTP Form
  uploadKTPButton.addEventListener('click', () => {
    if (ktpForm) ktpForm.style.display = 'block';
    if (paymentForm) paymentForm.style.display = 'none';
    uploadKTPButton.classList.add('active');
    uploadPaymentButton.classList.remove('active');
  });

  // Event Listener: Show Payment Form
  uploadPaymentButton.addEventListener('click', () => {
    if (ktpForm) ktpForm.style.display = 'none';
    if (paymentForm) paymentForm.style.display = 'block';
    uploadPaymentButton.classList.add('active');
    uploadKTPButton.classList.remove('active');
  });

  // Initialize Choices.js on dropdowns
  const dropdowns = document.querySelectorAll('.dropdown');
  dropdowns.forEach(dropdown => {
    new Choices(dropdown, {
      searchEnabled: true,
      shouldSort: false,
    });
  });
});
