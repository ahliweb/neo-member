document.addEventListener('DOMContentLoaded', function () {
  const filterButtons = document.querySelectorAll('.filter-button');
  const memberItems = document.querySelectorAll('.member-item');
  const salesPage = document.querySelector('.sales-member-page');
  const salesDetailPage = document.querySelector('.sales-member-detail-page');
  const backButton = document.querySelector('.back-button');

  salesDetailPage.style.display = 'none';
  // Ensure elements exist
  if (!salesPage || !salesDetailPage) {
    console.error('Error: Sales page or detail page is missing.');
    return;
  }

  // Filter functionality
  filterButtons.forEach((button) => {
    button.addEventListener('click', () => {
      const filter = button.getAttribute('data-filter');

      // Update active class
      filterButtons.forEach((btn) => btn.classList.remove('active'));
      button.classList.add('active');

      // Filter members
      memberItems.forEach((item) => {
        const status = item.getAttribute('data-status');
        item.style.display = filter === 'Semua' || filter === status ? '' : 'none';
      });
    });
  });

  // View member details
  memberItems.forEach((item) => {
    item.addEventListener('click', () => {
      const name = item.getAttribute('data-name');
      const nik = item.getAttribute('data-nik');
      const whatsapp = item.getAttribute('data-whatsapp');

      // Populate detail view
      const detailName = document.querySelector('.detail-name');
      const detailNik = document.querySelector('.detail-nik');
      const detailWhatsapp = document.querySelector('.detail-whatsapp');

      if (detailName && detailNik && detailWhatsapp) {
        detailName.textContent = name;
        detailNik.textContent = nik;
        detailWhatsapp.textContent = whatsapp;
      } else {
        console.error('Error: Detail fields not found in the DOM.');
      }

      // Toggle views
      salesPage.style.display = 'none';
      salesDetailPage.style.display = 'block';
    });
  });

  // Back button functionality
  backButton.addEventListener('click', () => {
    salesDetailPage.style.display = 'none';
    salesPage.style.display = 'block';
  });
});
