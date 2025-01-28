document.addEventListener('DOMContentLoaded', function () {
    const filterButtons = document.querySelectorAll('.filter-button');
    const rows = document.querySelectorAll('.broadcast-table tbody tr');
    const selectAllCheckbox = document.querySelector('.select-all-checkbox');
    const selectCheckboxes = document.querySelectorAll('.select-checkbox');
  
    // Filter functionality
    filterButtons.forEach(button => {
      button.addEventListener('click', () => {
        const filter = button.textContent.trim();
  
        // Update active button
        filterButtons.forEach(btn => btn.classList.remove('active'));
        button.classList.add('active');
  
        // Filter rows
        rows.forEach(row => {
          const tag = row.getAttribute('data-tag');
          if (filter === 'Semua' || tag === filter) {
            row.style.display = ''; // Show row
          } else {
            row.style.display = 'none'; // Hide row
          }
        });
      });
    });
  
    // Select-all checkbox functionality
    selectAllCheckbox.addEventListener('change', function () {
      const isChecked = selectAllCheckbox.checked;
      selectCheckboxes.forEach(checkbox => {
        checkbox.checked = isChecked; // Set all checkboxes to the same state
      });
    });
  
    // Ensure that if all rows are unchecked manually, the header checkbox is also unchecked
    selectCheckboxes.forEach(checkbox => {
      checkbox.addEventListener('change', function () {
        const allChecked = [...selectCheckboxes].every(cb => cb.checked);
        selectAllCheckbox.checked = allChecked;
      });
    });
  });
  