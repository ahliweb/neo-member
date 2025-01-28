document.addEventListener('DOMContentLoaded', function () {
  const filterButtons = document.querySelectorAll('.mobile-filter-button');
  const informasiItems = document.querySelectorAll('.mobile-informasi-item');

  // Function to filter the list
  function filterInformasi(filter) {
    informasiItems.forEach(item => {
      const type = item.getAttribute('data-type');
      if (filter === 'Semua' || type === filter) {
        item.style.display = 'flex'; // Show matching items
      } else {
        item.style.display = 'none'; // Hide non-matching items
      }
    });
  }

  // Add event listeners to filter buttons
  filterButtons.forEach(button => {
    button.addEventListener('click', () => {
      const filter = button.getAttribute('data-filter');

      // Update active button
      filterButtons.forEach(btn => btn.classList.remove('active'));
      button.classList.add('active');

      // Apply the filter
      filterInformasi(filter);
    });
  });
});
