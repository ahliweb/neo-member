document.addEventListener('DOMContentLoaded', function () {
  const page = document.querySelector('.member-page');
  const list = document.querySelector('.member-table tbody');
  const verification = document.querySelector('.verification-container');
  const filterButtonsContainer = document.querySelector('.formulir-filter-buttons');
  const tableHeader = document.querySelector('.member-table thead');
  const editButtons = document.querySelectorAll('.action-button.edit');
  const verifyButtons = document.querySelectorAll('.action-button.verify');
  const cancelButton = document.querySelector('.cancel-button');
  const rows = document.querySelectorAll('.member-table tbody tr');
  const pagination = document.querySelector('.pagination-container');

  let currentFilter = 'Semua';
  verification.style.display = 'none';

  // Fungsi untuk menyaring tabel berdasarkan filter
  function filterTable(filter) {
    rows.forEach(row => {
      const status = row.querySelector('.status-box').textContent.trim();
      if (filter === 'Semua' || status === filter) {
        row.style.display = '';
      } else {
        row.style.display = 'none';
      }
    });
  }

  // Event listener untuk tombol filter
  filterButtonsContainer.querySelectorAll('button').forEach(button => {
    button.addEventListener('click', () => {
      const filter = button.textContent.trim();

      // Hapus kelas aktif dari semua tombol
      filterButtonsContainer.querySelectorAll('button').forEach(btn => btn.classList.remove('active'));

      // Tambahkan kelas aktif ke tombol yang diklik
      button.classList.add('active');
      currentFilter = filter;

      // Terapkan filter ke tabel
      filterTable(filter);
    });
  });

  // Fungsi untuk menampilkan detail verifikasi
  function showVerification(ktpFound) {
    page.dataset.view = 'verification';
    list.style.display = 'none';
    verification.style.display = 'block';
    filterButtonsContainer.style.display = 'none';
    tableHeader.style.display = 'none';
    pagination.style.display = 'none';

    const ktpContainer = verification.querySelector('.verification-ktp');
    const formFields = verification.querySelectorAll('.form-field input');

    if (ktpFound) {
      ktpContainer.innerHTML =
        '<img src="/images/ktp.png" alt="KTP Image" class="ktp-image">';
      formFields.forEach(input => (input.disabled = false));
    } else {
      ktpContainer.innerHTML =
        '<div class="ktp-not-found">KTP Tidak Ditemukan</div>';
      formFields.forEach(input => (input.disabled = true));
    }
  }

  // Fungsi untuk kembali ke list member
  function showList() {
    page.dataset.view = 'list';
    list.style.display = 'table-row-group';
    verification.style.display = 'none';
    filterButtonsContainer.style.display = 'flex';
    tableHeader.style.display = 'table-header-group';
  }

  // Event listener untuk tombol edit
  editButtons.forEach(button => {
    button.addEventListener('click', () => showVerification(true));
  });

  // Event listener untuk tombol verifikasi
  verifyButtons.forEach(button => {
    button.addEventListener('click', () => showVerification(false));
  });

  // Event listener untuk tombol kembali di detail verifikasi
  cancelButton.addEventListener('click', showList);
});


document.addEventListener('DOMContentLoaded', function () {
  const searchInput = document.querySelector('.search-input');
  const rows = document.querySelectorAll('.member-table tbody tr');

  // Fungsi untuk menyaring tabel berdasarkan pencarian
  function searchTable(query) {
    const lowerCaseQuery = query.toLowerCase();

    rows.forEach((row) => {
      const cells = Array.from(row.querySelectorAll('td'));
      const matches = cells.some((cell) => cell.textContent.toLowerCase().includes(lowerCaseQuery));

      row.style.display = matches ? '' : 'none';
    });
  }

  // Event listener untuk input pada search bar
  searchInput.addEventListener('input', function (event) {
    const query = event.target.value.trim();
    searchTable(query);
  });
});

document.addEventListener('DOMContentLoaded', function () {
  const rows = document.querySelectorAll('.member-table tbody tr');
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
    pageInfo.textContent = `Halaman ${currentPage} dari ${totalPages}`;

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
