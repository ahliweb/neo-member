document.addEventListener('DOMContentLoaded', function () {
  const page = document.querySelector('.sales-page');
  const table = document.querySelector('.sales-table');
  const form = document.querySelector('.sales-form');
  const deletePopup = document.querySelector('.delete-popup');
  const addButton = document.querySelector('.add-button');
  const editButtons = document.querySelectorAll('.action-button.edit');
  const deleteButtons = document.querySelectorAll('.action-button.delete');
  const submitButton = document.querySelector('.sales-form .submit-button');
  const cancelFormButton = document.querySelector('.sales-form .cancel-button');
  const confirmDeleteButton = document.querySelector('.delete-popup .confirm-button');
  const cancelDeleteButton = document.querySelector('.delete-popup .cancel-button');
  const paginationContainer = document.querySelector('.pagination-container');
  const searchInput = document.querySelector('.search-input');
  const popupOverlay = document.querySelector('.delete-popup-overlay');


  form.style.display = 'none';
  // Fungsi untuk mengganti tampilan
  function switchView(view) {
    page.dataset.view = view;
    if (view === 'delete') {
      popupOverlay.style.display = 'flex';
    } else {
      popupOverlay.style.display = 'none';
    }
    table.style.display = view === 'list' || view === 'delete' ? 'table' : 'none';
    form.style.display = view === 'create' || view === 'edit' ? 'block' : 'none';
    deletePopup.style.display = view === 'delete' ? 'block' : 'none';
    searchInput.style.display = view === 'list' || view === 'delete'? 'block' : 'none';
    addButton.style.display = view === 'list' || view === 'delete'? 'block' : 'none';
    paginationContainer.style.display = view === 'list' || view === 'delete' ? 'flex' : 'none';
  }

  // Event listener untuk tombol tambah
  addButton.addEventListener('click', () => {
    switchView('create');
  });

  // Event listener untuk tombol edit
  editButtons.forEach(button => {
    button.addEventListener('click', () => {
      switchView('edit');
    });
  });

  // Event listener untuk tombol delete
  deleteButtons.forEach(button => {
    button.addEventListener('click', () => {
      switchView('delete');
    });
  });

  // Event listener untuk tombol simpan di form
  submitButton.addEventListener('click', () => {
    switchView('list');
  });

  // Event listener untuk tombol batal di form
  cancelFormButton.addEventListener('click', () => {
    switchView('list');
  });

  // Event listener untuk tombol konfirmasi delete
  confirmDeleteButton.addEventListener('click', () => {
    switchView('list');
  });

  // Event listener untuk tombol batal di delete popup
  cancelDeleteButton.addEventListener('click', () => {
    switchView('list');
  });

  // Event listener untuk search bar
  searchInput.addEventListener('input', () => {
    const query = searchInput.value.toLowerCase();
    const rows = document.querySelectorAll('.sales-table tbody tr');
    rows.forEach(row => {
      const member = row.querySelector('td:nth-child(1)').textContent.toLowerCase();
      const nik = row.querySelector('td:nth-child(2)').textContent.toLowerCase();
      const whatsapp = row.querySelector('td:nth-child(3)').textContent.toLowerCase();
      if (member.includes(query) || nik.includes(query) || whatsapp.includes(query)) {
        row.style.display = '';
      } else {
        row.style.display = 'none';
      }
    });
  });
});

document.addEventListener('DOMContentLoaded', function () {
  const rows = document.querySelectorAll('.sales-table tbody tr');
  const prevButton = document.querySelector('.pagination-button.previous');
  const nextButton = document.querySelector('.pagination-button.next');
  const pageInfo = document.querySelector('.pagination-info');

  const rowsPerPage = 8; // Number of rows per page
  let currentPage = 1;

  // Function to display rows for the current page
  function updateTable() {
    const start = (currentPage - 1) * rowsPerPage;
    const end = start + rowsPerPage;

    rows.forEach((row, index) => {
      row.style.display = index >= start && index < end ? '' : 'none';
    });

    // Update pagination info
    const totalPages = Math.ceil(rows.length / rowsPerPage);
    pageInfo.textContent = `Page ${currentPage} of ${totalPages}`;

    // Enable/disable buttons
    prevButton.style.display = currentPage > 1 ? '' : 'none';
        nextButton.style.display = currentPage < totalPages ? '' : 'none';
  }

  // Event listeners for pagination buttons
  prevButton.addEventListener('click', () => {
    if (currentPage > 1) {
      currentPage--;
      updateTable();
    }
  });

  nextButton.addEventListener('click', () => {
    const totalPages = Math.ceil(rows.length / rowsPerPage);
    if (currentPage < totalPages) {
      currentPage++;
      updateTable();
    }
  });

  // Initial table update
  updateTable();
});
